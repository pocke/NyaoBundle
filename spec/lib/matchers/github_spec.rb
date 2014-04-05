require_relative '../../spec_helper'

describe 'github matcher' do
  subject{NyaoBundle::Matcher[:github]}

  project = 'pocke/dotfiles'
  opt = {}

  it 'should be return url' do
    expect(subject.call(project, opt)).to eq "https://github.com/#{project}.git"
  end

  it 'should be set opt' do
    opt = {}
    subject.call(project, opt)

    expect(opt[:getter]).to eq :git
    expect(opt[:name]).to eq 'dotfiles'
  end
end
