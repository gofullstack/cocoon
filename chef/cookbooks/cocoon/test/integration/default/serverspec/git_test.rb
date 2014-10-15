require_relative 'spec_helper'

describe 'git' do
  describe package('git') do
    it { should be_installed }
  end
end
