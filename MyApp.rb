require 'sinatra/base'
require './lib/bookmark'

class MyApp < Sinatra::Base

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
    title = params['title']
    url = params['url']
    Bookmark.create(title, url)
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
