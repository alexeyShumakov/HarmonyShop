class ServicesGroupsController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized
  before_action :set_services_group, only: [:show, :edit, :update, :destroy]

  # GET /services_groups
  # GET /services_groups.json
  def index
    @services_groups = ServicesGroup.all
    authorize ServicesGroup
  end

  # GET /services_groups/1
  # GET /services_groups/1.json
  def show
  end

  # GET /services_groups/new
  def new
    @services_group = ServicesGroup.new
    authorize @services_group
  end

  # GET /services_groups/1/edit
  def edit
  end

  # POST /services_groups
  # POST /services_groups.json
  def create
    @services_group = ServicesGroup.new(services_group_params)
    authorize @services_group

    respond_to do |format|
      if @services_group.save
        format.html { redirect_to @services_group, notice: 'Services group was successfully created.' }
        format.json { render :show, status: :created, location: @services_group }
      else
        format.html { render :new }
        format.json { render json: @services_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services_groups/1
  # PATCH/PUT /services_groups/1.json
  def update
    authorize @services_group

    respond_to do |format|
      if @services_group.update(services_group_params)
        format.html { redirect_to @services_group, notice: 'Services group was successfully updated.' }
        format.json { render :show, status: :ok, location: @services_group }
      else
        format.html { render :edit }
        format.json { render json: @services_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services_groups/1
  # DELETE /services_groups/1.json
  def destroy
    authorize @services_group

    @services_group.destroy
    respond_to do |format|
      format.html { redirect_to services_groups_url, notice: 'Services group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_services_group
      @services_group = ServicesGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def services_group_params
      params.require(:services_group).permit(:title, :name)
    end
end
