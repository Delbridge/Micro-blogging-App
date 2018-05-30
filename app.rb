require 'sinatra'
require 'sinatra/activerecord' 
require './models'   
set :database, 'sqlite3:books.sqlite3'  

#  List of all blogs
get '/' do 
    @blogs = Blog.all
    erb :"blogs/index"
end

    # create blogs
    get "blogs/new" do 
        erb :"blogs/new"
    end


    post "/create_blog" do
 Blog.create(title: params[:title], content: params[:content], user_id: current_user.id)
    end


