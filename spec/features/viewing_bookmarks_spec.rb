require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('Makers', 'www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('BBC', 'www.bbc.co.uk');")

    visit('/bookmarks')

    expect(page).to have_content 'Makers'
    expect(page).to have_content 'BBC'
  end

end
