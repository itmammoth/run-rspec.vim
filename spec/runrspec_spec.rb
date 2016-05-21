# This is a spec file for testing run-rspec.vim

RSpec.describe Array do
  describe '#new' do
    it 'returns a new array instance' do
      expect(Array.new).to be_a Array # pass
    end
  end

  describe '#push' do
    it 'appends the given object(s) on itself' do
      a = [0, 1]
      a.push 2
      expect(a).to eq [0, 1, 2] # pass
    end

    it 'returns itself' do
      expect([0, 1].push(2)).to eq [0, 1] # fail
    end
  end

  describe '#size' do
    it 'returns the number of elements in itself' do
      expect([0,1,2]).to eql 2  # fail
    end
  end

  describe '#shift' do
    pending 'not implemented'
  end
end
