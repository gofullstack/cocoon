require_relative 'spec_helper'

describe 'postgres' do
  it 'is running' do
    expect(process 'postgres').to be_running
  end

  it 'listens on a tcp socket' do
    expect(port 5432).to be_listening
  end

  it 'has a vagrant user' do
    cmd = command 'echo "\dg" | sudo -u postgres psql'
    expect(cmd.stdout).to match 'vagrant'
  end
end
