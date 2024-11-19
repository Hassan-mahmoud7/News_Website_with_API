<?php

namespace App\Http\Controllers\Api\Auth\Password;

use App\Models\User;
use Ichtrojan\Otp\Otp;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\ResetPasswordRequest;

class ResetPasswordController extends Controller
{
    protected $otp;
    public function __construct()
    {
        $this->otp = new Otp();
    }
    public function resetPassword(ResetPasswordRequest $request)
    {

        $otp2 = $this->otp->validate($request->email, $request->token);
        if ($otp2->status == false) {
            return apiResponse(401, 'code is invalid or expired');
        }
        $user = User::where('email', $request->email)->first();
        if (!$user) {
            return apiResponse(404, 'User not found');
        }
        $user->update(['password' =>  $request->password,]);
        return apiResponse(200, 'Password Updated successfully');
    }
}
