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

    get '/login' do
        erb :'/users/login'
    end

    post '/login' do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/lists'
        end
        redirect '/login'
    end
end