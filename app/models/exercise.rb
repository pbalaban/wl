class Exercise < ActiveRecord::Base
  # We have different types of exercies:
  # 0 - we just need track times of execution. Example: Push ups, squats, etc
  # 1 - we need know weight of inventory and times of execution: dumbbells, barbell
  #
  # We must provide validations and filling forms agree to expected input type.

  VALUES_TYPES = [['Only times', 0], ['Times and weights', 1]]
  TYPES = {
    only_time: 0,
    time_and_weight: 1
  }

  MUSCLE_GROUPS = [:legs, :ass, :hands, :neck, :back, :press]

  belongs_to :place

  validates :name, :values_type, :muscle_group, presence: true

  def need_weight?
    values_type == TYPES[:time_and_weight]
  end
end
