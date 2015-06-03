class Admin::BgImagesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_action { authorize BgImage }
  before_action :rest_bg_image, only: [:set_current, :create]
  before_action :set_admin_bg_image, only: [:show, :edit, :update, :destroy, :set_current]

  # GET /admin/bg_images
  # GET /admin/bg_images.json
  def index
    @admin_bg_images = BgImage.all
  end

  # GET /admin/bg_images/1
  # GET /admin/bg_images/1.json
  def show
  end

  # GET /admin/bg_images/new
  def new
    @admin_bg_image = BgImage.new
  end

  def set_current
    @admin_bg_image.current = true
    @admin_bg_image.save
    respond_to do |format|
      format.html { redirect_to admin_bg_images_url, notice: 'Bg image was successfully add current.' }
      format.json { head :no_content }
    end
  end

  # GET /admin/bg_images/1/edit
  def edit
  end

  # POST /admin/bg_images
  # POST /admin/bg_images.json
  def create
    @admin_bg_image = BgImage.new(admin_bg_image_params)

    respond_to do |format|
      if @admin_bg_image.save
        format.html { redirect_to admin_bg_image_path(@admin_bg_image), notice: 'Bg image was successfully created.' }
        format.json { render :show, status: :created, location: @admin_bg_image }
      else
        format.html { render :new }
        format.json { render json: @admin_bg_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/bg_images/1
  # PATCH/PUT /admin/bg_images/1.json
  def update
    respond_to do |format|
      if @admin_bg_image.update(admin_bg_image_params)
        format.html { redirect_to admin_bg_image_path(@admin_bg_image), notice: 'Bg image was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_bg_image }
      else
        format.html { render :edit }
        format.json { render json: @admin_bg_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/bg_images/1
  # DELETE /admin/bg_images/1.json
  def destroy
    @admin_bg_image.destroy
    respond_to do |format|
      format.html { redirect_to admin_bg_images_url, notice: 'Bg image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def rest_bg_image
      img = BgImage.find_by_current(true)
      if img
        img.current = false
        img.save
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_bg_image
      @admin_bg_image = BgImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_bg_image_params
      params.require(:bg_image).permit(:current, :image, :title)
    end
end
