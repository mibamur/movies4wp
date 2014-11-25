require 'csv'
<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]

#  add_breadcrumb I18n.t(:<%= singular_table_name %>s), :<%= singular_table_name %>s_path
#  add_breadcrumb I18n.t(:new), '', :only => [:new, :create]
#  add_breadcrumb I18n.t(:edit), '', :only => [:edit, :update]

  # GET <%= route_url %>
  def index
    # if we have plan to use paginate
    # @<%= plural_table_name %> = <%= class_name %>.paginate :page => params[:page], :order => 'id DESC'
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    respond_with(@<%= plural_table_name %>, :location=><%= plural_table_name %>_path )
  end

  # GET <%= route_url %>/1
  def show
#    @<%= singular_table_name %> = <%= class_name %>.find(params[:id])
#    add_breadcrumb @<%= singular_table_name %>.name, ''
    respond_with(@<%= plural_table_name %>, :location=><%= plural_table_name %>_path )
  end

  # GET <%= route_url %>/new
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    respond_with(@<%= singular_table_name %>, :location=><%= plural_table_name %>_path )
 end

  # GET <%= route_url %>/1/edit
  def edit
#    add_breadcrumb @<%= singular_table_name %>.name, ''
  end

  # POST <%= route_url %>
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>
    <%= "flash[:notice] = '#{class_name} was successfully created.' if " if flash? %>@<%= orm_instance.save %>
    respond_with(@<%= singular_table_name %>, :location=><%= plural_table_name %>_path )
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    <%= "flash[:notice] = '#{class_name} was successfully updated.' if " if flash? %>@<%= orm_instance_update(attributes_params) %>
    respond_with(@<%= singular_table_name %>, :location=><%= plural_table_name %>_path )
  end

  # DELETE <%= route_url %>/1
  def destroy
    @<%= orm_instance.destroy %>
    respond_with(@<%= singular_table_name %>, :location=><%= plural_table_name %>_path )
  end

  def import
    <%= class_name %>.import(params[:file])
    redirect_to <%= singular_table_name %>s_path, notice: "Импорт прошёл."
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    end

    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params[<%= ":#{singular_table_name}" %>]
      <%- else -%>
      params.require(<%= ":#{singular_table_name}" %>).permit( <%= attributes_names.map { |name| ":#{name}" }.join(', ') %>, :_import, :_update, :_create, :_destroy)#cocoon_marker_start
      <%- end -%>
    end
end
<% end -%>
