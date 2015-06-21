require 'spec_helper'

describe Api::V1::UsersController do
  include ApiHelpers

  let(:user)  { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }

  context "when not authenticated" do
    it 'returns 404' do
      get api("/authenticated_user")
      expect(response.status).to eq(401)
    end
  end

  context "when authenticated" do
    it 'returns user data' do
      get api("/authenticated_user", user)
      expect(response.status).to eq(200)
    end
  end

end
