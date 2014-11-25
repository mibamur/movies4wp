class TheatersController < ApplicationController
  before_action :set_theater, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @theaters = Theater.all
    respond_with(@theaters, :location=>theaters_path)
  end

  def show
    respond_with(@theater, :location=>theaters_path)
  end

  def new
    @theater = Theater.new
    respond_with(@theater, :location=>theaters_path)
  end

  def edit
  end

  def create
    @theater = Theater.new(theater_params)
    @theater.save
    respond_with(@theater, :location=>theaters_path)
    # redirect_to theaters_path, :notice => "Кинотеатр создан"
  end

  def update
    @theater.update(theater_params)
    respond_with(@theater, :location=>theaters_path)
  end

  def destroy
    @theater.destroy
    respond_with(@theater, :location=>theaters_path)
  end

  private
    def set_theater
      @theater = Theater.find(params[:id])
    end

    def theater_params
      params.require(:theater).permit(:post_title, :post_name, :post_content, :post_status, :sticky, :custom_fields, :movies_length, :event_imdb_url, :poster, :poster_big, :kinopoisk_id, :main_price)
    end
end
