require 'sinatra/base'
require './lib/bookmark'

class MyApp < Sinatra::Base

  get '/' do
    @bookmarks = Bookmark.create
    erb :index
  end

  get '/bookmarks' do
    p ENV
    @bookmarks = Bookmark.create
    erb :bookmark
  end

  run! if app_file == $0

end
