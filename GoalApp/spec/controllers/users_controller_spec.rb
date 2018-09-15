require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'should direct you to the sign up page' do
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  describe 'POST #create' do
    it 'should direct you to the user page' do
      post :create, params: { user: { username: 'parkg748', password: 'helloworld' } }
      expect(response).to redirect_to(user_url(User.last.id))
    end
  end
end