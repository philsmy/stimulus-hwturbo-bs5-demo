require 'rails_helper'

RSpec.describe TimeTracker, type: :model do
  it 'should not have a status' do
    naked_time_tracker = TimeTracker.new
    expect(naked_time_tracker).to_not be_valid
  end
end
