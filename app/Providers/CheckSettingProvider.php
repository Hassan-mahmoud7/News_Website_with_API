<?php

namespace App\Providers;


use App\Models\Setting;
use Illuminate\Support\ServiceProvider;

class CheckSettingProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        $getSetting =  Setting::firstOr(function () {
            return Setting::create([
                'site_name' => 'news',
                'email' => 'news@gmail.com',
                'phone' => '01287587134',
                'favicon' => 'assets/frontend/img/uploads/setting/a098c6bf-db21-4b7b-a03c-bc52d7486dd31728917369.png',
                'logo' => 'assets/frontend/img/uploads/setting/383cc034-efb6-4cd3-ab99-c9438db8aab91728917369.png',
                'facebook' => 'https://www.facebook.com',
                'instagram' => 'https://www.instagram.com',
                'linkedin' => 'https://www.linkedin.com/in/hassan-mahmoud-b1305822a',
                'twitter' => 'https://www.twitter.com/',
                'youtube' => 'https://www.youtube.com',
                'street' => 'sede basher el Esawe',
                'city' => 'Alex',
                'country' => 'Egypt',
                'small_desc' => 'Welcome to  News , your go-to source for the latest news and updates from around the world. Our platform provides a comprehensive range of articles covering politics, technology, health, entertainment, and more. With a commitment to delivering accurate and timely information, we strive to keep our readers informed and engaged. Whether you are looking for breaking news or in-depth analysis, News is here to deliver the stories that matter most to you',
            ]);
        });
        $getSetting->whatsapp = "http://wa.me/" . $getSetting->phone;
        view()->share('getSetting', $getSetting);
    }
}
