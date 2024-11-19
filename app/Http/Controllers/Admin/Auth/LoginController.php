<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function __construct()
    {
        $this->middleware('guest:admin')->only(['showLoginForm','checkAuth']);
        $this->middleware('auth:admin')->only(['logout']);
    }
    public function showLoginForm()
    {
        return view('admin.auth.login');
    }
    public function checkAuth(Request $request)
    {
        $request->validate(self::filterDate());
        if (Auth::guard('admin')->attempt(['email' => $request->email, 'password' => $request->password], $request->remember)) {
            // if admin has permission home -> redrect home ,else redire the first page in his permission.
            $permission = Auth::guard('admin')->user()->authrization->permissions;
            $first_permission = $permission[0];
            if (!in_array('home', $permission)) {
                return redirect()->intended('admin/'.$first_permission);
            }else{
                return redirect()->intended(RouteServiceProvider::ADMINHOME);
            }

        }
        return redirect()->back()->withErrors(['email' => 'credentials dose not match!']);
    }

    public function logout(Request $request)
    {
        Auth::guard('admin')->logout();
        return redirect()->route('admin.login.');
    }

    private static function filterDate(): array
    {
        return [
            'email' => ['required', 'email'],
            'password' => ['required', 'min:8'],
            'remember' => ['in:on,off']
        ];
    }
    protected function attemptLogin(Request $request)
    {
        return Auth::guard('admin')->attempt(
            $this->credentials($request), $request->boolean('remember')
        );
    }
}
