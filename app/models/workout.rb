class Workout < ActiveRecord::Base
  belongs_to :place
  has_many :exercise_items
  before_create :set_date

  scope :sorted, ->{ order(created_at: :desc, id: :desc) }
  scope :limit_with, ->(value) { limit(value.to_i) if value.to_i > 0 }

  validates :place_id, presence: true

  private

  def set_date
    self.date = Date.current
  end
end
