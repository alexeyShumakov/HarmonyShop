class Admin::SizeHelpersController < Admin::AdminController
  layout 'admin'
  before_action :set_admin_size_helper, only: [:show, :edit, :update, :destroy]

  # GET /admin/size_helpers
  # GET /admin/size_helpers.json
  def index
    @admin_size_helpers = SizeHelper.all
  end

  # GET /admin/size_helpers/1
  # GET /admin/size_helpers/1.json
  def show
  end

  # GET /admin/size_helpers/new
  def new
    @admin_size_helper = SizeHelper.new
  end

  # GET /admin/size_helpers/1/edit
  def edit
  end

  # POST /admin/size_helpers
  # POST /admin/size_helpers.json
  def create
    @admin_size_helper = SizeHelper.new(admin_size_helper_params)

    respond_to do |format|
      if @admin_size_helper.save
        format.html { redirect_to admin_size_helper_path(@admin_size_helper), notice: 'Size helper was successfully created.' }
        format.json { render :show, status: :created, location: @admin_size_helper }
      else
        format.html { render :new }
        format.json { render json: @admin_size_helper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/size_helpers/1
  # PATCH/PUT /admin/size_helpers/1.json
  def update
    respond_to do |format|
      if @admin_size_helper.update(admin_size_helper_params)
        format.html { redirect_to admin_size_helper_path(@admin_size_helper), notice: 'Size helper was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_size_helper }
      else
        format.html { render :edit }
        format.json { render json: @admin_size_helper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/size_helpers/1
  # DELETE /admin/size_helpers/1.json
  def destroy
    @admin_size_helper.destroy
    respond_to do |format|
      format.html { redirect_to admin_size_helpers_url, notice: 'Size helper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_size_helper
      @admin_size_helper = SizeHelper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_size_helper_params
      params.require(:size_helper).permit(:title, :body)
    end
end
