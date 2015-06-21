require 'spec_helper'

describe Api::V1::CommentsController do
  include ApiHelpers
  let(:user) { create(:user) }
  let(:photo) { create(:photo, user: user) }

  describe 'POST /photos/:photo_id/comments' do
    it 'should create comment' do
      post api("/photos/#{photo.id}/comments", user), { comment: "hoge" }
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /photos/:photo_id/comments/:id' do
    it 'should remove comment' do
      comment = create(:comment, user: user, commentable: photo)
      delete api("/photos/#{photo.id}/comments/#{comment.id}", user)
      expect(response.status).to eq(204)
    end
  end

  describe 'PUT /photos/:photo_id/comments/:id' do
    it 'should update comment' do
      comment = create(:comment, user: user, commentable: photo)
      put api("/photos/#{photo.id}/comments/#{comment.id}", user), { comment: "fuga" }
      expect(response.status).to eq(200)
    end
  end
end
