require 'bookmark'

describe Bookmark do
  it 'returns a list of bookmarks' do
    bookmark = Bookmark.create
    expect(bookmark.view).to include "www.makersacademy.com"
  end

  

end
