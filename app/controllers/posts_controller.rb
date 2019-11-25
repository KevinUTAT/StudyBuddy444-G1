class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    # only signed in can create posts
    before_action :authenticate_user!, except: [:index, :show]
    before_action :require_permission, only: [:edit, :update, :destroy]


    def index
        if params[:category].blank?
            @posts = Post.all.order("created_at DESC")
        else 
            @category_id = Category.find_by(name: params[:category]).id
            @posts = Post.where(category_id: @category_id).order("created_at DESC")
        end
    end

    def show
        @post = Post.find(params[:id])
        # data for paypal
        
        @user = @post.user
        # @user_id = @user.id
        # @user.name  is the name
        #for now take an arbritary price like 10$
        

    end

    def new
        # user has_many posts
        # @post = Post.new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)

        if @post.save
            redirect_to @post
        else 
            render 'new'
        end
    end

    def edit
        @notes = Note.all.collect {|note| [ note.title, note.id ] }
    end

    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        redirect_to root_path
    end




    private

    def find_post
        @post = Post.find(params[:id])
    end


    def post_params
        params.require(:post).permit(:title, :content, :limit, :category_id)
    end
    
    def require_permission
        if current_user != Post.find(params[:id]).user
            redirect_to root_path
        end
    end

end
