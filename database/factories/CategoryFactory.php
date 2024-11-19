<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Category>
 */
class CategoryFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $date = fake()->date('Y-m-d h:m:s');
        return [
            'name' => fake()->name(),
            'small_desc' => fake()->paragraph(2),
            'slug' => fake()->slug(),
            'status' => fake()->randomElement([1,0]),
            'created_at' =>$date,
            'updated_at' =>$date,
        ];
    }
}
