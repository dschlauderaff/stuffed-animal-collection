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

end
