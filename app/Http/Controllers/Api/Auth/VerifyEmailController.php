<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Notifications\SendOtpVerifyUserEmailNotify;
use Ichtrojan\Otp\Otp;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

    class VerifyEmailController extends Controller
{
    protected $otp;
    public function __construct()
    {
        $this->otp = new Otp();
    }
    public function VerifyEmail(Request $request)
    {
        $request->validate(['token' => ['required', 'min:6', 'max:6']]);
        $user = Auth::guard('sanctum')->user();
        $otp2 = $this->otp->validate($user->email , $request->token);
        if ($otp2->status == false) {
            return apiResponse(401,'Code is invalid!');
        }
        $user->update(['email_verified_at'=>now()]);
        return apiResponse(200,'Email verified successfully!');
    }
    public function sendAgain()
    {
        $user = Auth::guard('sanctum')->user();
        $user->notify(new SendOtpVerifyUserEmailNotify());
        return apiResponse(200,'Verification code has been sent again!');
    }
}
