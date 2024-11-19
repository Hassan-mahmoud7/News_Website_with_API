<?php

namespace App\Http\Controllers\Admin\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\AdminRequest;
use App\Models\Admin;
use App\Models\Authorization;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdmintController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:admins');
    }
    public function index()
    {

        $admins = Admin::where('id', '!=', Auth::guard('admin')->user()->id)->when(request()->search, function ($query) {
            $query->where('name', 'LIKE', '%' . request()->search . '%')
                ->orwhere('username', 'LIKE', '%' . request()->search . '%')
                ->orwhere('email', 'LIKE', '%' . request()->search . '%');
        })->when(!is_null(request()->status), function ($query) {
            $query->where('status', request()->status);
        })->orderBy(request('order_by', 'id'), request('order_by_direction', 'desc'));

        $admins = request()->has('limit_by') ? $admins->limit(request('limit_by'))->get() : $admins->get();


        return view('admin.admins.index', compact('admins'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $authorizations = Authorization::select('id', 'role')->get();
        return view('admin.admins.create', compact('authorizations'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(AdminRequest $request)
    {
        $request->validated();
        $admin = Admin::create($request->except(['_token', 'password_confirmation']));
        if (!$admin) {
            return redirect()->back()->with('error', 'Something went wrong. Please try again.');
        }
        return redirect()->route('admin.admins.index')->with('success', 'New Admin created successfully.');
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
        $admin = Admin::findOrFail($id);
        $authorizations = Authorization::select('id', 'role')->get();
        return view('admin.admins.edit', compact('admin', 'authorizations'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(AdminRequest $request, string $id)
    {
        $request->validated();
        $admin = Admin::findOrFail($id);
        if ($request->password) {
            $adminResult = $admin->update($request->except(['_token', 'password_confirmation']));
        }else {
            $adminResult = $admin->update($request->except(['_token', 'password' ,'password_confirmation']));

        }
        if (!$adminResult) {
            return redirect()->back()->with('error', 'Something went wrong. Please try again.');
        }
        return redirect()->route('admin.admins.index')->with('success', 'New Admin Updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $admin = Admin::findOrFail($id);
        $adminResult = $admin->delete();
        if (!$adminResult) {
            return redirect()->back()->with('error', 'Try Again litter!');
        }
        return redirect()->route('admin.admins.index')->with('success', 'Admin deleted successfully.');
    }
    public function changeStatus($id)
    {
        $admin = Admin::findOrFail($id);
        if ($admin->status == 1) {
            $admin->update(['status' => 0]);
            return redirect()->back()->with('success', 'Admin blocked successfully.');
        } else {
            $admin->update(['status' => 1]);
            return redirect()->back()->with('success', 'Admin Active successfully.');
        }
        return redirect()->back();
    }
}
