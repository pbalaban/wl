class ExerciseItem < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise

  validates :exercise,  presence: true
  validates :repeats_count, presence: true, numericality: { greater_than: 0 }
  validates :weight, numericality: { greater_than: 0 }, allow_blank: true

  delegate :name, allow_nil: true, prefix: true, to: :exercise
end
