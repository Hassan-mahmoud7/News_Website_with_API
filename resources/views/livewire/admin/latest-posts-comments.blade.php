<div>
    <div class="row">

        <!-- Content Column -->
        <div class="col-lg-6 mb-4">

            <!-- Project Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Last Posts</h6>
                </div>

                <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Comments</th>
                                    <th>Category</th>
                                    <th>status</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($latest_posts as $post)
                                <tr>
                                    <td>
                                        @can('posts')
                                        <a class="text-decoration-none" href="{{ route('admin.posts.show',$post->id) }}">
                                            {{ Illuminate\Support\Str::limit($post->title ,18,'...') }}
                                        </a>
                                        @endcan
                                        @cannot('posts')
                                        {{ Illuminate\Support\Str::limit($post->title ,18,'...') }}
                                        @endcannot
                                    </td>
                                    <td>{{ $post->comments->count() }}</td>
                                    <td>{{ $post->category->name }}</td>
                                    <td class="{{ $post->status == 1?'text-success':'text-danger' }}">{{ $post->status == 1?'Active':'Not Active' }}</td>

                                </tr>
                                @empty
                                <tr><td colspan="4" class="alert alert-info text-center">No Posts Yet Now !</td></tr>
                                @endforelse
                            </tbody>
                        </table>
                </div>
            </div>
        </div>
        <!-- Content Column -->
        <div class="col-lg-6 mb-4">

            <!-- Project Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Last Comments</h6>
                </div>

                <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Post</th>
                                    <th>Comment</th>
                                    <th>status</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($latest_comments as $comment)
                                <tr>
                                    <td>{{ $comment->user->name }}</td>
                                    <td>
                                        @can('posts')
                                        <a class="text-decoration-none" href="{{ route('admin.posts.show',$comment->post_id) }}">
                                            {{ Illuminate\Support\Str::limit($comment->post->title,20,'...') }}
                                        </a>
                                        @endcan
                                        @cannot('posts')

                                            {{ Illuminate\Support\Str::limit($comment->post->title,20,'...') }}

                                        @endcannot
                                    </td>
                                    <td>{{ Illuminate\Support\Str::limit($comment->comment, 30, '...') }}</td>
                                    <td class="{{ $comment->status == 1?'text-success':'text-danger' }}">{{ $comment->status == 1?'Active':'Not Active' }}</td>

                                </tr>
                                @empty
                                <tr><td colspan="4" class="alert alert-info text-center">No Comments Yet Now !</td></tr>
                                @endforelse
                            </tbody>
                        </table>
                </div>
            </div>
        </div>


    </div>
</div>
