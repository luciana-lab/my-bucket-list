class ListsController < ApplicationController

    get '/lists' do
        @lists = List.all
        erb :'/lists/index'
    end

    get '/lists/:id' do
        @list = List.find(params[:id])
        erb :'/lists/show'
    end
end