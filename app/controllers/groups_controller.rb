class GroupsController < ApplicationController
    # only signed in can create groups
    before_action :authenticate_user!, except: [:index, :show]
    before_action :require_permission, only: [:edit, :update, :destroy]
  
  
    def index        
        @groups = Group.all
    end
  
    def show
        @group = Group.find(params[:id])
        @members = Member.all
        @users = User.all
    end
  
    def new
        # user has_many groups
        # @group = Group.new
        @group = current_user.groups.build
    end
  
    def create
        @group = current_user.groups.build(group_params)
  
        if @group.save
            redirect_to @group
        else 
            render 'new'
        end
    end
  
    def edit
        @groups = Group.all.collect {|group| [ group.id ] }
        @group = Group.find(params[:id])
    end
  
    def update
        @group = Group.find(params[:id])
        if @group.update(group_params)
            redirect_to @group
        else
            render 'edit'
        end
    end
  
    def destroy
        @group = Group.find(params[:id])
        @group.destroy
        redirect_to dashboard_index_path
    end
  
    # def join
    #     group_id = params[:group_id]
    #     group = Group.find(group_id)
    #     @member = Member.new(user_id: current_user.id, group_id:group_id)
        
    #     @member.save
    #     if @member.save
    #         flash[:notice] = "Congrats! You have joined this study group!"
    #     end
    #     redirect_to :action => "show", :id => group_id
    # end

    def join
        #course_id = params[:course_id]
        group_id = params[:group_id]
        curr_num_members = Member.all.select {|a| a.group_id == group_id }.count

        group = Group.find(group_id)
        group_capacity = group.capacity

        if curr_num_members < group_capacity
            @member = Member.new(user_id: current_user.id, group_id:group_id)
            @member.save
            flash[:notice] = "Congrats! You have joined this study group!"
        else
            flash[:notice] = "Sorry, the study group is full!"
        end
        
        redirect_to :action => "show", :id => group_id
    end

    def unjoin
        #course_id = params[:course_id]
        group_id = params[:group_id]
        group = Group.find(group_id)

        @member = Member.where(group_id: group_id, user_id: current_user.id)
        @member.where(group_id: group_id, user_id: current_user.id).destroy_all
        flash[:notice] = "You have left this study group."

        redirect_to :action => "show", :id => group_id
    end
  
  
    private
  
    def find_group
        @group = Group.find(params[:id])
    end
  
  
    def group_params
        params.require(:group).permit(:category, :description, :start_time, :end_time, :location, :capacity, :user_id)
    end
    
    def require_permission
        if current_user != Group.find(params[:id]).user
            redirect_to root_path
        end
    end
  
  end
  
