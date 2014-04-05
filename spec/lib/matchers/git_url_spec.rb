require_relative '../../spec_helper'

describe 'git url matcher' do
  subject{NyaoBundle::Matcher[:git_url]}

  project = 'https://gist.github.com/9520123.git'
  opt = {}

  it 'should be return url' do
    expect(subject.call(project, opt)).to eq project
  end

  it 'should be set opt' do
    opt = {}
    subject.call(project, opt)

    expect(opt[:getter]).to eq :git
    expect(opt[:name]).to eq '9520123'
  end
end
