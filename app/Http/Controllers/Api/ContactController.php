<?php

namespace App\Http\Controllers\Api;

use App\Models\Admin;
use App\Models\Contact;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Notifications\NewContactNotify;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Notification;
use App\Http\Requests\Frontend\ContactRequest;

class ContactController extends Controller
{
    public function storeContact(Request $request)
    {
        $rules = (new ContactRequest)->rules();
        if (!$request->has('g-recaptcha-response')) {
            $rules['g-recaptcha-response'] = ['nullable'];
        }
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return apiResponse(422, 'Validation failed', $validator->errors());
        }
        $request->merge([
            'ip_address' => $request->ip(),
        ]);
        $contact  = Contact::create($request->all());
        if (!$contact) {
            return apiResponse(400, 'Sory Try Again latter!');
        }
        $admin = Admin::all();
        Notification::send($admin, new NewContactNotify($contact));
        return apiResponse(201, 'Your Message Has Been Sent Successfully');
    }
}
