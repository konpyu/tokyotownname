require 'spec_helper'

describe Api::V1::PhotosController do
  include ApiHelpers
  let(:user) { create(:user) }

  describe 'POST /photos' do
    let(:image) { create(:image, :photo, user: user) }

    it 'return error when unauthorized' do
      post api('/photos')
      expect(response.status).to eq(401)
    end

    it 'return error when key is not passed' do
      post api('/photos', user)
      expect(response.status).to eq(400)
    end

    it 'return error when town_id is wrong' do
      post api('/photos', user), { key: image.key, town_id: 199999 }
      expect(response.status).to eq(404)
    end

    it 'return photo object when request success' do
      post api('/photos', user), { key: image.key, town_id: 101001 }
      expect(response.status).to eq(200)
      expect(json_response["user_id"]).to eq(user.id)
      expect(json_response["town_id"]).to eq(101001)
      image.reload
      expect(image.imageable.id).to eq(json_response["id"])
    end
  end

  describe 'PUT /photo/:id' do
    let(:photo) { create(:photo, user: user) }
    it 'return error when unauthorized' do
      put api("/photos/#{photo.id}")
      expect(response.status).to eq(401)
    end

    it 'return error when unauthorized' do
      put api("/photos/999999999", user)
      expect(response.status).to eq(404)
    end

    it 'return ok' do
      put api("/photos/#{photo.id}", user), { comment: "coooool" }
      expect(response.status).to eq(204)
    end
  end

  describe 'GET /photo/:id' do
    let(:photo) { create(:photo, user: user) }
    it 'return error when photo is not exists' do
      get api("/photos/999999999")
      expect(response.status).to eq(404)
    end

    it 'return photo object when success' do
      get api("/photos/#{photo.id}")
      expect(response.status).to eq(200)
      expect(json_response["id"]).to eq(photo.id)
    end
  end

  describe 'DELETE /photo/:id' do
    let(:photo) { create(:photo, user: user) }
    it 'return error when unauthorized' do
      delete api("/photos/#{photo.id}")
      expect(response.status).to eq(401)
    end

    it 'return error when photo is not exists' do
      delete api("/photos/999999999", user)
      expect(response.status).to eq(404)
    end

    it 'return 204 when delete success' do
      delete api("/photos/#{photo.id}", user)
      expect(response.status).to eq(204)
    end
  end

end
