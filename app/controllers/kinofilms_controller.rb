require 'csv'
class KinofilmsController < ApplicationController
  before_action :set_kinofilm, only: [:show, :edit, :update, :destroy]

#  add_breadcrumb I18n.t(:kinofilms), :kinofilms_path
#  add_breadcrumb I18n.t(:new), '', :only => [:new, :create]
#  add_breadcrumb I18n.t(:edit), '', :only => [:edit, :update]

  # GET /kinofilms
  def index
    # if we have plan to use paginate
    # @kinofilms = Kinofilm.paginate :page => params[:page], :order => 'id DESC'
    @kinofilms = Kinofilm.all
    @kinofilm = Kinofilm.new
    respond_with(@kinofilms, :location=>kinofilms_path )
  end

  # GET /kinofilms/1
  def show
#    @kinofilm = Kinofilm.find(params[:id])
#    add_breadcrumb @kinofilm.name, ''
    respond_with(@kinofilms, :location=>kinofilms_path )
  end

  # GET /kinofilms/new
  def new
    @kinofilm = Kinofilm.new
    respond_with(@kinofilm, :location=>kinofilms_path )
 end

  # GET /kinofilms/1/edit
  def edit
#    add_breadcrumb @kinofilm.name, ''
  end

  # POST /kinofilms
  def create
    @kinofilm = Kinofilm.new(kinofilm_params)
    @kinofilm.save
    respond_with(@kinofilm, :location=>kinofilms_path )
  end

  # PATCH/PUT /kinofilms/1
  def update
    @kinofilm.update(kinofilm_params)
    respond_with(@kinofilm, :location=>kinofilms_path )
  end

  # DELETE /kinofilms/1
  def destroy
    @kinofilm.destroy
    respond_with(@kinofilm, :location=>kinofilms_path )
  end

  def getfilm
    @kinofilms=[]
    @client = TinyTds::Client.new(:username => 'sa', :password => '', :host => '192.168.201.17')
    #~ puts client.dead?    # => false
    #~ puts client.closed?  # => false
    #~ puts client.active?  # => true
    @result = @client.execute("SET NOCOUNT ON; SELECT a.FNAME, b.[FDATE], b.[FTIME], b.[FBASE_PRICE], b.[FDURATION] FROM [Harbin].[dbo].[FILM] a, [Harbin].[dbo].[REPERTOIR] b WHERE b.FFLM_NDX = a.FINDEX and b.FNOTACTIVE = 0;")
    @result.each do |row|
      ddate=Time.at(Chronic.parse("#{row['FDATE']} days from now", :hours24=>true, :now=> Chronic.parse('78122 days ago'))).getutc.strftime("%d.%m.%y").to_s
      # @kinofilms << row['FNAME']+" "+ddate+" "+Time.at(row['FTIME'].to_i/100).getutc.strftime("%H:%M").to_s+" "+row['FBASE_PRICE'].to_s+" "+row['FDURATION'].to_s
      @kinofilms << row['FNAME']
    end


    # @kinofilms.uniq.each do |k|
    #   @s = Kinopoisk::Search.new k
    #   @new_film = Kinofilm.new(:post_title=>@s.movies.first.title, :post_name=>k, :post_content=>@s.movies.first.description, :post_status=>false, :sticky=>false, :movies_length=>@s.movies.first.length, :poster=>@s.movies.first.poster, :poster_big=>@s.movies.first.poster_big, :kinopoisk_id=>@s.movies.first.id)
    #   # @s.movies.first.title_en
    #   # @s.movies.first.url
    #   # @s.movies.first.minimal_age
    #   # @s.movies.first.poster
    # end

    respond_with(@kinofilms, :location=>kinofilms_path )
  end

  def import
    Kinofilm.import(params[:file])
    redirect_to kinofilms_path, notice: "Импорт прошёл."
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kinofilm
      @kinofilm = Kinofilm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def kinofilm_params
      params.require(:kinofilm).permit( :post_title, :post_name, :post_content, :post_status, :sticky, :custom_fields, :movies_length, :event_imdb_url, :poster, :poster_big, :trailer, :kinopoisk_id, :main_price, :_import, :_update, :_create, :_destroy)#cocoon_marker_start
    end
end
