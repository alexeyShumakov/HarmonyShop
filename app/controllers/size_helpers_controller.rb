class SizeHelpersController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  after_action :verify_authorized, except: [:show]
  before_action :set_size_helper, only: [:show, :edit, :update, :destroy]

  # GET /size_helpers
  # GET /size_helpers.json
  def index
    @size_helpers = SizeHelper.all
    authorize SizeHelper
  end

  # GET /size_helpers/1
  # GET /size_helpers/1.json
  def show
    # TODO testing
    respond_to do |format|
      format.js
      if user_signed_in?
        format.html {authorize @size_helper}
      else
        format.html {authenticate_user!}
      end
    end
  end

  # GET /size_helpers/new
  def new
    @size_helper = SizeHelper.new
    authorize @size_helper
  end

  # GET /size_helpers/1/edit
  def edit
    authorize @size_helper
  end

  # POST /size_helpers
  # POST /size_helpers.json
  def create
    @size_helper = SizeHelper.new(size_helper_params)

    authorize @size_helper
    respond_to do |format|
      if @size_helper.save
        format.html { redirect_to @size_helper, notice: 'Size helper was successfully created.' }
        format.json { render :show, status: :created, location: @size_helper }
      else
        format.html { render :new }
        format.json { render json: @size_helper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /size_helpers/1
  # PATCH/PUT /size_helpers/1.json
  def update
    authorize @size_helper

    respond_to do |format|
      if @size_helper.update(size_helper_params)
        format.html { redirect_to @size_helper, notice: 'Size helper was successfully updated.' }
        format.json { render :show, status: :ok, location: @size_helper }
      else
        format.html { render :edit }
        format.json { render json: @size_helper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /size_helpers/1
  # DELETE /size_helpers/1.json
  def destroy
    authorize @size_helper

    @size_helper.destroy
    respond_to do |format|
      format.html { redirect_to size_helpers_url, notice: 'Size helper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_size_helper
      @size_helper = SizeHelper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def size_helper_params
      params.require(:size_helper).permit(:title, :body)
    end
end
