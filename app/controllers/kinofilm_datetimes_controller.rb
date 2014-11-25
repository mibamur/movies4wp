class KinofilmDatetimesController < ApplicationController
  before_action :set_kinofilm_datetime, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @kinofilm_datetimes = KinofilmDatetime.all
    respond_with(@kinofilm_datetimes)
  end

  def show
    respond_with(@kinofilm_datetime)
  end

  def new
    @kinofilm_datetime = KinofilmDatetime.new
    respond_with(@kinofilm_datetime)
  end

  def edit
  end

  def create
    @kinofilm_datetime = KinofilmDatetime.new(kinofilm_datetime_params)
    @kinofilm_datetime.save
    respond_with(@kinofilm_datetime)
  end

  def update
    @kinofilm_datetime.update(kinofilm_datetime_params)
    respond_with(@kinofilm_datetime)
  end

  def destroy
    @kinofilm_datetime.destroy
    respond_with(@kinofilm_datetime)
  end

  private
    def set_kinofilm_datetime
      @kinofilm_datetime = KinofilmDatetime.find(params[:id])
    end

    def kinofilm_datetime_params
      params.require(:kinofilm_datetime).permit(:seans_date, :seans_time, :kinozal_id, :kinofilm_id)
    end
end
