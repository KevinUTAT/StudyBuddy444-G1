class PostApplicationsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @post_application = @post.post_applications.create(post_application_params)
        redirect_to post_path(@post)
    end

    def destroy
        @post = Post.find(params[:post_id])
        @post_application = @post.post_applications.find(params[:id])
        @post_application.destroy
    
        redirect_to post_path(@post), notice: 'Deleted a application'
    end

    private
        def post_application_params
            params.require(:post_application).permit(:user_id, :is_accepted)
        end

end
