json.array!(@exercise_items) do |exercise_item|
  json.extract! exercise_item, :id, :workout_id, :exercise_id, :time, :repeats_count, :value
  json.url exercise_item_url(exercise_item, format: :json)
end
