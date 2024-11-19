<?php

namespace App\Http\Controllers\Admin;

use LaravelDaily\LaravelCharts\Classes\LaravelChart;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:home');
    }
    public function index()
    {
        //posts chart
        $chart_options = [
            'chart_title' => 'Posts by months',
            'report_type' => 'group_by_date',
            'model' => 'App\Models\Post',
            'group_by_field' => 'created_at',
            'group_by_period' => 'month',
            'chart_type' => 'line',
            'filter_field' => 'created_at',
            'filter_days' => 3600, // show only last 30 days
        ];
        $post_chart = new LaravelChart($chart_options);
        //users chart
        $chart_options_users = [
            'chart_title' => 'Users by day',
            'report_type' => 'group_by_date',
            'model' => 'App\Models\User',
            'group_by_field' => 'created_at',
            'group_by_period' => 'day',
            'chart_type' => 'bar',
            'filter_field' => 'created_at',
            'filter_days' => 30, // show only last 30 days
        ];
        $user_chart = new LaravelChart($chart_options_users);
        //contacts chart
        $chart_options_cotacts = [
            'chart_title' => 'Contacts by day',
            'report_type' => 'group_by_date',
            'model' => 'App\Models\Contact',
            'group_by_field' => 'created_at',
            'group_by_period' => 'day',
            'chart_type' => 'bar',
            'filter_field' => 'created_at',
            'filter_days' => 30, // show only last 30 days
        ];
        $contact_chart = new LaravelChart($chart_options_cotacts);
        //comments chart
        $chart_options_comments = [
            'chart_title' => 'Comments by year',
            'report_type' => 'group_by_date',
            'model' => 'App\Models\Comment',
            'group_by_field' => 'created_at',
            'group_by_period' => 'month',
            'chart_type' => 'line',
            'filter_field' => 'created_at',
            'filter_days' => 3600, // show only last 30 days
        ];
        $comment_chart = new LaravelChart($chart_options_comments);

        // Return the view with the chart instances
        return view('admin.index', compact('post_chart','user_chart','contact_chart','comment_chart'));

    }
}
