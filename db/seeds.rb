Offer.create(advertiser_name: "GearBest",
  url: "https://www.gearbest.com/body-scale/pp_615115.html?utm_campaign=7941031&utm_source=cj&utm_medium=affiliate&from=affiliate_cj",
  description: "Xiaomi Bluetooth 4.0 Smart Weight Scale $33.99 with Coupon",
  starts_at: DateTime.parse("6/1/2018"),
  ends_at: DateTime.parse("12/1/2018"),
  premium: true)

Offer.create(advertiser_name: "The Home Depot",
  url: "https://www.homedepot.com/b/Decor-Bedding-Bath/Special-Values/N-5yc1vZci04Z7?AID=13180361&PID=7941031&SID=LY000047938418106&cm_mmc=CJ-_-7941031-_-13180361&cj=true",
  description: "Save Up To 30% Off Bedding and Bath @ The Home Depot!",
  starts_at: DateTime.parse("6/1/2018"),
  ends_at: DateTime.parse("12/1/2018"),
  premium: false)

Offer.create(advertiser_name: "Target",
  url: "https://intl.target.com/c/furniture/-/N-5xtnr?clkid=b1c01539N0e08373bd6749c703c011ad5&lnm=79371&afid=Lemmoney%20LLC.&ref=tgt_adv_xasd0002",
  description: "Target Furniture + Spend $35, Get Free Shipping",
  starts_at: DateTime.parse("6/1/2018"),
  ends_at: DateTime.parse("12/1/2018"),
  premium: false)

Offer.create(advertiser_name: "Macy's",
  url: "https://www.macys.com/?ranMID=3184&ranEAID=0a0qivlCURI&ranSiteID=0a0qivlCURI-2i3k4bGZtOlVrn2hTnS_zw&LinkshareID=0a0qivlCURI-2i3k4bGZtOlVrn2hTnS_zw&PartnerID=LINKSHARE&cm_mmc=LINKSHARE-_-5-_-63-_-MP563",
  description: "40%-60% Off Women's Coats- Peacoats, Puffers and More",
  starts_at: DateTime.parse("6/1/2018"),
  ends_at: DateTime.parse("10/1/2018"),
  premium: false)

Offer.create(advertiser_name: "Jabra",
  url: "https://www.jabra.com/deals?utm_medium=affiliate&utm_source=cj",
  description: "Save 40% on Jabra Freewa",
  starts_at: DateTime.parse("6/1/2018"),
  ends_at: DateTime.parse("15/1/2018"),
  premium: false)

Offer.create(advertiser_name: "Karen Kane",
  url: "http://www.karenkane.com/store/sale/apparel-sale-view-all?cat=312&utm_source=pjx&utm_medium=Affiliate&utm_campaign=148749",
  description: "THREE DAYS ONLY - ADDITIONAL 25% OFF SALE TOPS",
  starts_at: DateTime.parse("6/1/2018"),
  ends_at: DateTime.parse("11/1/2018"),
  premium: false)

Offer.create(advertiser_name: "JBL",
  url: "https://www.jbl.com/everest-headphones.html?utm_source=cj&utm_medium=affiliate&utm_campaign=jbl-everest-series-25-per-off-jan6&CJPID=CJ",
  description: "Up to 25% off JBL Everest Series Select Models, Comfort fit Wireless...",
  starts_at: DateTime.parse("6/1/2018"),
  ends_at: DateTime.parse("11/1/2018"),
  premium: true)

Offer.all.each(&:toggle_status)
