class OwnersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/'  #TODO change this redirect to owner's index
    else
      erb :'users/create_owners'
    end
  end

  post '/signup' do
    owner = Owner.new(params[:owner])
    # binding.pry
    if owner.save
      user_log_in(owner)
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/' #TODO change this redirect to owner's index
    end
  end

  get '/owners/:id' do

    @owner = Owner.find_by(id: params[:id])
    # binding.pry
    erb :'users/show'
  end

  post '/login' do
    # binding.pry
    owner = Owner.find_by(name: params[:owner][:name])

    user_log_in(owner)
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

end
