class WelcomeController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
    @notes = Note.order("created_at DESC")
  end
end
