class KittensController < ApplicationController
  before_action :set_kitten, only: [ :show, :edit, :update, :destroy ]

  def index
    @kittens = Kitten.all
  end

  def show
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "We've got a new kitten!"
      redirect_to @kitten
    else
      flash.now[:alert] = "Hold up, that's not quite right so we didn't save the kitten."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @kitten.update(kitten_params)
      flash[:notice] = "Kitten updated successfully!"
      redirect_to @kitten
    else
      flash.now[:alert] = "Hold up, that's not quite right so we didn't update the kitten."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @kitten.destroy
      redirect_to kittens_path, status: :see_other, notice: "Bye bye, kitten! Gone forever."
    else
      redirect_to @kitten, alert: "We couldn't delete the kitten."
    end
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
