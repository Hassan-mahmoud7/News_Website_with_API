<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PostRequest extends FormRequest
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
            'title' => ['required','string','min:3','max:255'],
            'desc' => ['required','string','min:3'],
            'comment_able' => ['in:on,off,1,0'],
            'images.*' => ['required'],
            'images.*' => ['image','mimes:jpeg,png,jpg,gif','max:2048'],
            'category_id' => ['required','exists:categories,id'],
            'small_desc' => ['required','min:5','max:255'],
            'key_words' => ['nullable', 'regex:/^[\w,]+$/', 'min:2', 'max:255'],
            'status' => ['nullable','in:1,0'],
            // 'user_id' => ['required','exists:users,id'],
        ];
    }
}
