require 'sinatra/base'
require './lib/bookmark'

class MyApp < Sinatra::Base
  enable :sessions, :method_override

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
    Bookmark.create(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("DELETE FROM bookmarks WHERE id = #{params['id']}")
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
