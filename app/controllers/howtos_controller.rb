class HowtosController < ApplicationController
  def index
    @howtos = Howto.all.order(created_at: :desc)
    @howto = Howto.new
  end

  def create
    @howto = Howto.new(howto_params)
    if @howto.save
      redirect_to howtos_path
    else
      render :index
    end
  end

  def show
    @howto = Howto.find(params[:id])
    @steps = Step.where(howto_id: @howto)
    @step = @howto.steps.build
  end

  private
  def howto_params
    params.require(:howto).permit(:content)
  end
end
