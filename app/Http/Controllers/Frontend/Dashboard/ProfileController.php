<?php

namespace App\Http\Controllers\Frontend\Dashboard;

use App\Models\Post;
use App\Models\Image;
use App\Models\Comment;
use App\Utils\ImageManger;
use Illuminate\Http\Request;
use App\Http\Requests\PostRequest;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Session;

class ProfileController extends Controller
{
    public function index()
    {
        // auth()->user()->unreadNotifications->markAsRead();
        $posts = auth()->user()->posts()->active()->latest()->with(['images'])->get();
        return view('frontend.account.profile', compact('posts'));
    }
    public function storePost(PostRequest $request)
    {
        $request->validated();
        try {
            DB::beginTransaction();
            $this->commentAble($request);
            if (is_string($request->key_words)) {
                $keywordsArray = array_map('trim', explode(',', $request->key_words));
                $request->merge(['key_words' => json_encode($keywordsArray)]);
            }
            ///// 1 Solution method
            // $request->merge(['user_id' => auth()->user()->id]);
            // $post = Post::create($request->except(['_token' , 'images']));
            //// 2 Solution method
            $post = auth()->user()->posts()->create($request->except(['_token', 'images']));
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
    public function deletePost(Request $request)
    {
        // $post = Post::findOrFail($request->id); anthor
        $post = Post::whereSlug($request->slug)->first();
        if (empty($post)) {
            abort('404');
        }
        ImageManger::deleteImages($post->images);
        $post->delete();
        return redirect()->back()->with('success', 'Post Delete successfully!');
    }
    public function getComment($id)
    {
        $comments = Comment::with(['user'])->where('post_id', $id)->get();
        if (!$comments) {
            return response()->json([
                'data' => null,
                'msg' => 'No Comment Found',
            ]);
        }
        return response()->json([
            'data' => $comments,
            'msg' => 'Comments Fetched Successfully',
        ]);
    }
    public function showEditForm($slug)
    {
        $post = Post::with(['images'])->whereSlug($slug)->first();
        if (empty($post)) {
            abort('404');
        }
        return view('frontend.account.edit-post', compact('post'));
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
    public function updatePost(PostRequest $request)
    {
        try {
            DB::beginTransaction();
            $request->validated();

            $post = Post::findOrFail($request->post_id);
            $this->commentAble($request);
            $post->update($request->except(['images','_token' , '_method','post_id']));
            if ($request->hasFile('images')) {
                ImageManger::deleteImages($post->images);
                ImageManger::uploadImage($request, $post, null);
            }
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->withErrors(['errors'=>$e->getMessage()]);
        }
        return redirect()->route('frontend.dashboard.profile')->with('success', 'Post Updated Successfully!');


    }
    private function commentAble($request) {
       return  $request->comment_able == "on" ? $request->merge(['comment_able' => 1]) : $request->merge(['comment_able' => 0]);
    }
}
