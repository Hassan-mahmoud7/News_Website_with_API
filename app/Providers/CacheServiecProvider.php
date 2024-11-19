<?php

namespace App\Providers;

use App\Models\Post;
use App\Models\Category;
use App\Models\RelatedNewsSite;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\ServiceProvider;

class CacheServiecProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        // Read More Posts
        if (!Cache::has('read_more_posts')) {
            $read_more_posts = Post::active()->select('id','title','slug')->latest()->limit(15)->get();
            Cache::remember('read_more_posts',3600,function() use($read_more_posts){
                return $read_more_posts;
            });
        }
        // Latest Posts
        if (!Cache::has('latest_posts')) {
            $latest_posts = Post::active()->select('id','title','slug')->latest()->limit(5)->get();
            Cache::remember('latest_posts',3600,function() use($latest_posts){
                return $latest_posts;
            });
        }
        // Greatest Posts by Views
        if (!Cache::has('greatest_posts_comments')) {
            $greatest_posts_comments =Post::active()->withCount('comments')->orderBy('comments_count','desc')->limit(5)->get();
            Cache::remember('greatest_posts_comments', 3600, function () use($greatest_posts_comments) {
                return $greatest_posts_comments;
            });
        }

        $read_more_posts = Cache::get('read_more_posts');
        //shera Date in View and get data from Cache
        view()->share([
            'read_more_posts' => $read_more_posts,
            'greatest_posts_comments' => Cache::get('greatest_posts_comments'),
            'latest_posts' => Cache::get('latest_posts'),

        ]);

    }
}
