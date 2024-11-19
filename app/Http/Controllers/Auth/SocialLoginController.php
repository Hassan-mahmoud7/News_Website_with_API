<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;

class SocialLoginController extends Controller
{
    public function redirect($provider)
    {

       return Socialite::driver($provider)->redirect();
    }
    public function callback($provider)
    {
       try {
        $user_provider = Socialite::driver($provider)->user();
        $user_form_db = User::whereEmail($user_provider->getEmail())->first();
        if ($user_form_db) {
            Auth::login($user_form_db);
            return redirect()->route('frontend.dashboard.profile')->with('success',' <i class="fa-solid fa-arrow-right-to-bracket"></i> You Loged In Successfully ');
        }
        $username = $this->generateUniqueUsername($user_provider->name);
        $user = User::create([
            'name' => $user_provider->name,
            'email' => $user_provider->email,
            'username' => $username,
            'image' => $user_provider->avatar,
            'status' => 1,

            'email_verified_at' => now(),
            'password' => Str::random(10),
            'country' => 'updated',
            'city' => 'updated',
            'street' => 'updated',
            'floor' => 'updated',
        ]);
        Auth::login($user);
        return redirect()->route('frontend.dashboard.profile')->with('success',' <i class="fa-solid fa-arrow-right-to-bracket"></i> You Loged In Successfully ');


       } catch (\Exception $e) {
        return redirect()->route('login')->with('error', 'Error occurred while trying to login with social media. Please try again later.');
       }
    }
    public function generateUniqueUsername($name)
    {
        $username = Str::slug($name);
        $count = 1;
        while (User::where('username' , $username)->exists()) {
            $username = $username . $count++;
        }
        return $username;
    }
}
