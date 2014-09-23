json.array!(@interesting_things) do |interesting_thing|
  json.extract! interesting_thing, :id, :name, :student_id
  json.url interesting_thing_url(interesting_thing, format: :json)
end
