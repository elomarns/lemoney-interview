class Admin::OffersController < ApplicationController
  before_action :set_offer, only: [:edit, :update, :toggle_status, :destroy]

  # GET /admin/offers
  # GET /admin/offers.json
  def index
    @offers = Offer.newer_first
  end

  # GET /admin/offers/1
  # GET /admin/offers/1.json
  def show
  end

  # GET /admin/offers/new
  def new
    @offer = Offer.new
  end

  # GET /admin/offers/1/edit
  def edit
  end

  # POST /admin/offers
  # POST /admin/offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to admin_offers_path,
          notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/offers/1
  # PATCH/PUT /admin/offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to admin_offers_path,
          notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # PATCH /admin/offers/1
  # PATCH /admin/offers/1.json
  def toggle_status
    @offer.toggle_status

    respond_to do |format|
      format.html { redirect_to admin_offers_url,
        notice: 'Offer status was updated.' }
      format.json { render :show, status: :ok, location: @offer }
    end
  end

  # DELETE /admin/offers/1
  # DELETE /admin/offers/1.json
  def destroy
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to admin_offers_url,
        notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_offer
      @offer = Offer.find(params[:id])
    end

    def offer_params
      params.require(:offer).permit(:advertiser_name, :url, :description,
                                    :starts_at, :ends_at, :premium)
    end
end
