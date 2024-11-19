<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Post;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Category;

class CategoryController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke($slug)
    {
        $category = Category::active()->where('slug', $slug)->first();
        if (!$category) {
            return redirect()->back()->with('warning' , 'Try again latter!');
        }
        $posts = $category->posts()->active()->paginate(9);
        if (!$posts) {
            return redirect()->back()->with('warning' , 'Try again latter!');
        }
        return view('frontend.category-posts', compact('posts','category'));

    }
}
