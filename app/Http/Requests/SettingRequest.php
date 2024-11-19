<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SettingRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            "setting_id" => 'required|numeric',
            "site_name" => "required|string|min:2|max:255",
            "email" => "required|email",
           'phone' => 'required|string|min:6|max:16',
            "country" => "required|string|min:2|max:50",
            "city" => "required|string|min:2|max:50",
            "street" => "required|string|min:2|max:50",
            "youtube" => "required|string|max:255",
            "facebook" => "required|string|max:255",
            "instagram" => "required|string|max:255",
            "linkedin" => "required|string|max:255",
            "twitter" => "required|string|max:255",
            "small_desc" => "required|string|min:2|max:1000",
            "logo" => "nullable|image|mimes:jpeg,png,jpg,gif|max:2048",
            "favicon" => "nullable|image|mimes:jpeg,png,jpg,gif|max:2048",
        ];
    }
}
