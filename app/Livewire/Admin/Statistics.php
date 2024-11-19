<?php

namespace App\Livewire\Admin;

use App\Models\Category;
use App\Models\Comment;
use App\Models\Post;
use App\Models\User;
use Livewire\Component;

class Statistics extends Component
{
    public function render()
    {
        $active_categories_count = Category::active()->count();
        $active_posts_count = Post::active()->count();
        $comment_count = Comment::count();
        $active_users_count = User::whereStatus(1)->count();
        return view('livewire.admin.statistics', compact('active_categories_count','active_posts_count','comment_count','active_users_count'));
    }
}
