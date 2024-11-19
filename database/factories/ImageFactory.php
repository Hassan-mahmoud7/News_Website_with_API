<?php

namespace Database\Factories;


use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Model>
 */
class ImageFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {

        // $paths = ['test1.png','test1.png','test1.png','test1.png','test1.png','test1.png']; //fake image
        return [
            // 'path' => fake()->randomElement($paths), // anthor solution
            'path' => fake()->imageUrl(),
        ];
    }
}
