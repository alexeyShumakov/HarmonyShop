class Admin::SizesController < Admin::AdminController
  layout 'admin'
  before_action :set_admin_size, only: [:show, :edit, :update, :destroy]

  # GET /admin/sizes
  # GET /admin/sizes.json
  def index
    @admin_sizes = Size.all
  end

  # GET /admin/sizes/1
  # GET /admin/sizes/1.json
  def show
  end

  # GET /admin/sizes/new
  def new
    @admin_size = Size.new
  end

  # GET /admin/sizes/1/edit
  def edit
  end

  # POST /admin/sizes
  # POST /admin/sizes.json
  def create
    @admin_size = Size.new(admin_size_params)

    respond_to do |format|
      if @admin_size.save
        format.html { redirect_to admin_sizes_path, notice: 'Size was successfully created.' }
        format.json { render :show, status: :created, location: @admin_size }
      else
        format.html { render :new }
        format.json { render json: @admin_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/sizes/1
  # PATCH/PUT /admin/sizes/1.json
  def update
    respond_to do |format|
      if @admin_size.update(admin_size_params)
        format.html { redirect_to admin_sizes_path, notice: 'Size was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_size }
      else
        format.html { render :edit }
        format.json { render json: @admin_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/sizes/1
  # DELETE /admin/sizes/1.json
  def destroy
    @admin_size.destroy
    respond_to do |format|
      format.html { redirect_to admin_sizes_url, notice: 'Size was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_size
      @admin_size = Size.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_size_params
      params.require(:size).permit(:name, :code)
    end
end
