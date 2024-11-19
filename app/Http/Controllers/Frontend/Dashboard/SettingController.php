<?php

namespace App\Http\Controllers\Frontend\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Frontend\ChangePasswordRequest;
use App\Http\Requests\Frontend\UserSettingRequest;
use App\Models\User;
use App\Utils\ImageManger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class SettingController extends Controller
{
    public function update(UserSettingRequest $request)
    {
        $request->validated();
        $user = User::findOrFail(auth()->user()->id);
        $user->update($request->except(['_token','image']));
            ImageManger::uploadImage($request,null,$user);
        return redirect()->back()->with('success' , 'Profile Data Updated Successfully!');
    }
    public function changePassword(ChangePasswordRequest $request)
    {
        $request->validated();
        $user = User::findOrFail(auth()->user()->id);
        if (!Hash::check($request->current_password , $user->password)) {
            Session::flash('error' , 'Password dose not match !');
            return redirect()->back();
        }
        $user->update(['password' => Hash::make($request->password)]);
        Session::flash('success' , 'You Password Changed Successfilly !');
        return redirect()->back();
    }
}
