class Weather
  def initialize(ip_address, user_id, clothing_occassion)
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
    @userid = user_id
    @occasion = clothing_occassion
  end

  def get_top
    if @output['current']['temp'] >= 70
      Clothe.where(user_id: @userid, quadrant: 'Top',
                   clothing_category: %w[T-Shirt Button-down Dress],occasion: @occasion).sample
    else
      Clothe.where(user_id: @userid, quadrant: 'Top',
                   clothing_category: %w[Hoodie Longsleeve T-Shirt Button-down Dress],occasion: @occasion).sample
    end
  end

  def get_top2
    if @output['current']['temp'] >= 40 && @output['current']['temp'] <= 60
      Clothe.where(user_id: @userid, quadrant: 'Top',
                   clothing_category: %w[Fall/Spring-Jacket],occasion: @occasion).sample

    elsif @output['current']['temp'] < 40
      Clothe.where(user_id: @userid, quadrant: 'Top',
                   clothing_category: %w[Winter-Coat],occasion: @occasion).sample
    end
  end

  def get_bottom
    if @output['current']['temp'] >= 70
      Clothe.where(user_id: @userid, quadrant: 'Bottom',
                   clothing_category: %w[Shorts Skirt],occasion: @occasion).sample
    else
      Clothe.where(user_id: @userid, quadrant: 'Bottom',
                   clothing_category: %w[Jeans Pants Leggings Sweatpants Skirt],occasion: @occasion).sample
    end
  end

  def get_shoes
    if @output['current']['temp'] >= 70
      Clothe.where(user_id: @userid, quadrant: 'Shoes',
                   clothing_category: %w[Sneakers Dress-Shoes Sandals],occasion: @occasion).sample
    elsif @output['current']['temp'] < 70 && @output['current']['temp'] >= 40
      Clothe.where(user_id: @userid, quadrant: 'Shoes',
                   clothing_category: %w[Sneakers Dress-Shoes],occasion: @occasion).sample
    else
      Clothe.where(user_id: @userid, quadrant: 'Shoes',
                   clothing_category: %w[Sneakers Dress-Shoes Boots],occasion: @occasion).sample
    end
  end

  def get_socks
    Clothe.where(user_id: @userid, quadrant: 'Socks',
                 clothing_category: %w[Socks],occasion: @occasion).sample
  end

  def get_output
    @output
  end
end
