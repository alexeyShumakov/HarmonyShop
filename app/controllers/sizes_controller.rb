class SizesController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized
  before_action :set_size, only: [:show, :edit, :update, :destroy]

  # GET /sizes
  # GET /sizes.json
  def index
    @sizes = Size.all
    authorize Size
  end

  # GET /sizes/1
  # GET /sizes/1.json
  def show
    authorize @size
  end

  # GET /sizes/new
  def new
    @size = Size.new
    authorize @size
  end

  # GET /sizes/1/edit
  def edit
    authorize @size
  end

  # POST /sizes
  # POST /sizes.json
  def create

    @size = Size.new(size_params)
    authorize @size

    respond_to do |format|
      if @size.save
        format.html { redirect_to @size, notice: 'Size was successfully created.' }
        format.json { render :show, status: :created, location: @size }
      else
        format.html { render :new }
        format.json { render json: @size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sizes/1
  # PATCH/PUT /sizes/1.json
  def update
    authorize @size

    respond_to do |format|
      if @size.update(size_params)
        format.html { redirect_to @size, notice: 'Size was successfully updated.' }
        format.json { render :show, status: :ok, location: @size }
      else
        format.html { render :edit }
        format.json { render json: @size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sizes/1
  # DELETE /sizes/1.json
  def destroy
    authorize @size

    @size.destroy
    respond_to do |format|
      format.html { redirect_to sizes_url, notice: 'Size was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_size
      @size = Size.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def size_params
      params.require(:size).permit(:name, :code)
    end
end
