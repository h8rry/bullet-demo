require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  before(:each) do
    @user_1 = User.create
    @user_2 = User.create

    20.times do
      Question.create(title: 'random', user: @user_1)
      Question.create(title: 'random', user: @user_2)
    end

    Bullet.start_request
  end

  after(:each) do
    Bullet.perform_out_of_channel_notifications if Bullet.notification?
    Bullet.end_request
  end

  context "index all users, includes each user's questions" do
    it "responds correctly" do
      expected_response = {
        users: [{
          questions: @user_1.questions
        }, {
          questions: @user_2.questions
        }]
      }

      get :index
      expect(response.code).to eq("200")
      expect(response.body).to eq(expected_response.to_json)
    end
  end
end
