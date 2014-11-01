class Exercise < ActiveRecord::Base
  #We have different types of exercies:
  # 0 - we just need track times of execution. Example: Push ups, squats, etc
  # 1 - we need know weight of inventory and times of execution: dumbbells, barbell
  #
  #We must provide validations and filling forms agree to expected input type.

  VALUES_TYPES = [['Only times', 0], ['Times and weights', 1]]
  belongs_to :place

  validates :name, :values_type, presence: true
end
