<?php

namespace App\Http\Controllers\Admin\Posts;

use App\Models\Post;
use App\Models\Image;
use App\Models\Comment;
use App\Models\Category;
use App\Utils\ImageManger;
use Illuminate\Http\Request;
use App\Http\Requests\PostRequest;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Session;

class PostController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:posts');


    }
    public function index()
    {
        $posts = Post::withCount('comments')->when(request()->search, function ($query) {
            $query->where('title', 'LIKE', '%' . request()->search . '%');
        })->when(!is_null(request()->status), function ($query) {
            $query->where('status', request()->status);
        })->orderBy(request('order_by', 'id'), request('order_by_direction', 'desc'));

        $posts = request()->has('limit_by') ? $posts->limit(request('limit_by'))->get() : $posts->get();

        return view('admin.posts.index', compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = Category::active()->select('id','name')->get();
        return view('admin.posts.create',compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(PostRequest $request)
    {
        $request->validated();
        try {
            DB::beginTransaction();
            $this->commentAble($request);
            if (is_string($request->key_words)) {
                $keywordsArray = array_map('trim', explode(',', $request->key_words));
                $request->merge(['key_words' => json_encode($keywordsArray)]);
            }
            $post = Auth::guard('admin')->user()->posts()->create($request->except(['_token', 'images']));
            ImageManger::uploadImage($request, $post, null);

            DB::commit();
            Cache::forget('read_more_posts');
            Cache::forget('latest_posts');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->withErrors('errors', $e->getMessage());
        }
        Session::flash('success', "Post $request->title Created Successfuly!");
        return redirect()->back();
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $post = Post::with('comments')->findOrFail($id);
        return view('admin.posts.show', compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $post = Post::findOrFail($id);
        return view('admin.posts.edit',compact('post'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(PostRequest $request, string $id)
    {
        try {
            DB::beginTransaction();
            $request->validated();

            $post = Post::findOrFail($id);
            $this->commentAble($request);
            $post->update($request->except(['images','_token' , '_method']));
            if ($request->hasFile('images')) {
                ImageManger::deleteImages($post->images);
                ImageManger::uploadImage($request, $post, null);
            }
            Cache::forget('read_more_posts');
            Cache::forget('latest_posts');
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->withErrors(['errors'=>$e->getMessage()]);
        }
        return redirect()->route('admin.posts.index')->with('success', 'Post Updated Successfully!');

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $post = Post::findOrFail($id);
        ImageManger::deleteImages($post->images);
        $post->delete();
        return redirect()->route('admin.posts.index')->with('success', 'Post deleted successfully.');
    }
    public function changeStatus($id)
    {
        $post = Post::findOrFail($id);
        if ($post->status == 1) {
            $post->update(['status' => 0]);
            Cache::forget('read_more_posts');
            Cache::forget('latest_posts');
            return redirect()->back()->with('success', 'Post blocked successfully.');
        } else {
            $post->update(['status' => 1]);
            Cache::forget('read_more_posts');
            Cache::forget('latest_posts');
            return redirect()->back()->with('success', 'Post Active successfully.');
        }
        return redirect()->back();
    }
    public function deletePostImage(Request $request)
    {
        $image = Image::find($request->key);
        if (empty($image)) {
            return response()->json([
                'msg' => 'No Image Found',
                'status' => 201,
            ]);
        }
        // delete from image from
        ImageManger::deleteImageFromLocal($image->path);
        $image->delete();
        return response()->json([
            'msg' => 'Image Delete Successfully',
            'status' => 200,
        ]);
    }
    private function commentAble($request) {
        return  $request->comment_able == "on" ? $request->merge(['comment_able' => 1]) : $request->merge(['comment_able' => 0]);
     }
     public function deleteComment(string $id)
     {
        $comment = Comment::findOrFail($id);
        $comment->delete();
        return redirect()->back()->with('success', 'Comment deleted successfully.');
     }
}
