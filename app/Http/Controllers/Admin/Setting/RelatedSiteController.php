<?php

namespace App\Http\Controllers\Admin\Setting;

use App\Http\Controllers\Controller;
use App\Models\RelatedNewsSite;
use Illuminate\Http\Request;

class RelatedSiteController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:settings');
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $relatedSites = RelatedNewsSite::latest()->get();

        return view('admin.related-site.index', compact('relatedSites'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate(RelatedNewsSite::filterRequest());
        $site = RelatedNewsSite::create($request->only('name','url'));
        if (!$site) {
            return redirect()->back()->with('error', 'Try Agian Latter!');
        }
        return redirect()->route('admin.related-site.index')->with('success', 'Site has been added successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
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
    public function update(Request $request, string $id)
    {
        $request->validate(RelatedNewsSite::filterRequest());
        $relatedSite = RelatedNewsSite::findOrfail($id);

        $relatedSite->update($request->only('name','url'));
        if (!$relatedSite) {
            return redirect()->back()->with('error', 'Try Agian Latter!');
        }
        return redirect()->route('admin.related-site.index')->with('success', 'Site has been updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $relatedSite = RelatedNewsSite::findOrfail($id);
        $relatedSite->delete();

        return redirect()->route('admin.related-site.index')->with('success', 'Site has been deleted successfully.');
    }
}
