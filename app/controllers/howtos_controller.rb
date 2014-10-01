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
      redirect_to howtos_path, notice: "What Are You Doing?!"
    end
  end

  def edit
    @howto = Howto.find(params[:id])
  end

  def update
    @howto = Howto.find(params[:id])
    if @howto.update(howto_params)
      redirect_to howtos_path
    else
      redirect_to edit_howto_path(@howto), notice: "What Are You Doing?!"
    end
  end

  def show
    @howto = Howto.find(params[:id])
    @steps = @howto.steps.all
    @step = @howto.steps.build
  end

  def destroy
    @howto = Howto.find(params[:id]).destroy
    redirect_to howtos_path
  end

  private
  def howto_params
    params.require(:howto).permit(:content)
  end
end
