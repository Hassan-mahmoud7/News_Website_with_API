<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class CheckEmailVarifyApi
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // Check if the email verification status is pending
        if (Auth::guard('sanctum')->check() && Auth()->guard('sanctum')->user()->email_verified_at == null) {
            return apiResponse(401,'Please verify your Email First');
        }
        return $next($request);
    }
}
