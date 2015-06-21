require 'spec_helper'

describe Api::V1::UploadImage::ImagesController do
  include ApiHelpers
  let(:user)  { create(:user) }
  let(:img_file) { Rack::Test::UploadedFile.new('spec/assets/sample.jpg', 'image/jpg', true) }
  let(:txt_file) { Rack::Test::UploadedFile.new('spec/assets/sample.txt', 'text/plain', true) }

  describe 'photo' do
    it 'return error when unauthorized' do
      post api('/upload_image/photo')
      expect(response.status).to eq(401)
    end

    it 'return error when file is not attached' do
      post api('/upload_image/photo', user)
      expect(response.status).to eq(400)
    end

    it 'return error when illegal file type attached' do
      post api('/upload_image/photo', user), { file: txt_file }
      expect(response.status).to eq(422)
    end

    it 'return image object when upload success' do
      post api('/upload_image/photo', user), { file: img_file }
      expect(response.status).to eq(200)
      expect(json_response["kind"]).to eq("photo")
      expect(json_response["user_id"]).to eq(user.id)
      expect(json_response["key"].present?).to eq(true)
    end
  end

end
