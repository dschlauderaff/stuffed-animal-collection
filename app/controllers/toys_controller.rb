class ToysController < ApplicationController

  get '/toys' do
    if logged_in?
      @toys = Toy.all
      erb :'toys/index'
    else
      flash[:message] = "Please login to complete that action"
      redirect '/login'
    end
  end

  get '/toys/new' do
    if logged_in?
      erb :'toys/create_toys'
    else
      flash[:message] = "Please login to complete that action"
      redirect '/login'
    end
  end

  post '/toys' do
    toy = current_user.toys.build(params[:toy])
    if toy.save
      redirect "/users/#{current_user.id}"
    else
      flash[:message] = "Unable to save toy. Please make sure all fields are completed."
      redirect '/toys/new'
    end
  end

  get '/toys/:id' do
    if logged_in?
      @toy = Toy.find(params[:id])
      erb :'toys/show'
    else
      flash[:message] = "Please login to complete that action"
      redirect '/login'
    end
  end

  get '/toys/:id/edit' do
    if logged_in?
      @toy = Toy.find(params[:id])
      @users = User.all
      if @toy.user_id == current_user.id
        erb :'toys/edit'
      else
        flash[:message] = "Only the owner can make changes to the selected toy"
        redirect '/toys'
      end
    else
      flash[:message] = "Please login to complete that action"
      redirect '/login'
    end
  end

  patch '/toys/:id' do
    @toy = Toy.find(params[:id])
    @toy.assign_attributes(params[:toy])
    if @toy.save
      redirect "/toys/#{@toy.id}"
    else
      flash[:message] = "Unable to make requested changes. Please make sure all fields are completed."
      redirect "/toys/#{@toy.id}/edit"
    end
  end

  delete '/toys/:id/delete' do
    if logged_in?
      @toy = Toy.find_by(id: params[:id])
      if @toy.user_id == current_user.id
        @toy.delete
        redirect '/toys'
      else
        flash[:message] = "Only the owner can make changes to the selected toy"
        redirect '/toys'
      end
    else
      flash[:message] = "Please login to complete that action"
      redirect '/login'
    end
  end
end
