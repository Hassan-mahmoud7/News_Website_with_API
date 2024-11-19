<?php

namespace App\Http\Requests\Frontend;

use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class UserSettingRequest extends FormRequest
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
            'name' => ['required', 'min:2', 'max:50'],
            'username' => ['required', 'min:2', 'max:50',Rule::unique('users','username')->ignore(auth()->user()->id)],
            'email' => 'required|email|max:90|unique:users,email,'.auth()->user()->id,
            'phone' => 'required|string|min:6|max:16|unique:users,phone,'.auth()->user()->id,
            'country' => ['nullable', 'max:50'],
            'city' => ['nullable', 'max:50'],
            'street' => ['nullable', 'max:50'],
            'floor' => ['nullable', 'max:50'],
            'image' => ['nullable', 'image','mimes:jpeg,png,jpg,gif|max:2048'],
        ];
    }
}
