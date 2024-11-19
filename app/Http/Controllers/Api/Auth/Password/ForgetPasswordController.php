<?php

namespace App\Http\Controllers\Api\Auth\Password;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Notifications\SendOtpResetPasswordNotify;
use Illuminate\Http\Request;

class ForgetPasswordController extends Controller
{
    public function sendOtp(Request $request)
    {
        $request->validate(['email'=>['required','email','max:70','exists:users,email']]);
        $user = User::whereEmail($request->email)->first();
        if (!$user) {
            return apiResponse(404,'User not found');
        }
        $user->notify(new SendOtpResetPasswordNotify());
        return apiResponse(200,'Verification email sent successfully');
    }
}
