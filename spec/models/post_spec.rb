require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'instances' do
    it 'should not be valid' do
      post = Post.new

      expect(post).to_not be_valid
    end

    it 'should be valid' do
      post = Post.new(name: 'First post')

      expect(post).to be_valid
    end
  end
end
