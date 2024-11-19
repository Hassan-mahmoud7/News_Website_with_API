<?php

namespace App\Http\Controllers\Api\Account;

use App\Models\User;
use App\Utils\ImageManger;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\Frontend\UserSettingRequest;
use App\Http\Requests\Frontend\ChangePasswordRequest;

class AccountUserController extends Controller
{
    public function index(Request $request)
    {
        return UserResource::make($request->user());
    }
    public function updateSetting(UserSettingRequest $request, $user_id)
    {
        $request->validated();
        $user = User::find(request()->user()->id);
        if (!$user) {
            return apiResponse(404, 'Opps... Something was wrong!');
        }
        $user->update($request->except(['_method', 'image']));
        ImageManger::uploadImage($request, null, $user);
        return apiResponse(200, 'Profile Data Updated Successfully!');
    }
    public function changePassword(ChangePasswordRequest $request, $user_id)
    {
        $request->validated();
        $user = User::find(auth()->guard('sanctum')->user()->id);
        if (!$user) {
            return apiResponse(404, 'Opps... Something was wrong!');
        }
        if (!Hash::check($request->current_password, $user->password)) {
            return apiResponse(400, 'Password dose not match !');
        }
        $user->update(['password' => $request->password]);
        return apiResponse(200, 'You Password Changed Successfilly !');
    }
}
