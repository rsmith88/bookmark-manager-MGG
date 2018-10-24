
describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
     connection.exec("INSERT INTO bookmarks (url) VALUES ('www.makersacademy.com');")
     connection.exec("INSERT INTO bookmarks (url) VALUES ('www.google.com');")
     bookmarks = Bookmark.all

    expect(bookmarks).to include 'www.makersacademy.com'
    expect(bookmarks).to include 'www.google.com'

  end
end
