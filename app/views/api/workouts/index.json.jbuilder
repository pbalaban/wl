json.array!(@workouts) do |workout|
  json.extract! workout, :id, :date
  json.place_name workout.place.name
end
