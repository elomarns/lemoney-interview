FactoryBot.define do
  factory :offer do
    advertiser_name "Walmart"
    url "https://www.walmart.com.br/console-playstation-4-pro-1tb-4k-sony/6127440/pr"
    description "Buy the most powerful version of PS4 with a 10% discount!"
    starts_at DateTime.now + 5.days
    status "enabled"
  end
end
