json.array!(@notifications) do |notification|
  json.extract! notification, :id, :joined, :user_id, :ordr_id
  json.url notification_url(notification, format: :json)
end
