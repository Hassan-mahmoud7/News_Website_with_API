<?php

namespace App\Livewire\Admin;

use App\Models\Comment;
use App\Models\Post;
use Livewire\Component;

class LatestPostsComments extends Component
{
    public function render()
    {
        $latest_posts = Post::with('user')->WithCount('comments')->active()->latest()->take(6)->get();
        $latest_comments = Comment::with(['user','post'])->latest()->take(6)->get();
        return view('livewire.admin.latest-posts-comments',compact('latest_posts','latest_comments'));
    }
}
