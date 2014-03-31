require_relative '../spec_helper'

describe GetProjects::Matcher do
  describe 'All' do
    subject{GetProjects::Matcher::All}
    it{should be_kind_of Array}

    context 'when add matcher' do
      before(:all) do
        module GetProjects::Matcher;def mat(p, o={});end;end
      end

      it 'should be include added matcher' do 
        expect(subject).to be_include(:mat)
      end
    end

    context 'when add worng matcher' do
      let(:matcher){module GetProjects::Matcher;def mat();end;end}

      it do
        expect{matcher}.to raise_error(GetProjects::Matcher::WrongMatcher)
      end
    end

  end

  describe Enumerable do
    subject{GetProjects::Matcher}

    its(:each){should be_kind_of Enumerator}
  end
end
