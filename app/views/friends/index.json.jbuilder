json.array!(@friends) do |friend|
  json.extract! friend, :id, :fid, :user_id
  json.url friend_url(friend, format: :json)
end
