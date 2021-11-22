class ClothingColor
    def initialize(image_url)
        api_key = 'acc_6c3b78f522083d4'
        api_secret = '6568d9e3cbf1b8711671100c072c039f'
        auth = 'Basic ' + Base64.strict_encode64( "#{api_key}:#{api_secret}" ).chomp
        response = RestClient.get "https://api.imagga.com/v2/colors?image_url=#{image_url}", { :Authorization => auth }
        json_response = JSON.parse(response)
        @result = json_response["result"]["colors"]["foreground_colors"][0]["closest_palette_color_html_code"]

    end

    def get_clothing_color()
        @result
    end
end