require 'rails_helper'

describe CartsController do

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      get :edit
      expect(response).to render_template(:edit)
    end

    it "assigns the cart instance variable" do
      cart = create(:cart)
      get :edit, nil, cart_id: cart.id
      expect(assigns(:cart)).to eq(cart)
    end

    # TODO: why isn't this working?
    it "sets the session cart_id" do
      get :edit
      expect(assigns(session[:cart_id])).not_to be_nil
    end
  end

end
