json.extract! offer, :id, :advertiser_name, :url, :description,
  :starts_at, :ends_at, :premium, :status, :created_at, :updated_at
json.url admin_offer_url(offer, format: :json)
