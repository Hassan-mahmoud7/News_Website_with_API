<?php

use App\Http\Controllers\Auth\SocialLoginController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Frontend\HomeController;
use App\Http\Controllers\Frontend\PostController;
use App\Http\Controllers\Frontend\SearchController;
use App\Http\Controllers\Frontend\ContactController;
use App\Http\Controllers\Frontend\CategoryController;
use App\Http\Controllers\Frontend\Dashboard\NotificationController;
use App\Http\Controllers\Frontend\Dashboard\ProfileController;
use App\Http\Controllers\Frontend\Dashboard\SettingController;
use App\Http\Controllers\Frontend\NewSubscriberController;
use Predis\Configuration\Option\Prefix;

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
//     return view('frontend.dashboard.edit-post');
// });

Route::redirect('/', '/home');

Route::group(['as' => 'frontend','middleware'=>'throttle:web'], function () {
    Route::fallback(function(){
        return response()->view('errors.404');
    });
    // Home Route  with Authentication Guard  (auth:web)  & Guest Guard (guest:web)
    Route::get('/home', [HomeController::class, 'index']);
    // Subscrib Route
    Route::post('new-subscriber', [NewSubscriberController::class, 'store'])->name('.new.subscrice');
    // show Category & Post Route
    Route::get('/category/{slug}', CategoryController::class)->name('.category.posts');
    // Post Route
    Route::controller(PostController::class)->name('.post.')->prefix('/post//')->group(function () {
        Route::get('{slug}', 'show')->name('show');
        // comments Route
        Route::post('comments/add', 'addComment')->name('add.comment')->middleware('auth');
        Route::get('comments/{slug}', 'getAllPostComments')->name('getAllComments');
    });
    // contact rooute
    Route::controller(ContactController::class)->name('.contact.')->prefix('/contact-us//')->group(function () {
        Route::get('/', 'index')->name('index');
        Route::post('/store', 'store')->name('store');
    });
    // search Routes
    Route::get('/search', SearchController::class)->name('.search');
    // dashboard Routes
    //manage profile page
    Route::group(['prefix' => 'account/', 'as' => '.dashboard.', 'middleware' => ['verified', 'auth:web', 'checkeUserStatus']], function () {
        Route::controller(ProfileController::class)->group(function () {
            Route::get('profile', 'index')->name('profile');
            Route::group(['prefix' => 'post/', 'as' => 'post.'], function () {
                Route::post('store', 'storePost')->name('store');
                Route::delete('delete', 'deletePost')->name('delete');
                Route::get('get-comment/{id}', 'getComment')->name('getComment');
                //update post
                Route::get('/{slug}/edit', 'showEditForm')->name('edit');
                Route::put('update/', 'updatePost')->name('update');
                Route::post('image/delete/{image_id}', 'deletePostImage')->name('image.delete');
                //notification
            });
        });
        Route::controller(SettingController::class)->name('setting.')->prefix('setting/')->group(function () {
            Route::post('update', 'update')->name('update');
            Route::post('change-password', 'changePassword')->name('change.password');
        });
        //notification
        Route::get('notification/read-all', [NotificationController::class, 'readAll'])->name('notification.read.all');
        Route::post('notification/delete', [NotificationController::class, 'delete'])->name('notification.delete');
        Route::get('notification/delete-all', [NotificationController::class, 'deleteAll'])->name('notification.delete.all');
    });
    Route::get('wait', function () {
        return view('frontend.wait');
    })->name('.wait');
});
Auth::routes(['verify' => true]);
// social auth
Route::get('auth/{provider}/redirect',[SocialLoginController::class,'redirect'])->name('auth.google.redirect');
Route::get('auth/{provider}/callback',[SocialLoginController::class,'callback'])->name('auth.google.callback');
