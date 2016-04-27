json.array!(@ordrs) do |ordr|
  json.extract! ordr, :id, :otype, :ofrom, :menu, :invited, :joined, :status, :user_id
  json.url ordr_url(ordr, format: :json)
end
