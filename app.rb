require 'sinatra'

require 'sinatra/activerecord'
require './models'
set :database, 'sqlite3:books.sqlite3'

#  List of all blogs
get '/blogs' do
    @blogs = Blog.all
    erb :"blogs/index"
end

    # create blogs
    get "blogs/new" do
        erb :"blogs/new"
    end


    post "/create_blog" do
 Blog.create(title: params[:title], content: params[:content], user_id: current_user.id)
set :database, 'sqlite3:books.sqlite3'
set :sessions, true
end



def current_user
	if (session[:user_id])
		@current_user = User.find(session[:user_id])
	end
end

get "/" do

@users = User.all
erb :'users/index'
end

# Signup action
 get "/signup" do

 erb :'users/userprofilenew'
 end



    post "/create" do
      User.create(username: params[:username], password: params[:password])
      redirect "/userprofilenew"
    end

# Login functionality

get "/login" do

erb :'users/login'
end

post "/login" do
	@user = User.where(username: params[:username]).first
	if user.password == params[:password]
		session[:user_id] = user.id
		redirect "/"
	else
		redirect "/userprofilenew"
	end
end

# Create New Profile

get "/signup/userprofilenew" do

	erb :'users/userprofilenew'

end


post "/create_newprofile" do
	if !session[:user_id]
		redirect "/signup"
	else
		current_user = User.find(session[:user_id])
		User.create(location: params[:location], hobby: params[:hobby], user_id: current_user.id)
		redirect "/signup/userprofilenew"
	end
end

    post "/create" do
      User.create(username: params[:username], password: params[:password])
      redirect "/userprofilenew"
    end

get "/profile" do


erb :'users/profile'
end






