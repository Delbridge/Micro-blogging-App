require 'sinatra'

require 'sinatra/activerecord' 
require './models'   
set :database, 'sqlite3:books.sqlite3'
set :sessions, true


def current_user
	if (session[:user_id])
		@current_user = User.find(session[:user_id])
	end
end

get "/" do  


erb :'users/index'
end

# Login functionality

get "/login" do

erb :'users/login'
end

post "login" do
	user = User.where(username: params[:username]).first
	if user.password == params[:password]
		session[:user_id] = user.user_id
		redirect "/userprofilenew"
	else
		redirect "/login"
	end
end

get "signup/userprofilenew" do

	erb :'userprofilenew'

end


post "/create_newprofile" do
	if !session[:user_id]
		redirect "/signup"
	else
		current_user = User.find(session[:user_id])
		User.create(location: params[:location], hobby: params[:hobby], user_id: current_user.id)
		redirect "/userprofilenew"
	end
end







# Signup action
 get "/signup" do
   erb :"users/new"
 end

    post "/create" do
      User.create(username: parmas[:username], password: params[:password])
      redirect "/userprofilenew"
    end


