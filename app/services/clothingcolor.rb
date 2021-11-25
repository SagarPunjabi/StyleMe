class ClothingColor
    def initialize(image_url)
        api_key  = ENV['IMAGGA_KEY'] 
        api_secret = ENV['IMAGGA_SECRET']
        auth = 'Basic ' + Base64.strict_encode64( "#{api_key}:#{api_secret}" ).chomp
        response = RestClient.get "https://api.imagga.com/v2/colors?image_url=#{image_url}", { :Authorization => auth }
        json_response = JSON.parse(response)
        @result = json_response["result"]["colors"]["foreground_colors"][0]["closest_palette_color_html_code"]

    end

    def get_clothing_color()
        @result
    end
end