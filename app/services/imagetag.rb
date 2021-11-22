
class ImageTag

    def initialize(image_url)
        puts "Creating new image tag"
        api_key = 'acc_6c3b78f522083d4'
        api_secret = '6568d9e3cbf1b8711671100c072c039f'
        auth = 'Basic ' + Base64.strict_encode64( "#{api_key}:#{api_secret}" ).chomp
        
        @quadrants = ["top","bottom","socks","shoes","accessory"]
        
        @categories = ["T-Shirt","Shirt","Hoodie","Longsleeve","Button-down","Winter-Coat","Fall/Spring-Jacket","Dress","Jeans","Pants","Shorts","Skirt","Leggings","Sweatpants","Sneakers","Dress Shoes","Sandals","Boots","Socks"]
        @categories.map!(&:downcase)
        
        @occasion = ["Casual","Business-Casual"]
        @occasion.map!(&:downcase)
        
        @image_url = image_url
        # response = RestClient.post "https://api.imagga.com/v2/tags", { :image => File.new(image_url, 'rb') }, { :Authorization => auth }
        response = RestClient.get "https://api.imagga.com/v2/tags?image_url=#{image_url}", { :Authorization => auth }
        json_response = JSON.parse(response)
        @results = json_response["result"]["tags"]
        @results.map! {|element| [ element["tag"]["en"], element["confidence"] ] }
        @results = @results.to_h
    end

    def get_tag(array)
        tag = nil
        array.each { |item|
            if @results.has_key?(item)
                if tag.nil?
                    tag = item
                elsif @results[tag] < @results[item]
                    tag = item
                end
            end
        }
        return tag
    end
    def get_tags()
        quad = get_tag(@quadrants)
        category = get_tag(@categories)
        oc = get_tag(@occasion) 
        # send pito the data 
        return quad, category, oc
    end
end