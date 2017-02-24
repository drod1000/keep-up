require 'rails_helper'

describe "Lists API" do
  it "can create a list" do
    user = create(:user)
    allow_any_instance_of(Api::V1::ListsController).to receive(:current_user).and_return(user)

    post "/api/v1/lists/?list_name=some_list"

    expect(response).to be_success
    expect(response.status).to eq(201)

    expect(List.count).to eq(1)
    expect(user.lists.count).to eq(1)

    created_list = user.lists.first

    expect(created_list.name).to eq("some_list")
  end
end
