require 'spec_helper'

RSpec.describe Bose::SoundtouchApi::Client do

  it 'has a version number' do
    expect(Bose::SoundtouchApi::Api::VERSION).not_to be nil
  end

  it 'initializes the client successfully' do
    api = Bose::SoundtouchApi::Client.new('127.0.0.1')
    expect(api).not_to be_nil
  end

end
