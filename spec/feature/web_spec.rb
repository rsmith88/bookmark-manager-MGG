feature 'index page' do
  scenario 'shows bookmarks on page' do
    visit '/'
    expect(page).to have_content('Bookmark page')
  end

  scenario 'views bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content ('www.bookmark.com')
  end
end
