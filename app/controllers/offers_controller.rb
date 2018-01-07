class OffersController < ApplicationController
  def index
    @offers = Offer.enabled.premium_first
  end
end
