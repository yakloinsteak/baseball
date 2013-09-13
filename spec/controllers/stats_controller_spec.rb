require 'spec_helper'

describe StatsController do
  context "index" do
    let(:mock_stat) { mock_model(Stat).as_null_object }
    before(:each)   { Stat.stub_chain(:search, :decorate).and_return [mock_stat] }

    it "should be successful" do
      get :index
      response.should be_success
      response.should render_template :index
    end
  end
end
