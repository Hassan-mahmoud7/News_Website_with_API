<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Contact;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class GeneralSearchController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:users')->only('searchUsers');
        $this->middleware('can:posts')->only('searchPosts');
        $this->middleware('can:categories')->only('searchCategorys');
        $this->middleware('can:contacts')->only('searchContacts');

    }
    public function search(Request $request)
    {
        if ($request->option == 'user') {
            return $this->searchUsers($request);
        } elseif ($request->option == 'post') {
            return  $this->searchPosts($request);
        } elseif ($request->option == 'category') {
            return $this->searchCategorys($request);
        } elseif ($request->option == 'contact') {
            return $this->searchContacts($request);
        } else {
            Session::flash('error', 'Invalid search option');
            return redirect()->back();
        }
    }
    private function searchUsers($request)
    {
        $users = User::where('name', 'LIKE', '%' . $request->keyword . '%')->get();
        return view('admin.users.index', compact('users'));
    }
    private function searchPosts($request)
    {
        $posts = Post::where('title', 'LIKE', '%' . $request->keyword . '%')->get();
        return view('admin.posts.index', compact('posts'));
    }
    private function searchCategorys($request)
    {
        $categories = Category::where('name', 'LIKE', '%' . $request->keyword . '%')->get();
        return view('admin.categories.index', compact('categories'));
    }
    private function searchContacts($request)
    {
        $contacts = Contact::where('name', 'LIKE', '%' . $request->keyword . '%')->get();
        return view('admin.contacts.index', compact('contacts'));
    }
}
