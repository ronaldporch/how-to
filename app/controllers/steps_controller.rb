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
      redirect_to howto_path(@howto), notice: "What Are You Doing?!"
    end
  end

  def edit
    @step = Step.find_by(howto_id: params[:howto_id], id: params[:id])
    @howto = Howto.find_by(id: params[:howto_id])
  end

  def update
    @howto = Howto.find_by(id: params[:howto_id])
    @step = Step.find_by(howto_id: params[:howto_id], id: params[:id])
    if @step.update(step_params)
      redirect_to howto_step_path(@howto, @step)
    else
      redirect_to edit_howto_step_path(@step), notice: "What Are You Doing?!"
    end
  end

  def destroy
    @step = Step.find_by(howto_id: params[:howto_id], id: params[:id]).destroy
    @howto = Howto.find_by(id: params[:howto_id])
    redirect_to howto_path(@howto)
  end

  private
  def step_params
    params.require(:step).permit(:name, :content)
  end
end
