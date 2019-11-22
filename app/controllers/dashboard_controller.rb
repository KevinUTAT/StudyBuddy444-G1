class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.all
    @notes = Note.all
  end
end
