require 'fileutils'
require 'tmpdir'
require_relative '../../spec_helper'

describe 'git getter' do
  subject{NyaoBundle::Getter[:git]}

  url = 'git@bitbucket.org:pocke/get_projects.git'
  opt = {name: 'get_projects', getter: 'git'}

  describe 'clone project' do
    current_dir = Dir::pwd
    tmp_dir = Dir::mktmpdir

    before(:each) do
      Dir::chdir(tmp_dir)
      subject.call(url, opt)
    end

    after(:each) do
      FileUtils::rm_rf(tmp_dir)
      Dir::chdir(current_dir)
    end

    it do
      expect(Dir::exist?(File::join(opt[:name], '.git'))).to be_true
    end
  end
end
