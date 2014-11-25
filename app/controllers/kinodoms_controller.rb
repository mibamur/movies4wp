require 'csv'
class KinodomsController < ApplicationController
  before_action :set_kinodom, only: [:show, :edit, :update, :destroy]

#  add_breadcrumb I18n.t(:kinodoms), :kinodoms_path
#  add_breadcrumb I18n.t(:new), '', :only => [:new, :create]
#  add_breadcrumb I18n.t(:edit), '', :only => [:edit, :update]

  # GET /kinodoms
  def index
    # if we have plan to use paginate
    # @kinodoms = Kinodom.paginate :page => params[:page], :order => 'id DESC'
    @kinodoms = Kinodom.all
    @kinodom = Kinodom.new
    respond_with(@kinodoms, :location=>kinodoms_path )
  end

  # GET /kinodoms/1
  def show
#    @kinodom = Kinodom.find(params[:id])
#    add_breadcrumb @kinodom.name, ''
    respond_with(@kinodoms, :location=>kinodoms_path )
  end

  # GET /kinodoms/new
  def new
    @kinodom = Kinodom.new
    respond_with(@kinodom, :location=>kinodoms_path )
 end

  # GET /kinodoms/1/edit
  def edit
#    add_breadcrumb @kinodom.name, ''
  end

  # POST /kinodoms
  def create
    @kinodom = Kinodom.new(kinodom_params)
    @kinodom.save
    respond_with(@kinodom, :location=>kinodoms_path )
  end

  # PATCH/PUT /kinodoms/1
  def update
    @kinodom.update(kinodom_params)
    respond_with(@kinodom, :location=>kinodoms_path )
  end

  # DELETE /kinodoms/1
  def destroy
    @kinodom.destroy
    respond_with(@kinodom, :location=>kinodoms_path )
  end

  def import
    Kinodom.import(params[:file])
    redirect_to kinodoms_path, notice: "Импорт прошёл."
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kinodom
      @kinodom = Kinodom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def kinodom_params
      params.require(:kinodom).permit( :name, :desc, :remote_server, :local_server, :login, :pass, :db, :_import, :_update, :_create, :_destroy)#cocoon_marker_start
    end
end
