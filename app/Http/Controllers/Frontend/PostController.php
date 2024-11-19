<?php

namespace App\Http\Controllers\frontend;

use App\Models\Post;
use App\Models\Comment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\CommentRequest;
use App\Models\User;
use App\Notifications\NewCommentNotify;
use Illuminate\Support\Facades\Notification;

class PostController extends Controller
{
    public function show($slug)
    {
        $mainPost = Post::active()->with(['comments' => function ($query) {
            $query->latest()->limit(3);
        }])->whereSlug($slug)->first();
        if (!$mainPost) {
           return view('frontend.404');
        }
        $mainPost->increment('num_of_views');
        $category = $mainPost->category;
        $posts_belongs_to_category = $category->posts()->active()->select('id', 'title', 'slug')->latest()->limit(5)->get();
        if (!$posts_belongs_to_category) {
            return view('errors.404');
         }

        return view('frontend.show', compact('mainPost', 'posts_belongs_to_category'));

    }
    public function addComment(CommentRequest $request)
    {
        if (!auth()->check()) {
            return response()->json([
                'message' => 'You need to log in to add a comment.'
            ], 401); // 401 Unauthorized
        }
        $request->validated();
        $comment = Comment::create([
            'comment' => $request->comment,
            'ip_address' => request()->ip(),
            'user_id' =>  auth()->id(),
            'post_id' => $request->post_id,
        ]);

        $post = Post::findOrfail($request->post_id);

        //if you want send all users excipt auth user this \!/
        // $users = User::where('id', '!=',auth()->user()->id);
        // Notification::send($users , new NewCommentNotify($comment , $post));

        if (auth()->user()->id != $request->user) {
             $post->user->notify(new NewCommentNotify($comment , $post));
        }


        $comment->load('user');
        if (!$comment) {
            return response()->json([
                'data' =>'operation failed',
               'status'=>403,
            ]);
        }
        return response()->json([
            'message'=>'Comment Stored Successfuly!',
            'comment' => $comment,
            'status'=>201,
        ]);
    }
    public function getAllPostComments($slug)
    {
        $post = Post::active()->whereSlug($slug)->first();
        $comments = $post->comments()->with('user')->latest()->get();
        return response()->json($comments);
    }
}
