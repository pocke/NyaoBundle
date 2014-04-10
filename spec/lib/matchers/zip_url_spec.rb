require_relative '../../spec_helper'
require 'uri'

describe 'zip url spec' do
  subject{NyaoBundle::Matcher[:zip_url]}

  base_urls = %w[https://example.com/ http://example.com]

  base_urls.each do |base|
    url = URI::join(base, 'hoge.zip').to_s
    context base.split(?:)[0] do
      it 'should be return url' do
        opt = {}
        expect(subject.call(url, opt)).to eq url
      end

      it 'should be set opt' do
        opt = {}
        subject.call(url, opt)
        expect(opt[:getter]).to eq :zip_url
        expect(opt[:name]).to eq 'hoge'
      end
    end
  end
end
