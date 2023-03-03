class ProfileusersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profileuser, only: %i[ show update destroy ]

  # GET /profileusers
  def index
    @profileusers = Profileuser.all

    render json: @profileusers
  end

  # GET /profileusers/1
  def show
    render json: @profileuser
  end

  # POST /profileusers
  def create
    @profileuser = Profileuser.new(profileuser_params)

    if @profileuser.save
      render json: @profileuser, status: :created, location: @profileuser
    else
      render json: @profileuser.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profileusers/1
  def update
    if @profileuser.update(profileuser_params)
      render json: @profileuser
    else
      render json: @profileuser.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profileusers/1
  def destroy
    @profileuser.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profileuser
      @profileuser = Profileuser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profileuser_params
      params.require(:profileuser).permit(:firstname, :lastname, :phone, :birthdate, :avatar, :user_id)
    end
end
