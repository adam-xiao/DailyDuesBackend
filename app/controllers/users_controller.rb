class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    render json: User.all
  end

  # GET /users/1
  # def show
  #   render json: user
  # end

  def selfMedia
    myMedia = Medium.all.filter{|media| media.user_id == decoded_token}
    # ItinActiv = Activity.all.filter{ |activity| activity.itinerary_id == myItin.id }
    render json: myMedia
  end

  # POST /users
  def create
    user = User.new(user_params)

    if user.save
      token = encode_token(user.id)
      render json: {user: user, token: token}, status: :created, location: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
