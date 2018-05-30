require 'sinatra'
require 'sinatra/activerecord' 
require './models'   
set :database, 'sqlite3:books.sqlite3'
set :sessions, true

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

get "/userprofilenew" do

	erb :'useprofilenew'

end


