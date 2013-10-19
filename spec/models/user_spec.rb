require 'spec_helper'

describe User do
#  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user=User.new(name: "Example User", email: "user@example.com")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
end
