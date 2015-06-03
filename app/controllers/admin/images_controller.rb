class Admin::ImagesController < Admin::AdminController
  layout 'admin'
  before_action :set_admin_image, only: [:show, :edit, :update, :destroy]
  before_action :set_product_color, only: [ :show, :new, :edit, :create, :update]

  # GET /admin/images
  # GET /admin/images.json
  def index
    @admin_images = Image.all
  end

  # GET /admin/images/1
  # GET /admin/images/1.json
  def show
    @admin_image = @products_color.images.find(params[:id])
  end

  # GET /admin/images/new
  def new
    @admin_image = @products_color.images.build
  end

  # GET /admin/images/1/edit
  def edit
  end

  # POST /admin/images
  # POST /admin/images.json
  def create
    @admin_image = @products_color.images.build(admin_image_params)

    respond_to do |format|
      if @admin_image.save
        format.html { redirect_to admin_products_color_path(@products_color), notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @admin_image }
      else
        format.html { render :new }
        format.json { render json: @admin_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/images/1
  # PATCH/PUT /admin/images/1.json
  def update
    respond_to do |format|
      if @admin_image.update(admin_image_params)
        format.html { redirect_to admin_products_color_path(@products_color), notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_image }
      else
        format.html { render :edit }
        format.json { render json: @admin_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/images/1
  # DELETE /admin/images/1.json
  def destroy
    @admin_image.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_path, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

		def set_product_color
			@products_color = ProductsColor.find(params[:products_color_id])
    end

    def set_admin_image
      @admin_image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_image_params
      params.require(:image).permit(:name, :photo)
    end
end
