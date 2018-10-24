require 'bookmark'

describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('www.bbc.co.uk');")

    bookmarks = Bookmark.all

    expect(bookmarks).to include('www.makersacademy.com')
    expect(bookmarks).to include('www.bbc.co.uk')
  end
end
