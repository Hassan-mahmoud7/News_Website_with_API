<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Http\Requests\Frontend\ContactRequest;
use App\Models\Admin;
use App\Models\Contact;
use App\Notifications\NewContactNotify;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Session;

class ContactController extends Controller
{
    public function index()
    {

        return view('frontend.contact-us');
    }
    public function store(ContactRequest $request)
    {
        $request->validated();
        $request->merge([
            'ip_address'=>$request->ip(),
        ]);

        $contact  = Contact::create($request->except('_token'));
        $admin = Admin::all();
        Notification::send($admin, new NewContactNotify($contact));
        if(!$contact){
             Session::flash('error','Sory Try Again');
             return redirect()->back();
        }else{
              Session::flash('success','Your Message Has Been Sent Successfully');
              return redirect()->back();
        }
    }
}
