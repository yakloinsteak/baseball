require 'spec_helper'

describe PlayerDecorator do
  let(:player) { Player.create! }

  it "should support multiple positions" do
    player.contracts.create position: 'Third Base'
    player.contracts.create position: 'First Base'
    player.decorate.position.should == 'First Base/Third Base'
  end
end
