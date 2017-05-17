require_relative "../../spec_helper"

RSpec.describe Bose::Soundtouch::Api do
  it "has a version number" do
    expect(Bose::Soundtouch::Api::VERSION).not_to be nil
  end

  it "does something useful" do
    api = Bose::Soundtouch::Api.new('127.0.0.1')

    expect(api).not_to be_nil
  end
end
