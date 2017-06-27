class ToysController < ApplicationController

  get '/toys' do
    if logged_in?
      @toys = Toy.all
      erb :'toys/index'
    else
      redirect '/login'
    end
  end

  get '/toys/new' do
    if logged_in?
      erb :'toys/create_toys'
    else
      redirect '/login'
    end
  end

  post '/toys' do
    # binding.pry
    toy = current_user.toys.build(params[:toy])
    if toy.save
      redirect "/owners/#{current_user.id}"
    else
      redirect '/failure' #TODO do something better with this
    end
  end

  get '/toys/:id' do
    if logged_in?
      @toy = Toy.find(params[:id])
      # binding.pry
      erb :'toys/show'
    else
      redirect '/login'
    end
  end

  get '/toys/:id/edit' do
    if logged_in?
      @toy = Toy.find(params[:id])
      @owners = Owner.all
      if @toy.owner_id == current_user.id
        erb :'toys/edit'
      else
        redirect '/toys' #TODO rack error message doesn't belong to you
      end
    else
      redirect '/login'
    end
  end

  patch '/toys/:id' do
    # binding.pry
    @toy = Toy.find(params[:id])
    @toy.assign_attributes(params[:toy])
    if @toy.save
      redirect "/toys/#{@toy.id}"
    else
      redirect "/toys/#{@toy.id}/edit" #TODO implement rack flash message here - something went wrong
    end
  end

  delete '/toys/:id/delete' do
    if logged_in?
      @toy = Toy.find(params[:id])
      if @toy.owner_id == current_user.id
        @toy.delete
        redirect '/toys'
      else
        redirect '/toys' #TODO rack error message doesn't belong to you
      end
    else
      redirect '/login'
    end
  end
end
