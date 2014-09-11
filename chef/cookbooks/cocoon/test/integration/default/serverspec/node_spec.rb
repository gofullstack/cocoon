require_relative 'spec_helper'

describe 'node' do
  describe package('nodejs') do
    it { should be_installed }
  end
end
