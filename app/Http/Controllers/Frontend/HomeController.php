<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Post;
use Illuminate\Http\Request;

class HomeController extends Controller
{

    public function index()
    {
        $posts = Post::active()->activeUser()->activeCategory()->with('images')->latest()->limit(5)->get();
        $all_posts = Post::active()->activeUser()->activeCategory()->with('images')->latest()->paginate(9);
        $greatest_posts_views = Post::active()->activeUser()->activeCategory()->orderBy('num_of_views','desc')->limit(3)->get();
        $oldest_news = Post::active()->activeUser()->activeCategory()->oldest()->take(3)->get();
        $greatest_posts_comments =Post::active()->activeUser()->activeCategory()->withCount('comments')->orderBy('comments_count','desc')->limit(3)->get();
        $categories = Category::has('posts' , '>=' , 2)->active()->get();
        $categories_with_posts = $categories->map(function($category){
            $category->posts = $category->posts()->active()->limit(5)->get();
            return $category;
        });
        $category = Category::active()->with('posts')->get();
        if (!$category || !$categories_with_posts || !$posts || !$greatest_posts_views || !$greatest_posts_comments || !$categories) {
            return redirect()->back()->with('warning' , 'Try again latter!');
        }

        return view('frontend.index',compact('posts','all_posts' ,'greatest_posts_views','oldest_news','greatest_posts_comments','categories_with_posts'));

    }
}
