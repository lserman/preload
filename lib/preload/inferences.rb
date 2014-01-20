class Inferences

  def initialize(name, params)
    @name = name.to_s
    @params = params
  end

  def model
    getter.classify.constantize
  end

  def getter
    if singular?
      @name
    else
      @name.pluralize
    end
  end

  def action
    @params[:action].inquiry
  end

  def singular?
    action.new? || action.create? || @params.include?(:id)
  end

end