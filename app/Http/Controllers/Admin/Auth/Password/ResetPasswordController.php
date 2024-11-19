<?php

namespace App\Http\Controllers\Admin\Auth\Password;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use Illuminate\Http\Request;

class ResetPasswordController extends Controller
{
   public function showResetForm($email)
   {
    return view('admin.auth.passwords.reset',['email' => $email]);
   }
   public function resetPassword(Request $request)
   {
    $request->validate([
        'email' =>'required|email',
        'password' => 'required|min:8|confirmed',
        'password_confirmation' => 'required',
    ]);
    $admin = Admin::whereEmail($request->email)->first();
    if(!$admin){
       return redirect()->back()->withErrors(['email'=>'Try Again Latter!']);
    }
    $admin->update(['password' => bcrypt($request->password)]);
    return redirect()->route('admin.login.')->with('success','Yor Password Updated Successfully');

   }
}
