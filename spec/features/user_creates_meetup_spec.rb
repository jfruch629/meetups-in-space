require 'spec_helper'

feature "User creates new Meetup" do
  let(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end


  scenario "Signed in user successfully sets up new Meetup" do
    visit '/'
    sign_in_as user
    click_link 'Create Meetup'

    expect(page).to have_content('Meetup Name:')
    fill_in 'name', :with => 'Football on the Stars!'
    fill_in 'description', :with => 'Have you always wanted to tackle or be tackled among the stars? Well nows your chance to do it with people who feel the same way!'
    fill_in 'location', :with => 'The Stars'
    fill_in 'creator', :with => user.username

    click_link 'Create Meetup'

    expect(page).to have_content('Football on the Stars!')
    expect(page).to have_content('Have you always wanted to tackle or be tackled among the stars? Well nows your chance to do it with people who feel the same way!')

    click_link 'All Meetups'

    expect(page).to have_content('Meetups in Space')
    expect(page).to have_content('Football on the Stars! - jarlax1')
  end

  scenario "Guest(not signed in) unsuccessfully sets up new Meetup" do
    click_link 'Create Meetup'

  end
end
