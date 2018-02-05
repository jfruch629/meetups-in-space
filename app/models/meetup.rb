class Meetup < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  validates :name, presence: { message: "A Name of the Meetup must be provided."}
  validates :description, presence: { message: "A Description must be provided."}
  validates :location, presence: { message: "A Location must be provided."}
end
