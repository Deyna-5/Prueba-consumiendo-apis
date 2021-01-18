require_relative 'request'
require_relative 'components'

nasa_photos = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=","rCUeYH9Xv6uJv07xRkM2Mze6kQTSTpSj7gErfIuW")
photos = nasa_photos["photos"]

File.write('index.html', build_web_page(photos))

def photos_count(photos)
	camera1 = "Front Hazard Avoidance Camera"
		sum1 = 0
	camera2 = "Rear Hazard Avoidance Camera"
		sum2 = 0
	camera3 = "Mast Camera"
		sum3 = 0
	camera4 = "Chemistry and Camera Complex"
		sum4 = 0
	camera5 = "Navigation Camera"
		sum5 = 0

	photos.each do |photo|
		if photo["camera"]["full_name"] == camera1
			sum1 += 1
		elsif photo["camera"]["full_name"] == camera2
			sum2 += 1
		elsif photo["camera"]["full_name"] == camera3
			sum3 += 1
		elsif photo["camera"]["full_name"] == camera4
			sum4 += 1
		elsif photo["camera"]["full_name"] == camera5
			sum5 += 1
		end
	end
	hash = {camera1 => "#{sum1}", camera2 => "#{sum2}", camera3 => "#{sum3}", camera4 => "#{sum4}", camera5 => "#{sum5}"}
	return hash
end

print photos_count(photos)