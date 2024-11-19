<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\RelatedNewsResource;
use App\Http\Resources\SettingResource;
use App\Models\RelatedNewsSite;
use App\Models\Setting;
use Illuminate\Http\Request;

class SettingController extends Controller
{
    public function getSettings()
    {
        $settings = Setting::first();
        $related_site = $this->relatedSite();
        if (!$settings) {
            return apiResponse(404, 'Settings Is Empty!');
        }
        $data = ['setting' => SettingResource::make($settings),'related_site' => $related_site];
        return apiResponse(200, 'Get All Settings.', $data);
    }
    private function relatedSite()
    {
        $related_site = RelatedNewsSite::select('name', 'url')->get();
        if (!$related_site) {
            return apiResponse(404, 'There Are Not Related Site!');
        }
        return apiResponse(200,'this is related News',['related_site' => RelatedNewsResource::collection($related_site)]);
    }
}
