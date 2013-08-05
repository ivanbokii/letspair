require'spec_helper' 

describe UsersController do
  it "get_users renders json with users" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)

    get :get_users
    expect(response.body).to eq(User.all.to_json)
    # expect(response.body).to match_array [user]
  end

  it "renders the :index view" do
    get :index
    expect(response).to render_template :index
  end
end
