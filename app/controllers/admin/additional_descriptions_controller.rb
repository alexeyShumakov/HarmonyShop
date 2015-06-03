class Admin::AdditionalDescriptionsController < Admin::AdminController
  layout 'admin'
  before_action :set_admin_additional_description, only: [:show, :edit, :update, :destroy]
  before_action :set_product, only: [:new, :create, :index]

  # GET /admin/additional_descriptions
  # GET /admin/additional_descriptions.json
  def index
    @admin_additional_descriptions = AdditionalDescription.all
  end

  # GET /admin/additional_descriptions/1
  # GET /admin/additional_descriptions/1.json
  def show
  end

  # GET /admin/additional_descriptions/new
  def new
    @admin_additional_description = AdditionalDescription.new
  end

  # GET /admin/additional_descriptions/1/edit
  def edit
  end

  # POST /admin/additional_descriptions
  # POST /admin/additional_descriptions.json
  def create
    @admin_additional_description = @product.additional_descriptions.build(admin_additional_description_params)

    respond_to do |format|
      if @admin_additional_description.save
        format.html { redirect_to admin_products_path, notice: 'Additional description was successfully created.' }
        format.json { render :show, status: :created, location: @admin_additional_description }
      else
        format.html { render :new }
        format.json { render json: @admin_additional_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/additional_descriptions/1
  # PATCH/PUT /admin/additional_descriptions/1.json
  def update
    respond_to do |format|
      if @admin_additional_description.update(admin_additional_description_params)
        format.html { redirect_to admin_products_path, notice: 'Additional description was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_additional_description }
      else
        format.html { render :edit }
        format.json { render json: @admin_additional_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/additional_descriptions/1
  # DELETE /admin/additional_descriptions/1.json
  def destroy
    @admin_additional_description.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_path, notice: 'Additional description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
		def set_product
			@product = Product.find(params[:product_id])
		end
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_additional_description
      @admin_additional_description = AdditionalDescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_additional_description_params
      params.require(:additional_description).permit(:name, :description)
    end
end
