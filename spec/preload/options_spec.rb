describe 'options passed into #preload' do

  class TestsController
    include Preload
    def controller_name; 'tests' end
    def self.helper_method(method); nil; end
  end

  let(:controller) { TestsController.new }

  before do
    expect(controller).to receive(:params) { params }
    expect_any_instance_of(Loader).to receive(:resolve) { :test }
  end

  context 'singular resource' do
    let(:params) { { id: 1 } }

    specify ':then => :method' do
      expect(controller).to receive(:test!).with(:test)
      controller.preload then: :test!
      expect(controller.instance_variable_get("@test")).to be(:test)
    end

    specify ':aliases => []' do
      controller.preload aliases: [:plugin, :resource]
      expect(controller.instance_variable_get("@test")).to be(:test)
      expect(controller.plugin).to be(:test)
      expect(controller.resource).to be(:test)
    end

  end

  context 'collection resource' do

  end

end