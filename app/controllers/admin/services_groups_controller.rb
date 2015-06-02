class Admin::ServicesGroupsController < ApplicationController
  layout 'admin'
  before_action :set_admin_services_group, only: [:show, :edit, :update, :destroy]

  # GET /admin/services_groups
  # GET /admin/services_groups.json
  def index
    @admin_services_groups = ServicesGroup.all
  end

  # GET /admin/services_groups/1
  # GET /admin/services_groups/1.json
  def show
  end

  # GET /admin/services_groups/new
  def new
    @admin_services_group = ServicesGroup.new
  end

  # GET /admin/services_groups/1/edit
  def edit
  end

  # POST /admin/services_groups
  # POST /admin/services_groups.json
  def create
    @admin_services_group = ServicesGroup.new(admin_services_group_params)

    respond_to do |format|
      if @admin_services_group.save
        format.html { redirect_to admin_services_group_path(@admin_services_group), notice: 'Services group was successfully created.' }
        format.json { render :show, status: :created, location: @admin_services_group }
      else
        format.html { render :new }
        format.json { render json: @admin_services_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/services_groups/1
  # PATCH/PUT /admin/services_groups/1.json
  def update
    respond_to do |format|
      if @admin_services_group.update(admin_services_group_params)
        format.html { redirect_to admin_services_group_path(@admin_services_group), notice: 'Services group was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_services_group }
      else
        format.html { render :edit }
        format.json { render json: @admin_services_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/services_groups/1
  # DELETE /admin/services_groups/1.json
  def destroy
    @admin_services_group.destroy
    respond_to do |format|
      format.html { redirect_to admin_services_groups_url, notice: 'Services group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_services_group
      @admin_services_group = ServicesGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_services_group_params
      params.require(:services_group).permit(:title, :name)
    end
end
