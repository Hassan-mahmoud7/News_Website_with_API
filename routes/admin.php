<?php

use App\Http\Controllers\Admin\Admin\AdmintController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\User\UserController;
use App\Http\Controllers\Admin\Auth\LoginController;
use App\Http\Controllers\Admin\Posts\PostController;
use App\Http\Controllers\Admin\Setting\SettingController;
use App\Http\Controllers\Admin\Category\CategoryController;
use App\Http\Controllers\Admin\Auth\Password\ResetPasswordController;
use App\Http\Controllers\Admin\Auth\Password\ForgetPasswordController;
use App\Http\Controllers\Admin\Authorization\AuthorizationController;
use App\Http\Controllers\Admin\Contact\ContactController;
use App\Http\Controllers\Admin\GeneralSearchController;
use App\Http\Controllers\Admin\HomeController;
use App\Http\Controllers\Admin\Notification\NotificationController;
use App\Http\Controllers\Admin\Profile\ProfileController;
use App\Http\Controllers\Admin\Setting\RelatedSiteController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/test',function(){
//     return view('admin.password.reset');
// });
//admin auth gest
Route::group(['prefix' => '/admin//', 'as' => 'admin.'], function () {
    Route::controller(LoginController::class)->group(function(){
        Route::get('/login','showLoginForm')->name('login.');
        Route::post('/login/check','checkAuth')->name('login.check.auth');
        Route::post('/logout','logout')->name('logout');
    });
    Route::prefix('password/')->name('password.')->group(function () {
        Route::controller(ForgetPasswordController::class)->group(function (){
            Route::get('/email','showEmailForm')->name('email');
            Route::post('/email','sendOtp')->name('send.otp');
            Route::get('/verify/{email}','showOtpForm')->name('showOtpForm');
            Route::post('/verify','verifyOtp')->name('verify.otp');
        });

        Route::get('/reset/{email}',[ResetPasswordController::class,'showResetForm'])->name('resetForm');
        Route::post('/reset',[ResetPasswordController::class,'resetPassword'])->name('reset');
    });
    Route::get('wait', function () {
        return view('admin.wait');
    })->name('wait');
});
//admin dashboard
Route::group(['prefix' => '/admin//', 'as' => 'admin.', 'middleware' => ['auth:admin','checkAdminStatus']], function () {
    Route::fallback(function(){
        return response()->view('errors.404');
    });
    //***************************** home Admin**********************************/
    Route::get('home',[HomeController::class,'index'])->name('home');
    /*********************** General Search *************************/
    Route::get('search',[GeneralSearchController::class,'search'])->name('search');
    //****************** Authorization *******************/
    Route::resource('authorizations' , AuthorizationController::class);
    //********************** User ***************************/
    Route::resource('users' , UserController::class);
    Route::get('users/status/{id}',[UserController::class,'changeStatus'])->name('users.status');
    //********************* Admin ***********************/
    Route::resource('admins' , AdmintController::class);
    Route::get('admins/status/{id}',[AdmintController::class,'changeStatus'])->name('admins.status');
    //************************ Category ********************************/
    Route::resource('categories' , CategoryController::class);
    Route::get('categories/status/{id}',[CategoryController::class,'changeStatus'])->name('categories.status');
    //*************************** Post ***************************/
    Route::resource('posts' , PostController::class);
    Route::get('posts/status/{id}',[PostController::class,'changeStatus'])->name('posts.status');
    Route::post('posts/image/delete/{image_id}',[PostController::class,'deletePostImage'])->name('posts.image.delete');
    //-******************************** Delete Comment ******************/
    Route::delete('posts/delete/comment/{id}',[PostController::class,'deleteComment'])->name('posts.delete.comment');
    /*********************** Related Site *************************/
    Route::resource('related-site' , RelatedSiteController::class);
    /*********************** Setting *************************/
        Route::controller(SettingController::class)->prefix('settings/')->name('setting.')->group(function (){
            Route::get('index','index')->name('index');
            Route::post('update','update')->name('update');
        });
    /*********************** profile *************************/
    Route::controller(ProfileController::class)->prefix('profile/')->as('profile.')->group(function (){
        Route::get('index','index')->name('index');
        Route::post('update','update')->name('update');
    });
/*********************** Contact *************************/
    Route::controller(ContactController::class)->prefix('contacts/')->name('contacts.')->group(function (){
        Route::get('index','index')->name('index');
        Route::get('show/{id}','show')->name('show');
        Route::delete('destroy/{id}','destroy')->name('destroy');
    });
/*********************** Notification *************************/
    Route::controller(NotificationController::class)->prefix('notification/')->name('notification.')->group(function (){
        Route::get('index','index')->name('index');
        Route::delete('destroy/{id}','destroy')->name('destroy');
        Route::get('delete/all','deleteAll')->name('delete.all');
    });
});


