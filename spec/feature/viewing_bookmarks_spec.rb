require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'www.bbc.co.uk');")

    visit('/bookmarks')

    expect(page).to have_content "www.makersacademy.com"
    expect(page).to have_content "www.makersacademy.com"
  end
end
