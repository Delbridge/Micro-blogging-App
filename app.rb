require 'sinatra'
require 'sinatra/activerecord'
require './models'
set :database, 'sqlite3:books.sqlite3'


# Signup action
 get "/signup" do
   erb :"users/new"
 end

    post "/create" do
      User.create(username: parmas[:username], password: params[:password])
      redirect "/userprofilenew"
    end

