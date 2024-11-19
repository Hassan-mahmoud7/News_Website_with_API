<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\CategoryCollection;
use App\Http\Resources\CommentCollection;
use App\Http\Resources\PostCollection;
use App\Http\Resources\PostResource;
use App\Models\Category;
use App\Models\Post;
use Illuminate\Http\Request;

class GeneralController extends Controller
{
    public function getPosts()
    {

        $query = Post::query()->with(['user', 'category', 'admin', 'images'])->activeUser()->activeCategory()->active();
        if (!$query) {
            return apiResponse(404, 'Posts not found');
        }
        $posts = clone $query->latest()->paginate(4);

        if (!$posts) {
            return apiResponse(404, 'Posts not found');
        }
        $latest_posts = $this->latestPosts(clone $query);
        $oldest_posts = $this->oldestPosts(clone $query);
        $popular_posts = $this->popularPosts(clone $query);
        $most_read_posts = $this->mostReadPosts(clone $query);
        $category_with_posts = $this->getCategoryByPosts();
        $data = [
            'all_posts' => (new PostCollection($posts))->response()->getData(true),
            'latest_posts' => new PostCollection($latest_posts),
            'oldest_posts' => new PostCollection($oldest_posts),
            'popular_posts' => new PostCollection($popular_posts),
            'category_with_posts' => new CategoryCollection($category_with_posts),
            'most_read_posts' => new PostCollection($most_read_posts),
        ];
        return apiResponse('200', 'Success', $data);
    }
    public function showPost($slug)
    {
        $post = Post::with(['user', 'category', 'admin', 'images'])->activeUser()->activeCategory()->active()->where('slug', $slug)->first();

        if (!$post) {
            return apiResponse(404, 'Post not found');
        }
        return apiResponse(200, 'this is single post', new PostResource($post));
    }
    public function getCommentsPost($slug)
    {
        $post = Post::active()->activeUser()->activeCategory()->whereSlug($slug)->first();
        if (!$post) {
            return apiResponse(404, 'Post not found');
        }
        $comments = $post->comments()->latest()->get();
        if (!$comments) {
            return apiResponse(404, 'Comments not found');
        }
        return apiResponse('200', 'This Post Comments', new CommentCollection($comments));
    }
    public function searchPosts(Request $request)
    {
        $query = Post::query()->with(['user', 'category', 'admin', 'images'])->activeUser()->activeCategory()->active()
            ->where('title', 'LIKE', '%' . $request->keyword . '%')
            ->orWhere('desc', 'LIKE', '%' . $request->keyword . '%')->get();
        if ($query->count() === 0) {
            return apiResponse(404, "No results will be found that match you. $request->keyword");
        }
        return apiResponse(200, 'Search Posts Title', new PostCollection($query));
    }
    private function latestPosts($query)
    {
        $latest_posts = $query->latest()->limit(4)->get();
        if (!$latest_posts) {
            return apiResponse(404, 'Posts not found');
        }
        return $latest_posts;
    }
    private function oldestPosts($query)
    {
        $oldest_posts = $query->reorder()->oldest()->limit(4)->get();
        if (!$oldest_posts) {
            return apiResponse(404, 'Posts not found');
        }
        return $oldest_posts;
    }
    private function popularPosts($query)
    {
        $popular_posts =  $query->withCount('comments')->orderBy('comments_count', 'desc')->limit(4)->get();
        if (!$popular_posts) {
            return apiResponse(404, 'Posts not found');
        }
        return $popular_posts;
    }
    private function mostReadPosts($query)
    {
        $most_read_posts =  $query->orderBy('num_of_views', 'desc')->limit('3')->get();
        if (!$most_read_posts) {
            return apiResponse(404, 'Posts not found');
        }
        return $most_read_posts;
    }
    private function getCategoryByPosts()
    {
        $categories = Category::active()->get();
        if (!$categories) {
            return apiResponse(404, 'Posts not found');
        }
        $category_with_posts = $categories->map(function ($category) {
            $category->posts = $category->posts()->active()->limit(4)->get();
            return $category;
        });
        if (!$category_with_posts) {
            return apiResponse(404, 'Posts not found');
        }
        return $category_with_posts;
    }
}
