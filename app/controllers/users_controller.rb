require 'rack/flash'
class OwnersController < ApplicationController
  # use Rack::Flash

  get '/signup' do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :'users/create_users'
    end
  end

  post '/signup' do
    user = User.new(params[:user])
    if user.save
      user_log_in(user)
    else
      flash[:message] = user.errors.full_messages.join(", ")
           
      redirect '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else

      redirect "/users/#{current_user.id}"
    end
  end

  post '/login' do
    user = User.find_by(name: params[:user][:name])

    user_log_in(user)
  end

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/:id' do

    @user = User.find_by(id: params[:id])
    erb :'users/show'
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

end
