class OwnersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/'  #TODO change this redirect to owner's index
    else
      erb :'users/create_owners'
    end
  end

  post
end
