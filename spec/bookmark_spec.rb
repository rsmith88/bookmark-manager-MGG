require 'bookmark'

describe '.all' do
  it 'returns a list of bookmarks' do
  # connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.create(title: 'Makers', url: 'http://www.makersacademy.com')
    Bookmark.create(title: 'BBC', url: 'http://www.bbc.co.uk')

    bookmarks = Bookmark.all

    expect(bookmarks.length).to eq 2
    expect(bookmarks.first).to be_a Bookmark
    expect(bookmarks.first.title).to eq 'Makers'
    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
  end
end

describe '.delete' do
  it 'deletes the given bookmark' do
    bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
    Bookmark.delete(id: bookmark.id)
    expect(Bookmark.all.length).to eq 0
  end
end

describe '.update' do
  it 'updates the bookmark with the given data' do
    bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
    updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

    expect(updated_bookmark).to be_a Bookmark
    expect(updated_bookmark.id).to eq bookmark.id
    expect(updated_bookmark.title).to eq 'Snakers Academy'
    expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
  end
end

describe '.find' do
  it 'returns the requested bookmark object' do
    bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

    result = Bookmark.find(id: bookmark.id)

    expect(result).to be_a Bookmark
    expect(result.id).to eq bookmark.id
    expect(result.title).to eq 'Makers Academy'
    expect(result.url).to eq 'http://www.makersacademy.com'
  end
end

describe '.create' do
  it 'does not create a new bookmark if the URL is not valid' do
    Bookmark.create(url: 'not a real bookmark', title: 'not a real bookmark')
    expect(Bookmark.all).not_to include 'not a real bookmark'
  end
end
