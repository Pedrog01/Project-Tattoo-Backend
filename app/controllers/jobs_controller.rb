class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: %i[ show update destroy ]

  # GET /jobs
  def index
    @jobs = Job.all

    render json: @jobs
  end

  # GET /jobs/1
  def show
    render json: @job
  end

  # POST /jobs
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
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:price, :description, :user_id)
    end
end
