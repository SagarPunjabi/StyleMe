class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  protect_from_forgery except: :generate_again
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find params[:id]
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        reset_session #-- 8:56
        log_in @user #-- 8:56
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def generate_again
    if params[:quad] == 'Top' && params[:category] != %w[Fall/Spring-Jacket Winter-Coat]
      @random_top = Clothe.where.not(id: params[:pastid]).where(user_id: params[:userid], quadrant: params[:quad],
                                                                clothing_category: params[:category]).sample
    elsif params[:quad] == 'Top'
      @random_top = Clothe.where.not(id: params[:pastid]).where(user_id: params[:userid], quadrant: params[:quad],
                                                                clothing_category: params[:category]).sample
    elsif params[:quad] == 'Bottom'
      @random_bottom = Clothe.where.not(id: params[:pastid]).where(user_id: params[:userid], quadrant: params[:quad],
                                                                   clothing_category: params[:category]).sample
    elsif params[:quad] == 'Socks'
      @random_socks = Clothe.where.not(id: params[:pastid]).where(user_id: params[:userid], quadrant: params[:quad],
                                                                  clothing_category: params[:category]).sample
    elsif params[:quad] == 'Shoes'
      @random_shoes = Clothe.where.not(id: params[:pastid]).where(user_id: params[:userid], quadrant: params[:quad],
                                                                  clothing_category: params[:category]).sample
    end
    respond_to do |format|
      format.js {}
    end
  end

  def generate
    ip_address = if Rails.env.production?
                   request.remote_ip
                 else
                   Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
                 end
    location = Geocoder.search(ip_address)[0].data['loc']
    lat = location.split(',').first
    lon = location.split(',').last
    key = ENV['API_KEY']
    require 'net/http'
    require 'json'
    @url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,daily&units=imperial&APPID=#{key}"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
    @clothes = Clothe.all
    if @output['current']['temp'] >= 70
      @random_top = Clothe.where(user_id: params[:user_id], quadrant: 'Top',
                                 clothing_category: %w[T-Shirt Button-down Dress]).sample
      # @random_top = @user_tops.sample()
      @random_bottom = Clothe.where(user_id: params[:user_id], quadrant: 'Bottom',
                                    clothing_category: %w[Shorts Skirt]).sample
      @random_shoes = Clothe.where(user_id: params[:user_id], quadrant: 'Shoes',
                                   clothing_category: %w[Sneakers Dress-Shoes Sandals]).sample
    else
      @random_top = Clothe.where(user_id: params[:user_id], quadrant: 'Top',
                                 clothing_category: %w[Hoodie Longsleeve T-Shirt Button-down Dress]).sample
      # @random_top = @user_tops.sample()
      @random_bottom = Clothe.where(user_id: params[:user_id], quadrant: 'Bottom',
                                    clothing_category: %w[Jeans Pants Leggings Sweatpants Skirt]).sample
      @random_shoes = Clothe.where(user_id: params[:user_id], quadrant: 'Shoes',
                                   clothing_category: %w[Sneakers Dress-Shoes]).sample
      if @output['current']['temp'] >= 40 && @output['current']['temp'] <= 60
        @random_top2 = Clothe.where(user_id: params[:user_id], quadrant: 'Top',
                                    clothing_category: %w[Fall/Spring-Jacket]).sample
      end
      if @output['current']['temp'] < 40
        @random_top2 = Clothe.where(user_id: params[:user_id], quadrant: 'Top',
                                    clothing_category: %w[Winter-Coat]).sample
        @random_shoes = Clothe.where(user_id: params[:user_id], quadrant: 'Shoes',
                                     clothing_category: %w[Sneakers Dress-Shoes Boots]).sample
      end
    end
    @random_socks = Clothe.where(user_id: params[:user_id], quadrant: 'Socks',
                                 clothing_category: %w[Socks]).sample
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :quadrant)
  end
end
