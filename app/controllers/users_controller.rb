class UsersController < ApplicationController
    
    get '/signup' do
        erb :'/users/signup'
    end

    post '/signup' do
        user = User.new(name: params[:name], email: params[:email], password: params[:password])
        if user.valid?
            user.save
            session[:user_id] = user.id
            redirect '/lists'
        else
            redirect '/signup'
        end
    end
end