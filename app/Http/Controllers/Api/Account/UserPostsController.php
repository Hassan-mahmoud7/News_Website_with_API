<?php

namespace App\Http\Controllers\Api\Account;

use App\Models\Post;
use App\Models\Comment;
use App\Utils\ImageManger;
use Illuminate\Http\Request;
use App\Http\Requests\PostRequest;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use App\Http\Requests\CommentRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use App\Http\Resources\PostCollection;
use App\Notifications\NewCommentNotify;
use App\Http\Resources\CommentCollection;

class UserPostsController extends Controller
{
    public function getPosts()
    {
        $user = Auth::guard('sanctum')->user();
        if (!$user) {
            return apiResponse(401, 'Unauthorized');
        }
        $posts = $user->posts()->latest()->active()->activeCategory()->get();
        if (!$posts) {
            return apiResponse(404, 'No Posts To This User');
        }
        return apiResponse(200, 'This Is User Posts', new PostCollection($posts));
    }
    public function storePost(PostRequest $request)
    {

        $request->validated();
        try {
            DB::beginTransaction();
            if (is_string($request->key_words)) {
                $keywordsArray = array_map('trim', explode(',', $request->key_words));
                $request->merge(['key_words' => json_encode($keywordsArray)]);
            }
            $post = auth()->guard('sanctum')->user()->posts()->create($request->except(['images']));
            ImageManger::uploadImage($request, $post, null);

            DB::commit();
            Cache::forget('read_more_posts');
            Cache::forget('latest_posts');
            return apiResponse(201, 'Post Created Successfully');
        } catch (\Exception $e) {
            Log::error("Error Store User Post :" . $e->getMessage());
            return apiResponse(400, 'Bad Request');
        }
    }
    public function destroyPost($slug)
    {
        $post = auth()->guard('sanctum')->user()->posts()->where('slug', $slug)->first();
        if (!$post) {
            return apiResponse(404, 'Post Not Found');
        }
        ImageManger::deleteImages($post->images);
        $post->delete();
        Cache::forget('read_more_posts');
        Cache::forget('latest_posts');
        return apiResponse(200, 'Post Deleted Successfully');
    }
    public function getCommentsPost($post_id)
    {
        $post = Auth::guard('sanctum')->user()->posts()->where('id', $post_id)->first();
        if (!$post) {
            return apiResponse(404, 'Post Not Found');
        }
        $comments = $post->comments()->with('user')->latest()->get();
        if ($comments->count() > 0) {
            return apiResponse(200, 'This Is User Posts', new CommentCollection($comments));
        }
        return apiResponse(404, 'Post Comments Less Than Zero');
    }
    public function updatePost(PostRequest $request, $post_id)
    {
        $request->validate(array_merge(
            (new PostRequest)->rules(),
            ['images.*' => ['nullable', 'image', 'mimes:jpeg,png,jpg,gif', 'max:2048']]
        ));
        try {
            DB::beginTransaction();
            $post = Auth::guard('sanctum')->user()->posts()->find($post_id);
            if (!$post) {
                return apiResponse(404, 'Post Not Found');
            }
            $post->update($request->except(['images', '_method']));
            if ($request->hasFile('images')) {
                ImageManger::deleteImages($post->images);
                ImageManger::uploadImage($request, $post, null);
            }
            DB::commit();
            Cache::forget('read_more_posts');
            Cache::forget('latest_posts');
            return apiResponse(200, 'Post Updated Successfully');
        } catch (\Exception $e) {
            Log::error("Error Update User Post :" . $e->getMessage());
            return apiResponse(400, 'Bad Request');
        }
    }
    public function storeComment(CommentRequest $request)
    {
        $user = Auth::guard('sanctum')->user();
        if (!$user) {
            return apiResponse(401, 'You need to log in to add a comment.');
        }
        $post = Post::find($request->post_id);
        if (!$post) {
            return apiResponse(404, 'Post not found');
        }
        $comment = $post->comments()->create([
            'comment' => $request->comment,
            'ip_address' => request()->ip(),
            'user_id' =>  $user->id,
        ]);
        if ($user->id != $post->user->id) {
            $post->user->notify(new NewCommentNotify($comment, $post));
        }
        $comment->load('user');
        if (!$comment) {
            return apiResponse(403, 'Try Again Latter!');
        }
        return apiResponse(201, 'Comment Stored Successfuly!', $comment);

    }
}
