require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryBot.create(:user)
    sign_in user
  end

  let(:valid_attributes) do
    {
      name: "Elomar Nascimento dos Santos",
      email: "elomarns@elomarns.com",
      password: "my-password"
    }
  end

  let(:invalid_attributes) {
    {
      name: nil,
      email: nil,
      password: nil
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      user = User.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      user = User.create! valid_attributes
      get :show, params: { id: user.to_param }, session: valid_session
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
      user = User.create! valid_attributes
      get :edit, params: { id: user.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: { user: valid_attributes },
            session: valid_session
        }.to change(User, :count).by(1)
      end

      it "redirects to the users list" do
        post :create, params: { user: valid_attributes },
          session: valid_session

        expect(response).to redirect_to(admin_users_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { user: invalid_attributes },
          session: valid_session

        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        valid_attributes.merge(name: "Batman")
      }

      it "updates the requested user" do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: new_attributes },
          session: valid_session

        user.reload

        expect(user.name).to eql("Batman")
      end

      it "redirects to the users list" do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: valid_attributes },
          session: valid_session
        expect(response).to redirect_to(admin_users_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: invalid_attributes },
          session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes

      expect {
        delete :destroy, params: { id: user.to_param },
          session: valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! valid_attributes
      delete :destroy, params: { id: user.to_param }, session: valid_session
      expect(response).to redirect_to(admin_users_url)
    end
  end
end
