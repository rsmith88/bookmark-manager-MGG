
feature 'Add bookmark' do
  scenario 'user fills in new bookmark and clicks add' do
    visit('/')
    click_button 'Add'
    fill_in 'title', with: "Website"
    fill_in 'url', with: "http://wwww.iamwebsite.com"
    click_button 'Submit'
    expect(page).to have_content "Website"
  end

  scenario 'The bookmark must be a valid URL' do
    visit('/')
    click_button 'Add'
    fill_in 'title', with: "Bad_URL"
    fill_in('url', with: 'not a real bookmark')
    click_button('Submit')

    expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end
end
