require './config/environment'

class ApplicationController < Sinatra::Base

  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "owly owl"
  end

  get '/' do
    erb :index
  end

  get '/success' do
    erb :'users/success'
  end

  get '/failure' do
    erb :'users/failure'
  end

  helpers do
    def logged_in?
      !!current_user
    end

    #calls the user logged in the session hash to the @current_user variable, or finds that user if @current_user is nil and the session[:user_id] has a value
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] 
    end

    # helper for a user to log in after creating account
    def user_log_in(user)
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect "/users/#{user.id}"

      else
        flash[:message] = "Account could not be authenticated. Please enter username and password."
        redirect '/login'
      end
    end
  end
end
