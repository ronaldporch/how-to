class StepsController < ApplicationController
  def show
    @step = Step.find_by(howto_id: params[:howto_id], id: params[:id])
  end

  def create
    @howto = Howto.find(params[:howto_id])
    @step = @howto.steps.build(step_params)
    if @step.save
      redirect_to howto_path(@howto)
    else
      redirect_to howto_path(@howto)
    end
  end

  private
  def step_params
    params.require(:step).permit(:name, :content)
  end
end
