<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->longText('desc');
            $table->string('title');
            $table->string('slug')->unique();
            $table->boolean('comment_able')->default(1);
            $table->bigInteger('num_of_views')->default(0);
            $table->text('small_desc')->default('small description for post to optimization seo');
            $table->json('key_words')->default('["news","posts","sport"]');
            $table->boolean('status')->default(1);
            $table->foreignId('user_id')->nullable()->constrained('users')->onDelete('cascade'); //<- OR -> $table->foreignId('category')->references('id')->on('user');
            $table->foreignId('admin_id')->nullable()->constrained('admins')->onDelete('cascade'); //<- OR -> $table->foreignId('category')->references('id')->on('user');
            $table->foreignId('category_id')->references('id')->on('categories')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('posts');
    }
};
