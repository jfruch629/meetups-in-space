require 'spec_helper'

feature "User views all meetups" do
  let(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end

    let(:meetup) do
      Meetup.create(
        name: 'Basketball on the Moon!',
        description: 'Low gravity fun, while still focusing on getting in a good game of 5v5 basketball.',
        location: 'The Moon',
        creator: user.username
      )
    end

  scenario "a signed in user can view all meetups listed alphabetically" do
    visit '/'
    sign_in_as user
    visit '/'

    expect(page).to have_content('Basketball on the Moon!')
  end

  scenario "user views a meetup for details" do
    click_link 'Basketball on the Moon! - jarlax1'

    expect(page).to have_content('Basketball on the Moon!')
    expect(page).to have_content('Low gravity fun, while still focusing on getting in a good game of 5v5 basketball.')
    expect(page).to have_content('Location: The Moon')
    expect(page).to have_content('Creator: jarlax1')
  end
end
