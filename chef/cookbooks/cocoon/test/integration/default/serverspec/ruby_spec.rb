require_relative 'spec_helper'

describe 'ruby' do
  it 'has ruby 2.1.2 installed and set as the default version' do
    cmd = command 'ruby -v'
    expect(cmd.stdout).to match 'ruby 2.1.2'
  end

  describe package('bundler') do
    it { should be_installed.by('gem') }
  end

  describe package('rails') do
    it { should be_installed.by('gem') }
  end
end
