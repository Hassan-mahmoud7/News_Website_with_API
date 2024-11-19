<?php

namespace App\Http\Controllers\Admin\Contact;

use App\Http\Controllers\Controller;
use App\Models\Contact;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:contacts');
    }
    public function index()
    {
        $contacts = Contact::when(request()->search, function ($query) {
            $query->where('name', 'LIKE', '%' . request()->search . '%')
                ->orwhere('email', 'LIKE', '%' . request()->search . '%');
            })->when(!is_null(request()->status), function ($query) {
                $query->where('status', request()->status);
        })->orderBy(request('order_by', 'id'), request('order_by_direction', 'desc'));

        $contacts = request()->has('limit_by') ? $contacts->limit(request('limit_by'))->get() : $contacts->get();
        return view('admin.contacts.index' , compact('contacts'));
    }
    public function show($id)
    {
        $contact = Contact::findOrFail($id);
        $contact->update(['status'=>1]);
        return view('admin.contacts.show', compact('contact'));

    }
    public function destroy($id)
    {
        $contact = Contact::findOrFail($id);
        $contact->delete();
        return redirect()->route('admin.contacts.index')->withSuccess('Contact deleted successfully.');

    }
}
