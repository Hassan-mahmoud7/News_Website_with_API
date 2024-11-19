<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Symfony\Component\HttpFoundation\Request;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Session;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
        $this->middleware('auth')->only('logout');
    }
    protected function validateLogin(Request $request)
    {
        $request->validate([
            $this->username() => 'required|string',
            'password' => 'required|string',
            'g-recaptcha-response' => 'required|captcha'
        ],[
            'g-recaptcha-response' => ['required'=>'Please verify that you are not a robot.']
        ]);
    }
        protected function authenticated(Request $request, $user)
    {
        Session::flash('success' , ' <i class="fa-solid fa-arrow-right-to-bracket"></i> You Loged In Successfully ');
    }
    public function logout(Request $request)
    {
        $this->guard()->logout();


        if ($response = $this->loggedOut($request)) {
            return $response;
        }

        return $request->wantsJson() ? new JsonResponse([], 204): redirect('/');
    }
    protected function loggedOut(Request $request)
    {
        Session::flash('info' , ' <i class="fa-solid fa-right-from-bracket"></i> You Loged out ');
    }



}
