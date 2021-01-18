require_relative 'request'
require_relative 'components'

nasa_photos = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=","rCUeYH9Xv6uJv07xRkM2Mze6kQTSTpSj7gErfIuW")
photos = nasa_photos["photos"]

File.write('index.html', build_web_page(photos))
