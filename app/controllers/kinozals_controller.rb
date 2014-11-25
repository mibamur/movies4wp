class KinozalsController < ApplicationController
  before_action :set_kinozal, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @kinozals = Kinozal.all
    respond_with(@kinozals)
  end

  def show
    respond_with(@kinozal)
  end

  def new
    @kinozal = Kinozal.new
    respond_with(@kinozal)
  end

  def edit
  end

  def create
    @kinozal = Kinozal.new(kinozal_params)
    @kinozal.save
    respond_with(@kinozal)
  end

  def update
    @kinozal.update(kinozal_params)
    respond_with(@kinozal)
  end

  def destroy
    @kinozal.destroy
    respond_with(@kinozal)
  end

  private
    def set_kinozal
      @kinozal = Kinozal.find(params[:id])
    end

    def kinozal_params
      params.require(:kinozal).permit(:name, :kinodom_id)
    end
end
