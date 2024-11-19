<?php

namespace App\Http\Controllers\Admin\Authorization;

use App\Http\Controllers\Controller;
use App\Http\Requests\AuthorizationRequest;
use App\Models\Authorization;
use Illuminate\Http\Request;

class AuthorizationController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:authorizations');
    }
    public function index()
    {
        $authorizations = Authorization::get();
        return view('admin.authorizations.index', compact('authorizations'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.authorizations.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(AuthorizationRequest $request)
    {
        $request->validated();
        $authorization = new Authorization;
        self::roles($request,$authorization);
        return redirect()->back()->with('success', 'Role created successfully.');
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
    public function update(AuthorizationRequest $request, string $id)
    {
        $request->validated();
        $authorization = Authorization::findOrFail($id);
        self::roles($request,$authorization);

        return redirect()->back()->with('success', 'Role updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $role = Authorization::findOrFail($id);
        if ($role->admins->count() > 0) {
            return redirect()->back()->with('error', 'Please Delete Related Admin First!');
        }
        $role = $role->delete();
        if (!$role) {
            return redirect()->back()->with('error', 'Try Again Latter!');
        }
        return redirect()->route('admin.authorizations.index')->with('success', 'Authorization deleted successfully.');
    }
    private static function roles($request , $authorization){
        $authorization->role = $request->role;
        $authorization->permissions = json_encode($request->permissions);
        $authorization->save();
    }
}
