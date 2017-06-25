class ToysController < ApplicationController

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
    
  end

end