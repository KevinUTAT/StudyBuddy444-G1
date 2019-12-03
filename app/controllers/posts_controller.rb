class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    # only signed in can create posts
    before_action :authenticate_user!, except: [:index, :show, :checkout]
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
        
        # @user = @post.user
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

    def accept_applicant
        @post = find_post
        applicant_id = params[:post_application_id]
        applicant = @post.post_applications.where(id: applicant_id)
        if !applicant.empty?
            applicant.update_all(is_accepted: true)
            redirect_to post_path(@post), notice:"Accepted applicant"
        else
            redirect_back fallback_location: root_url
        end

    end

    def unaccept_applicant
        @post = find_post
        applicant_id = params[:post_application_id]
        applicant = @post.post_applications.where(id: applicant_id)
        if !applicant.empty?
            applicant.update_all(is_accepted: false)
            redirect_to post_path(@post), notice:"Unaccepted applicant"

        else
            redirect_back fallback_location: root_url
        end

    end

    def checkout
        @post = Post.find(params[:postid])
        @app_id = params[:app_id]
        @price = params[:price]
    end

    def accept
        @post = Post.find(params[:postid])
        @app_id = params[:app_id]
        @applicant = @post.post_applications.where(id: params[:app_id])[0]
        @amount = params[:amount]
    end


    private

    def find_post
        Post.find(params[:id])
    end


    def post_params
        params.require(:post).permit(:title, :content, :limit, :category_id, :is_accepting_applicants, :price)
    end
    
    def require_permission
        if current_user != Post.find(params[:id]).user
            redirect_to root_path
        end
    end

end
