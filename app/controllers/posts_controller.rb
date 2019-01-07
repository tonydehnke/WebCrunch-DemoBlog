class PostsController < ApplicationController

  def index
  end

  def def new
    @ = .new
  end

  def def create
    @object = Object.new(params[:object])
    if @object.save
      flash[:success] = "Object successfully created"
      redirect_to @object
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  

end
