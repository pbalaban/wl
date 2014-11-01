class Workout < ActiveRecord::Base
  belongs_to :place
  has_many :exercise_items
  before_create :set_date

  private

  def set_date
    self.date = Date.current
  end
end
