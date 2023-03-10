class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show update destroy ]

  # GET /images
  def index
    @images = Image.all

    render json: @images
  end

  # GET /images/1
  def show
    render json: @image
  end

  # POST /images
    def create
      image = params[:image]
      filename = image.original_filename
  
      # Salvar a imagem usando o Active Storage
      blob = ActiveStorage::Blob.create_after_upload!(
        io: image,
        filename: filename
      )
      image = blob.create_variant(resize: "800x800").processed
  
      render json: { url: url_for(image) }
    end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:name)
    end
end
