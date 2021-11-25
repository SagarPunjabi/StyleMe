class Weather
  def initialize(user_id)
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
    @userid = user_id
  end

  def get_top
    if @output['current']['temp'] >= 70
      Clothe.where(user_id: @userid, quadrant: 'Top',
                   clothing_category: %w[T-Shirt Button-down Dress]).sample
    else
      Clothe.where(user_id: @userid, quadrant: 'Top',
                   clothing_category: %w[Hoodie Longsleeve T-Shirt Button-down Dress]).sample
    end
  end

  def get_top2
    if @output['current']['temp'] >= 40 && @output['current']['temp'] <= 60
      Clothe.where(user_id: @userid, quadrant: 'Top',
                   clothing_category: %w[Fall/Spring-Jacket]).sample

    elsif @output['current']['temp'] < 40
      Clothe.where(user_id: @userid, quadrant: 'Top',
                   clothing_category: %w[Winter-Coat]).sample
    end
  end

  def get_bottom
    if @output['current']['temp'] >= 70
      Clothe.where(user_id: @userid, quadrant: 'Bottom',
                   clothing_category: %w[Shorts Skirt]).sample
    else
      Clothe.where(user_id: @userid, quadrant: 'Bottom',
                   clothing_category: %w[Jeans Pants Leggings Sweatpants Skirt]).sample
    end
  end

  def get_shoes
    if @output['current']['temp'] >= 70
      Clothe.where(user_id: @userid, quadrant: 'Shoes',
                   clothing_category: %w[Sneakers Dress-Shoes Sandals]).sample
    elsif @output['current']['temp'] < 70 && @output['current']['temp'] >= 40
      Clothe.where(user_id: @userid, quadrant: 'Top',
                   clothing_category: %w[Hoodie Longsleeve T-Shirt Button-down Dress]).sample
    else
      Clothe.where(user_id: @userid, quadrant: 'Shoes',
                   clothing_category: %w[Sneakers Dress-Shoes Boots]).sample
    end
  end

  def get_socks
    Clothe.where(user_id: @userid, quadrant: 'Socks',
                 clothing_category: %w[Socks]).sample
  end
  def get_output
    @output
  end
end
