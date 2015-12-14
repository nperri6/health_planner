require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :username}
  it { is_expected.to validate_presence_of :email}
  it { is_expected.to validate_presence_of :password_digest}
  it { is_expected.to validate_presence_of :firstname}
  it { is_expected.to validate_presence_of :lastname}
  it { is_expected.to validate_presence_of :birthday}

  # it { is_expected.to validate_uniqueness_of :username}
  # it { is_expected.to validate_uniqueness_of :email}

  it { should allow_value("nick@gmail.com").for(:email)}
  it { should_not allow_value('sdf').for(:email)}
end
