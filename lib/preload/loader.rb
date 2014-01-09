class Loader

  attr_accessor :inferences, :controller

  def initialize(inferences, controller)
    @inferences = inferences
    @controller = controller
  end

  def resolve(&block)
    if inferences.singular?
      find(controller.params[:id], &block)
    else
      collection
    end
  end

  private

    def find(id, &block)
      if block
        yield
      else
        inferences.model.find(id)
      end
    end

    def collection
      inferences.model.all
    end

end