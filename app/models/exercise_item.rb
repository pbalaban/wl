class ExerciseItem < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise

  validates :exercise,  presence: true
  validates :repeats_count, presence: true, numericality: { greater_than: 0 }


  def exercise_name
    exercise.name if exercise
  end
end
