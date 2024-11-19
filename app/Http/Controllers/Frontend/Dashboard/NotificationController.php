<?php

namespace App\Http\Controllers\Frontend\Dashboard;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class NotificationController extends Controller
{
    public function delete(Request $request)
    {
        $notification = auth()->user()->notifications()->whereId($request->notify_id)->first();
        if (!$notification) {
            Session::flash('error', 'The Notification Not Found!');
             return redirect()->back();
        }
        $notification->delete();
        Session::flash('success', 'Notification Deleted successfully');
       return redirect()->back();
    }
    public function deleteAll()
    {
       auth()->user()->notifications()->delete();
       Session::flash('success', 'All Notifications Deleted!');
       return redirect()->back();
    }
    public function readAll()
    {
        auth()->user()->unreadNotifications->markAsRead();
        Session::flash('success', 'All Notifications Marked As Read!');
       return redirect()->back();

    }
}
