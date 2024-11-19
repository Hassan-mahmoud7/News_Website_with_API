<?php

use App\Http\Controllers\Api\Account\AccountUserController;
use App\Http\Controllers\Api\Account\NotificationController;
use App\Http\Controllers\Api\Account\UserPostsController;
use App\Http\Controllers\Api\Auth\LoginController;
use App\Http\Controllers\Api\Auth\Password\ForgetPasswordController;
use App\Http\Controllers\Api\Auth\Password\ResetPasswordController;
use App\Http\Controllers\Api\Auth\RegisterController;
use App\Http\Controllers\Api\Auth\VerifyEmailController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ContactController;
use App\Http\Controllers\Api\GeneralController;
use App\Http\Controllers\Api\SettingController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::group(['prefix' => 'auth/'], function () {
    // //********************/ Login / *************************//
    Route::post('login', [LoginController::class, 'login']);
    // //********************/ Get Auth token (sanctum) /************************//
    Route::post('register', [RegisterController::class, 'register'])->middleware('throttle:register');
    // //********************/ Verify Email / *************************//
    Route::controller(VerifyEmailController::class)->middleware('throttle:login')->prefix('verify/email')->group(function () {
        Route::post('', 'VerifyEmail');
        Route::get('/send-again', 'sendAgain');
    });
});

Route::group(['middleware' => ['auth:sanctum', 'VarifyEmail']], function () {
    // //********************/ Logout / *************************//
    Route::delete('auth/logout', [LoginController::class, 'logout']);
    Route::group(['middleware' => ['checkeUserStatus']], function () {
        //********************/ Account Settings / *************************//
        Route::controller(AccountUserController::class)->prefix('account/user/')->group(function () {
            // Get User
            Route::get('', 'index');
            // Update User
            Route::put('update/{user_id}', 'updateSetting')->middleware('throttle:updateSettingUser');
            // Change User Password
            Route::put('change/password/{user_id}', 'changePassword')->middleware('throttle:password');
        });
        //********************/ User Posts /************************//
        Route::controller(UserPostsController::class)->prefix('account/user/posts/')->group(function () {
            // Get All Posts
            Route::get('/', 'getPosts');
            // Store Post
            Route::post('store', 'storePost');
            // Update Comment
            Route::put('update/{post_id}', 'updatePost');
            // Destroy Post
            Route::delete('destroy/{slug}', 'destroyPost');
            // Get Comments Post
            Route::get('comments/{post_id}', 'getCommentsPost');
            // Add Comment to Post
            Route::post('comment/store', 'storeComment')->middleware('throttle:comment');
        });
        //********************/ User Notifications /************************//
        Route::controller(NotificationController::class)->prefix('user/notifications')->group(function () {
            Route::get('/', 'getUserNotification');
            Route::get('/read/{id}', 'readUserNotification');
        });
    });
});
//********************/ Forget Password / *************************//
Route::post('password/email', [ForgetPasswordController::class, 'sendOtp'])->middleware('throttle:password');
//********************/ Reset Password / *************************//
Route::post('password/reset', [ResetPasswordController::class, 'resetPassword'])->middleware('throttle:password');
//********************/ Get Posts /************************//
Route::controller(GeneralController::class)->group(function () {
    // Get All Posts
    Route::get('posts', 'getPosts');
    // Get Posts Search
    Route::post('posts/search', 'searchPosts');
    // Get Singel Post
    Route::get('post/show/{slug}', 'showPost');
    // Get comments
    Route::get('post/comments/{slug}', 'getCommentsPost');
});
//********************/ Get categories /************************//
Route::controller(CategoryController::class)->group(function () {
    Route::get('categories', 'getCategories');
    // Get category with Posts
    Route::get('category/{slug}/posts', 'getCategoryPosts');
});
//********************/ Get Contact /************************//
Route::post('contacts/store', [ContactController::class, 'storeContact'])->middleware('throttle:contact');
// //********************/ Get Settings /************************//
Route::get('settings', [SettingController::class, 'getSettings']);
