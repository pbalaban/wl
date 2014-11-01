class Workout < ActiveRecord::Base
  belongs_to :place

  before_create :set_date

  private

  def set_date
    self.date = Date.current
  end
end
