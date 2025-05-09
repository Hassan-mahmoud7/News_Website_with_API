<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
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
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:60'],
            'username' => ['required', 'string','max:60', 'unique:users'],
            'email' => ['required', 'string', 'email', 'max:90', 'unique:users'],
            'phone' => ['required', 'string','max:16', 'unique:users'],
            'country' => ['nullable', 'string', 'max:60'],
            'city' => ['nullable', 'string', 'max:50'],
            'street' => ['nullable', 'string', 'max:255'],
            'floor' => ['nullable', 'string', 'max:10'],
            'password' => ['required', 'string', 'min:8','max:25', 'confirmed'],
            'image' => ['nullable', 'image','mimes:jpeg,png,jpg,gif|max:2048'],
            'g-recaptcha-response' => 'required|captcha',
        ],[
            'g-recaptcha-response' => ['required'=>'Please verify that you are not a robot.'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'username' => $data['username'],
            'phone' => $data['phone'],
            'country' => $data['country'],
            'city' => $data['city'],
            'street' => $data['street'],
            'floor' => $data['floor'],
            'password' => Hash::make($data['password']),
        ]);
        if (isset($data['image'])) {
            $file = $data['image'];
            $fileName = Str::slug($user->username).time().'.'.$file->getClientOriginalExtension();
            $path = $file->storeAs('assets/frontend/img/uploads/users',$fileName,['disk'=> 'uploads']);
            $user->update([
                'image' =>  $path,
            ]);
        };
        return $user;
    }
    public function register(Request $request)
{
    $this->validator($request->all())->validate();

    event(new Registered($user = $this->create($request->all())));

    $this->guard()->login($user);

    if ($user->hasVerifiedEmail()) {
        return redirect($this->redirectTo);
    }

    return redirect()->route('verification.notice');
}


    protected function registered(Request $request, $user)
    {
        Session::flash('success' , '<i class="fa-solid fa-arrow-right-to-bracket"></i> Successfully Register ');
    }
}
