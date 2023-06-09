class BandsController < ApplicationController
  before_action :set_band, only: %i[ show edit update destroy ]

  # GET /bands
  def index
    @bands = Band.all
  end

  # GET /bands/1
  def show
  end

  # GET /bands/new
  def new
    @band = Band.new
  end

  # GET /bands/1/edit
  def edit
  end

  # POST /bands
  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to @band, notice: "Band was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bands/1
  def update
    if @band.update(band_params)
      redirect_to @band, notice: "Band was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /bands/1
  def destroy
    @band.destroy
    redirect_to bands_url, notice: "Band was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band
      @band = Band.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def band_params
      params.require(:band).permit(:name)
    end
end
