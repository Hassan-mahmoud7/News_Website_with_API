<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\RateLimiter;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'email' => ['required', 'email', 'max:90'],
            'password' => ['required', 'min:8', 'max:25'],
        ]);
        if (RateLimiter::tooManyAttempts($request->ip(),3)) {
            $time = RateLimiter::availableIn($request->ip());
            return apiResponse(429, 'Too Many Attempts, Please Try Again After 1 Minute :' . $time . ' seconds');
        }
        RateLimiter::increment($request->ip());
        $remain  =RateLimiter::remaining($request->ip(),3);
        $user = User::whereEmail($request->email)->first();
        if ($user && Hash::check($request->password, $user->password)) {
            RateLimiter::clear($request->ip());
            $token = $user->createToken($user->email,[],now()->addMinutes(120))->plainTextToken;
            return apiResponse(200, 'User Loged Successfully.', ['token' => $token]);
        }
        return apiResponse(401, 'Credentials does Not Match!',['remaning' => $remain]);
    }
    public function logout()
    {
        $user = Auth()->guard('sanctum')->user();
        if (isset($user)) {
            $user->currentAccessToken()->delete();
            return apiResponse(200, 'User Token Delete Successfully.');
        }
    }
}
