require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require_relative './database_connection_setup'
require 'uri'

class MyApp < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmark
  end

  get '/add_bookmarks' do
    erb :add_bookmarks
  end

  post '/saved_bookmark' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("DELETE FROM bookmarks WHERE id = #{params['id']}")
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    @bookmark_id = params[:id]
    erb :edit_bookmark
  end

  patch '/bookmarks/:id' do
    #p params
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("UPDATE bookmarks SET url = '#{params[:url]}', title = '#{params[:title]}' WHERE id = '#{params[:id]}'")
    # redirect('/bookmarks')
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
