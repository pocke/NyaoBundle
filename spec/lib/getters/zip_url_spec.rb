require_relative '../../spec_helper'

describe 'zip url getter' do
  subject{NyaoBundle::Getter[:zip_url]}

  url = 'https://example.com/hoge.zip'
  opt = {name: 'hoge', getter: :zip_url}

  before do
    Kernel.stub(:open).and_return(nil)
    FileUtils.stub(:rm_rf).and_return(nil)
  end

  it do
    expect{subject.call(url, opt)}.not_to raise_error
  end
end
