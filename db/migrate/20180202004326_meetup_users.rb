class MeetupUsers < ActiveRecord::Migration
  def change
    create_table :meetups_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :meetup, index: true

    end
  end
end
