<?php

namespace App\Utils;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;

class ImageManger
{
    public static function uploadImage($request, $post = null, $user = null)
    {
        if ($request->hasFile('images')) {
            foreach ($request->images as $image) {
                $file = self::generateImageName($image);
                $path = self::storeImageInLocal($image,'posts', $file);
                $post->images()->create(['path' => $path]);
            }
        }
        if ($request->hasFile('image')) {
            self::deleteImageFromLocal($user->image);
            $file = self::generateImageName($request->image);
            $path = self::storeImageInLocal($request->image, 'users', $file);
            // update imge in db
            $user->update(['image' => $path]);
        }
    }
    public static function deleteImages($images)
    {
        if ($images->count() > 0) {
            foreach ($images as $image) {
                self::deleteImageFromLocal($image->path);
                $image->delete();
            }
        }
    }
    public static function generateImageName($image)
    {
        $file = Str::uuid() . time() . '.' . $image->getClientOriginalExtension();
        return $file;
    }
    public static function storeImageInLocal($image, $path, $fileName)
    {
        $path = $image->storeAs('/assets/frontend/img/uploads/'.$path, $fileName, ['disk' => 'uploads']);
        return $path;
    }
    public static function deleteImageFromLocal($images_path)
    {
        if (File::exists(public_path($images_path))) {
            File::delete(public_path($images_path));
        }
    }
}
