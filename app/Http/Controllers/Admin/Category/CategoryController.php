<?php

namespace App\Http\Controllers\Admin\Category;

use App\Http\Controllers\Controller;
use App\Http\Requests\CategoryRequest;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:categories');
    }
    public function index()
    {

        $categories = Category::withCount('posts')->when(request()->search, function ($query) {
            $query->where('name', 'LIKE', '%' . request()->search . '%');
        })->when(!is_null(request()->status), function ($query) {
            $query->where('status', request()->status);
        })->orderBy(request('order_by', 'id'), request('order_by_direction', 'desc'));

        $categories = request()->has('limit_by') ? $categories->limit(request('limit_by'))->get() : $categories->get();
        // return $categories;
        return view('admin.categories.index', compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.categories.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(CategoryRequest $request)
    {
        $category = Category::create($request->only(['name','small_desc','status']));
        if (!$category) {
            return redirect()->route('admin.categories.index')->with('error', 'Try Again Latter!');
        }
        return redirect()->route('admin.categories.index')->with('success', 'Category Created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $category = Category::findOrFail($id);
        return view('admin.categories.show', compact('category'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(CategoryRequest $request, string $id)
    {
        $category = Category::findOrfail($id);
        if (!$category) {
            return redirect()->route('admin.categories.index')->with('error', 'Try Again Latter!');
        }
        $category->update($request->except(['_token','_method']));
        return redirect()->route('admin.categories.index')->with('success', 'Category Update successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $category = Category::findOrFail($id);
        $category->delete();
        return redirect()->route('admin.categories.index')->with('success', 'Category deleted successfully.');
    }
    public function changeStatus(string $id)
    {
        $category = Category::findOrFail($id);
        if ($category->status == 1) {
            $category->update(['status' => 0]);
            return redirect()->back()->with('success', 'Category blocked Successfully.');
        } else {
            $category->update(['status' => 1]);
            return redirect()->back()->with('success', 'Category Active Successfully.');
        }
        return redirect()->back();
    }
}
