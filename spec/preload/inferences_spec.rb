describe 'making inferences about the resource before it is loaded' do

  let(:controller) { double('controller', params: params) }
  let(:inferences)   { Inferences.new(:test, controller) }

  class Test; end

  context 'singular resource' do
    let(:params) do
      { id: 1 }
    end

    it 'infers the resource is singular' do
      expect(inferences.singular?).to be(true)
    end

    it 'infers the model to be Test' do
      expect(inferences.model).to be(Test)
    end

    it 'infers the instance variable (getter) will be "test"' do
      expect(inferences.getter).to match('test')
    end
  end

  context 'collection resource' do
    let(:params) { Hash.new }

    it 'infers the resource is plural' do
      expect(inferences.singular?).to be(false)
    end

    it 'infers the model to be Test' do
      expect(inferences.model).to be(Test)
    end

    it 'infers the instance variable (getter) will be "tests"' do
      expect(inferences.getter).to match('tests')
    end
  end
end

