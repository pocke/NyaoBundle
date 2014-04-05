require_relative '../spec_helper'

describe NyaoBundle::Matcher do
  describe 'All' do
    subject{NyaoBundle::Matcher::All}
    it{should be_kind_of Hash}
  end

  describe '.create' do
    context 'when add matcher' do
      subject{NyaoBundle::Matcher::All}
      before(:all) do
        NyaoBundle::Matcher::create(:hoge) do |prj, opt|
        end
      end

      it 'should be include added matcher' do 
        expect(subject).to be_include(:hoge)
      end
    end

    context 'when add worng matcher' do
      let(:matcher1){NyaoBundle::Matcher::create('hoge'){|prj, opt|}}
      let(:matcher2){NyaoBundle::Matcher::create(:hoge){|prj|}}

      it {expect{matcher1}.to raise_error(ArgumentError)}
      it {expect{matcher2}.to raise_error(ArgumentError)}
    end
  end

  describe Enumerable do
    subject{NyaoBundle::Matcher}

    its(:each){should be_kind_of Enumerator}
  end
end
