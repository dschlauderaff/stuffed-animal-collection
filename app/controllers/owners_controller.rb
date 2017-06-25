class OwnersController < ApplicationController

  get '/signup' do
    erb :'users/create_owners'
  end
end
