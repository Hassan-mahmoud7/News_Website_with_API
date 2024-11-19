<?php

namespace App\Providers;

use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Facades\Route;

class RouteServiceProvider extends ServiceProvider
{
    /**
     * The path to the "home" route for your application.
     *
     * Typically, users are redirected here after authentication.
     *
     * @var string
     */
    public const HOME = '/';
    public const ADMINHOME = '/admin/home';

    /**
     * Define your route model bindings, pattern filters, and other route configuration.
     */
    public function boot(): void
    {
        $this->configureRateLimiting();

        $this->routes(function () {
            Route::middleware('api')
                ->prefix('api')
                ->group(base_path('routes/api.php'));

            Route::middleware('web')
                ->group(base_path('routes/web.php'));

            Route::middleware('web')
                ->group(base_path('routes/admin.php'));
        });
    }

    /**
     * Configure the rate limiters for the application.
     */
    protected function configureRateLimiting(): void
    {
        RateLimiter::for('api', function (Request $request) {
            return Limit::perMinute(20)->by($request->user()?->id ?: $request->ip())->response(function () {
            return apiResponse(429,'Too many request attempts. Please try After Minute.');
            });
        });
        RateLimiter::for('contact',function (Request $request) {
            return Limit::perMinute(1)->by($request->ip())->response(function () {
                return apiResponse(429,'Too many contact attempts. Please try After Minute.');
            });
        });
        RateLimiter::for('login',function (Request $request) {
            return Limit::perMinute(3)->by($request->ip())->response(function () {
                return apiResponse(429,'Too many login attempts. Please try After Minute.');
            });
        });
        RateLimiter::for('register',function (Request $request) {
            return Limit::perMinute(3)->by($request->ip())->response(function () {
                return apiResponse(429,'Too many register attempts. Please try After Minute.');
            });
        });
        RateLimiter::for('comment',function (Request $request) {
            return Limit::perMinute(5)->by($request->ip())->response(function () {
                return apiResponse(429,'Too many comment attempts. Please try After Minute.');
            });
        });
        RateLimiter::for('password',function (Request $request) {
            return Limit::perDay(3,1)->by($request->ip())->response(function () {
                return apiResponse(429,'Too many password attempts. Please try After Minute.');
            });
        });
        RateLimiter::for('updateSettingUser',function (Request $request) {
            return Limit::perDay(3,1)->by($request->ip())->response(function () {
                return apiResponse(429,'Too many update setting attempts. Please try After Minute.');
            });
        });
       RateLimiter::for('web', function (Request $request) {
            return Limit::perMinute(60)->by($request->ip())->response(function ($request) {
                RateLimiter::increment($request->ip());
                $time = RateLimiter::availableIn($request->ip());
                return response()->view('errors.429', compact('time'), 429);
            });
        });

    }
}
