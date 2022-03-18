require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(username: 'mike4234') }
  it 'that a user has a valid username' do
    expect(subject).to be_valid
    subject.username = ''
    expect(subject).to_not be_valid
    subject.username = nil
    expect(subject).to_not be_valid
  end
end
