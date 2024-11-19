<?php

namespace App\Http\Controllers\Admin\Setting;

use App\Http\Controllers\Controller;
use App\Http\Requests\SettingRequest;
use App\Models\Setting;
use App\Utils\ImageManger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SettingController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:settings');
    }
    public function index()
    {
        return view('admin.settings.index');
    }
    public function update(SettingRequest $request)
    {
        $request->validated();
        try {
            DB::beginTransaction();
            $current_setting = Setting::findOrFail($request->setting_id);
            $setting = $current_setting->update($request->except(['_token', 'setting_id', 'logo', 'favicon']));

                if ($request->hasFile('logo')) {
                    $this->updateLogo($request, $current_setting);
                }
                if ($request->hasFile('favicon')) {
                    $this->updateFavicon($request, $current_setting);
                }
                DB::commit();

                if (!$setting) {
                    return redirect()->route('admin.setting.index')->with('error', 'Try Again Later.');
                }


                return redirect()->route('admin.setting.index')->with('success', 'Setting updated successfully.');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->with(['errors', $e->getMessage()]);
        }
    }
    private function updateLogo($request, $current_setting)
    {
        ImageManger::deleteImageFromLocal($current_setting->logo);
        $LogoFile = ImageManger::generateImageName($request->logo);
        $LogoPath = ImageManger::storeImageInLocal($request->logo, 'setting', $LogoFile);
        $current_setting->update(['logo' => $LogoPath]);
    }
    private function updateFavicon($request, $current_setting)
    {
        ImageManger::deleteImageFromLocal($current_setting->favicon);
        $FaviconFile = ImageManger::generateImageName($request->favicon);
        $FaviconPath = ImageManger::storeImageInLocal($request->favicon, 'setting', $FaviconFile);
        $current_setting->update(['favicon' => $FaviconPath]);
    }
}
