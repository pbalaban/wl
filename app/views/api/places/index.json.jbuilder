json.array!(@places) do |place|
  json.extract! place, :id, :name, :description
end
