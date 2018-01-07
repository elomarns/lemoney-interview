module OffersHelper
  def link_to_offer_url(offer)
    if offer.premium?
      link_classes = "btn green"
    else
      link_classes = "btn grey"
    end

    link_classes << " waves-effect waves-light"

    link_to offer.url, target: :blank, class: link_classes do
      content_tag(:i, "shopping_cart", class: "material-icons left") + "Shop Now"
    end
  end
end
