json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :name, :values_type, :workout_id
  json.url exercise_url(exercise, format: :json)
end
