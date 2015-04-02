class AdditionalDescriptionsController < ApplicationController
  before_action :set_additional_description, only: [:show, :edit, :update, :destroy]
  before_action :set_product, only: [:new, :edit, :create]

  # GET /additional_descriptions
  # GET /additional_descriptions.json
  def index
    @additional_descriptions = AdditionalDescription.all
  end

  # GET /additional_descriptions/1
  # GET /additional_descriptions/1.json
  def show
  end

  # GET /additional_descriptions/new
  def new
    @additional_description = @product.additional_descriptions.build
  end

  # GET /additional_descriptions/1/edit
  def edit
  end

  # POST /additional_descriptions
  # POST /additional_descriptions.json
  def create
    @additional_description = @product.additional_descriptions.build(additional_description_params)

    respond_to do |format|
      if @additional_description.save
        format.html { redirect_to products_path, notice: 'Additional description was successfully created.' }
        format.json { render :show, status: :created, location: @additional_description }
      else
        format.html { render :new }
        format.json { render json: @additional_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /additional_descriptions/1
  # PATCH/PUT /additional_descriptions/1.json
  def update
    respond_to do |format|
      if @additional_description.update(additional_description_params)
        format.html { redirect_to products_path, notice: 'Additional description was successfully updated.' }
        format.json { render :show, status: :ok, location: @additional_description }
      else
        format.html { render :edit }
        format.json { render json: @additional_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /additional_descriptions/1
  # DELETE /additional_descriptions/1.json
  def destroy
    @additional_description.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Additional description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_additional_description
      @additional_description = AdditionalDescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def additional_description_params
      params.require(:additional_description).permit(:name, :description)
    end
end
