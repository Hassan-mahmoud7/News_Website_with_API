<?php

namespace App\Http\Controllers\Admin\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserRequest;
use App\Models\User;
use App\Utils\ImageManger;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:users');
    }
    public function index()
    {

        $users = User::when(request()->search, function ($query) {
            $query->where('name', 'LIKE', '%' . request()->search . '%')
                ->orwhere('email', 'LIKE', '%' . request()->search . '%');
        })->when(!is_null(request()->status), function ($query) {
            $query->where('status', request()->status);
        })->orderBy(request('order_by', 'id'), request('order_by_direction', 'desc'));

        $users = request()->has('limit_by') ? $users->limit(request('limit_by'))->get() : $users->get();

        return view('admin.users.index', compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.users.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(UserRequest $request)
    {
        $request->validated();
        $request->merge([
            'email_verified_at' =>  $request->email_verified_at == 1 ? now() : null,
        ]);
        $user = User::create($request->except(['_token', 'image', 'password_confirmation']));
        ImageManger::uploadImage($request, null, $user);
        return redirect()->back()->with('success', 'Created User Successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $user = User::findOrFail($id);
        return view('admin.users.show', compact('user'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $user = User::findOrFail($id);
        ImageManger::deleteImageFromLocal($user->image);
        $user->delete();
        return redirect()->route('admin.users.index')->with('success', 'User deleted successfully.');
    }
    public function changeStatus($id)
    {
        $user = User::findOrFail($id);
        if ($user->status == 1) {
            $user->update(['status' => 0]);
            return redirect()->back()->with('success', 'User blocked successfully.');
        } else {
            $user->update(['status' => 1]);
            return redirect()->back()->with('success', 'User Active successfully.');
        }
        return redirect()->back();
    }
    // public function activeUser($id)
    // {
    //     $user = User::findOrFail($id);
    //     $user->update(['status'=>1]);
    //     return back()->with('success', 'User Active successfully.');
    // }
}
