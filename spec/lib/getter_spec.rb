require_relative '../spec_helper'

describe GetProjects::Getter do
  describe 'All' do
    subject{GetProjects::Getter::All}
    it{should be_kind_of Hash}
  end

  describe '.create' do
    context 'when add matcher' do
      subject{GetProjects::Getter::All}
      before(:all) do
        GetProjects::Getter::create(:hoge) do |prj, opt|
        end
      end

      it 'should be include added getter' do 
        expect(subject).to be_include(:hoge)
      end
    end

    context 'when add worng getter' do
      let(:getter1){GetProjects::Getter::create('hoge'){|prj, opt|}}
      let(:getter2){GetProjects::Getter::create(:hoge){|prj|}}

      it {expect{getter1}.to raise_error(ArgumentError)}
      it {expect{getter2}.to raise_error(ArgumentError)}
    end
  end

  describe Enumerable do
    subject{GetProjects::Matcher}

    its(:each){should be_kind_of Enumerator}
  end
end
