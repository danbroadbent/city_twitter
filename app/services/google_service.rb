class GoogleService
  def self.convert_to_coords(location)
    conn = Faraday.new(:url => 'https://maps.googleapis.com') do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get do |req|                           # GET http://sushi.com/search?page=2&limit=100
      req.url '/maps/api/geocode/json', :address => location
      req.params['key'] = ENV['google_location_api']
    end

    latitude = JSON.parse(response.body)['results'][0]['geometry']['location']['lat']
    longitude = JSON.parse(response.body)['results'][0]['geometry']['location']['lng']

    coords = "#{latitude},#{longitude}"
    # https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=ENV['google_location_api']
  end
end
