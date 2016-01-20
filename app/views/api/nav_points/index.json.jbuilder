json.array!(@nav_points) do |nav_point|
  json.extract! nav_point, :id, :nav_content_id, :lat, :long
  json.url nav_point_url(nav_point, format: :json)
end
