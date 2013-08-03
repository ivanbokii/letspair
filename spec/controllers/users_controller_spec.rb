require'spec_helper' 

describe UsersController do
  it "returns list of all users" do
    user = FactoryGirl.create(:user)
    get :index
    expect(assigns(:users)).to match_array [user]
  end
  
  it "renders the :index users view" do
    get :index
    expect(response).to render_template :index
  end

  it "returns the list of all users in the right order"
end