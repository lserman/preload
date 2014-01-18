describe 'options passed into #preload' do

  class TestsController
    include Preload
    def controller_name; 'tests' end
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
  end

end