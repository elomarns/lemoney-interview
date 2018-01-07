require 'rails_helper'

RSpec.describe Admin::OffersController, type: :controller do
  let(:valid_attributes) do
    {
      advertiser_name: "GearBest",
      url: "https://www.gearbest.com/body-scale/pp_615115.html?utm_campaign=7941031&utm_source=cj&utm_medium=affiliate&from=affiliate_cj",
      description: "Xiaomi Bluetooth 4.0 Smart Weight Scale $33.99 with Coupon",
      starts_at: DateTime.parse("6/1/2018"),
      ends_at: DateTime.parse("12/1/2018"),
      premium: true
    }
  end

  let(:invalid_attributes) {
    {
      advertiser_name: nil,
      url: nil,
      description: nil,
      starts_at: nil,
      ends_at: nil,
      premium: false
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      offer = Offer.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      offer = Offer.create! valid_attributes
      get :show, params: { id: offer.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      offer = Offer.create! valid_attributes
      get :edit, params: { id: offer.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Offer" do
        expect {
          post :create, params: { offer: valid_attributes },
            session: valid_session
        }.to change(Offer, :count).by(1)
      end

      it "redirects to the offers list" do
        post :create, params: { offer: valid_attributes },
          session: valid_session

        expect(response).to redirect_to(admin_offers_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { offer: invalid_attributes },
          session: valid_session

        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        valid_attributes.merge(advertiser_name: "Gear Best")
      }

      it "updates the requested offer" do
        offer = Offer.create! valid_attributes
        put :update, params: { id: offer.to_param, offer: new_attributes },
          session: valid_session

        offer.reload

        expect(offer.advertiser_name).to eql("Gear Best")
      end

      it "redirects to the offers list" do
        offer = Offer.create! valid_attributes
        put :update, params: { id: offer.to_param, offer: valid_attributes },
          session: valid_session
        expect(response).to redirect_to(admin_offers_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        offer = Offer.create! valid_attributes
        put :update, params: { id: offer.to_param, offer: invalid_attributes },
          session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested offer" do
      offer = Offer.create! valid_attributes

      expect {
        delete :destroy, params: { id: offer.to_param },
          session: valid_session
      }.to change(Offer, :count).by(-1)
    end

    it "redirects to the offers list" do
      offer = Offer.create! valid_attributes
      delete :destroy, params: { id: offer.to_param }, session: valid_session
      expect(response).to redirect_to(admin_offers_url)
    end
  end
end
