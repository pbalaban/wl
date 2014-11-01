class Place < ActiveRecord::Base
  belongs_to :user
  has_many :exercises
  has_many :workouts
end
