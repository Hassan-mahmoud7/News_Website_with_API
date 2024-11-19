<?php

namespace App\Providers;
use App\Models\Category;
use App\Models\RelatedNewsSite;
use Illuminate\Support\ServiceProvider;

class ViewServiceProvider extends ServiceProvider
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



        view()->share([

            'relatedsites'=> RelatedNewsSite::select('name','url')->get(),
            'categories'=>  Category::active()->select('id','name','slug')->get(),

        ]);
    }
}
