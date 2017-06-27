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
      !!session[:user_id]
    end

    def current_user
      Owner.find(session[:user_id])
    end

    # helper to avoid requiring a user to log in after creating account
    def user_log_in(user)
      # binding.pry
      if user && user.authenticate(params[:owner][:password])
        session[:user_id] = user.id
        redirect "/owners/#{user.id}"

      else
        redirect '/failure'
      end
    end
  end
end
