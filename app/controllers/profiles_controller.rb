class ProfilesController < ApplicationController
    before_action :find_profile, only: [:show, :edit, :update, :destroy]
    # only signed in can create pofiles
    before_action :authenticate_user!, except: [:index, :show]
    before_action :require_permission, only: [:edit, :update, :destroy]


    def index
        @profiles = Profile.all
    end

    def show
        #@profile = find_profile
    end

    def new
        # profile belongs to user
        @profile = current_user.build_profile
    end

    def create
        @profile = current_user.build_profile(profile_params)

        if @profile.save
            redirect_to root_path
        else 
            render 'new'
        end
    end

    def edit
        @profile = current_user.profile
        #@notes = Note.all.collect {|note| [ note.title, note.id ] }
    end

    def update
        if @profile.update(profile_params)
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def destroy
        @profile.destroy
        redirect_to root_path
    end

    private

    def find_profile
        @profile = current_user.profile
    end


    def profile_params
        params.require(:profile).permit(:name, :about_me, attachments:[])
    end
    
    def require_permission
        if current_user != find_profile.user
            redirect_to root_path
        end
    end

end
