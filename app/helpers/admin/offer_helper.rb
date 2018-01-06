module Admin::OfferHelper
  def link_to_toggle_offer_status(offer)
    if offer.disabled?
      link_text = "Enable"
    else
      link_text = "Disable"
    end

    link_to link_text, toggle_status_admin_offer_path(offer), method: :patch
  end
end
