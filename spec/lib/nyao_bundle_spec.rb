require_relative '../spec_helper'

describe NyaoBundle do

  describe '.get' do
    context 'when set getter' do
      opt = {getter: 'hoge'}
      project = 'fuga'

      subject{NyaoBundle.get(project, opt)}

      before do
        getter = double('getter')
        getter.should_receive(:call).with(project, opt).and_return('piyo')
        NyaoBundle::Getter.should_receive(:[]).with(opt[:getter]).and_return(getter)
      end

      it 'call getter' do
        expect(subject).to eq 'piyo'
      end
    end

    context 'when no match' do
      # opt = {}
      # project = 'fuga'
      #
      # subject{NyaoBundle.get(project, opt)}
      #
      # before do
      #   # Proc#call のモックができない
      #   Proc.any_instance.should_receive(:call).with(project, opt).and_return(nil)
      # end
      #
      # it do
      #   expect{subject}.to raise_error NyaoBundle::Matcher::DontMatch
      # end
      it
    end
  end
end
