class ListsController < ApplicationController

    get '/lists' do
        @lists = List.all
        erb :'/lists/index'
    end

    get '/lists/new' do
        erb :'/lists/new'
    end

    post '/lists' do
        @list = List.create(name: params[:name], description: params[:description], to_do: params[:to_do], image: params[:image])
        redirect "/lists/#{@list.id}"
    end

    get '/lists/:id' do
        @list = List.find_by_id(params[:id])
        erb :'/lists/show'
    end

    get '/lists/:id/edit' do
        @list = List.find_by_id(params[:id])
        erb :'/lists/edit'
    end

    patch '/lists/:id' do
        @list = List.find_by_id(params[:id])
        @list.update(name: params[:name], description: params[:description], to_do: params[:to_do], image: params[:image])
        @list.save
        redirect "/lists/#{@list.id}"
    end

    post '/lists/:id/delete' do
        @list = List.find_by_id(params[:id])
        @list.delete
        redirect '/lists'
    end

end