require_relative '../spec_helper'

describe NyaoBundle::Getter do
  describe 'All' do
    subject{NyaoBundle::Getter::All}
    it{should be_kind_of Hash}
  end

  describe '.create' do
    context 'when add matcher' do
      subject{NyaoBundle::Getter::All}
      before(:all) do
        NyaoBundle::Getter::create(:hoge) do |prj, opt|
        end
      end

      it 'should be include added getter' do 
        expect(subject).to be_include(:hoge)
      end
    end

    context 'when add worng getter' do
      let(:getter1){NyaoBundle::Getter::create('hoge'){|prj, opt|}}
      let(:getter2){NyaoBundle::Getter::create(:hoge){|prj|}}

      it {expect{getter1}.to raise_error(ArgumentError)}
      it {expect{getter2}.to raise_error(ArgumentError)}
    end
  end

  describe Enumerable do
    subject{NyaoBundle::Matcher}

    its(:each){should be_kind_of Enumerator}
  end
end
