
feature 'Add bookmark' do
  scenario 'user fills in new bookmark and clicks add' do
  visit('/bookmarks')
  click_link 'Add'
  fill_in 'url', with: "wwww.iamwebsite.com"
  click_button 'Submit'
  expect(page).to have_content "wwww.iamwebsite.com"
  end
end
