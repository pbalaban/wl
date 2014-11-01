class Workout < ActiveRecord::Base
  belongs_to :place
  has_many :exercise_items
  before_create :set_date

  scope :sorted, ->{ order(created_at: :desc, id: :desc) }

  validates :place_id, presence: true

  include CommonApiScopes

  private

  def set_date
    self.date = Date.current
  end
end
