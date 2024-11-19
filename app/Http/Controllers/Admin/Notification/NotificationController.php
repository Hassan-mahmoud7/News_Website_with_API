<?php

namespace App\Http\Controllers\Admin\Notification;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:notifications');
    }
    public function index()
    {
        Auth::guard('admin')->user()->unreadNotifications->markAsRead();
        $notifications = Auth::guard('admin')->user()->notifications()->get();
        // return $notifications;
        return view('admin.notifications.index' , compact('notifications'));
    }

    public function destroy($id)
    {
        $notification = Auth::guard('admin')->user()->notifications()->whereId($id)->delete();
        if (!$notification) {
            return redirect()->route('admin.notification.index')->with('error', 'Try Again Letter!');
        }
        return redirect()->route('admin.notification.index')->with('success', 'Notification deleted successfully');
    }
    public function deleteAll()
    {
        $notification =  Auth::guard('admin')->user()->notifications()->delete();;
        if (!$notification) {
            return redirect()->route('admin.notification.index')->with('error', 'Try Again Letter!');
        }
        return redirect()->route('admin.notification.index')->with('success', 'All Notifications Deleted!');
    }
}
