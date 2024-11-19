<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Post;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $request->validate(['search'=>'nullable|string|max:100']);
        $keyWord = strip_tags($request->search);  // strip_tags() => This is for input security, it is forbidden to write anything tag Html or queryDSL like (falter php security)
        $posts =  Post::active()->ActiveUser()->activeCategory()->where('title','LIKE', '%'.$keyWord.'%')
        ->orWhere('desc','LIKE', '%'.$keyWord.'%')->active()->ActiveUser()->activeCategory()->paginate(12);
        return view('frontend.search', compact('posts'));
    }
}
