<?php

namespace App\Http\Controllers\Admin\Profile;

use App\Http\Controllers\Controller;
use App\Http\Requests\ProfileAdminRequest;
use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ProfileController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:profile');
    }
    public function index()
    {
        return view('admin.profile.index');
    }
    public function update(ProfileAdminRequest $request)
    {
        $request->validated();
        $admin = Admin::findOrFail(auth('admin')->user()->id);
        if(!Hash::check($request->password,$admin->password)){
            return redirect()->back()->with('error','Sorry Can Not Update Profile Data.');
        }
        $admin->update($request->except('_token','password'));
        return redirect()->route('admin.home')->with('success', 'Profile updated successfully.');

    }
}
