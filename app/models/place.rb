class Place < ActiveRecord::Base
  belongs_to :user
  has_many :exercises
  has_many :workouts

  include CommonApiScopes
  validates :name, presence: true

  def current_workout
    @current_workout ||= workouts.where(date: Date.current).sorted.first
  end
end
