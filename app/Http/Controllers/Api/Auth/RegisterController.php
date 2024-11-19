<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserRequest;
use App\Jobs\SendOtpTask;
use App\Models\User;
use App\Notifications\SendOtpVerifyUserEmailNotify;
use App\Utils\ImageManger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class RegisterController extends Controller
{
    public function register(UserRequest $request)
    {
        $request->validated();
        try {
            DB::beginTransaction();
            $user = $this->userCreate($request);
            if (!$user) {
                return apiResponse('400','Try Again Latter!');
            }
            ImageManger::uploadImage($request, null, $user);
            $token = $user->createToken($request->email,[],now()->addMinutes(120))->plainTextToken;
            SendOtpTask::dispatch($user);
            DB::commit();
            return apiResponse(200, 'User Created Successfully', ['token' => $token]);
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Error From Registration proccess :' . $e->getMessage());
            return apiResponse(500, 'Enternal Server Error');
        }
    }
    protected function userCreate($request)
    {
        $user = User::create([
            'name' => $request->post('name'),
            'username' => $request->post('username'),
            'email' => $request->post('email'),
            'phone' => $request->post('phone'),
            'country' => $request->post('country'),
            'city' => $request->post('city'),
            'street' => $request->post('street'),
            'floor' => $request->post('floor'),
            'password' => $request->post('password'),
        ]);
        return $user;
    }
}
