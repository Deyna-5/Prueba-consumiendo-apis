def build_web_page(photos)
	'
	<!doctype html>
	<html lang="en">
  	<head>
	    <meta name="author" content="Deyna Contreras">
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    	<title>Prueba: Consumiendo API NASA</title>
  	</head>
  	<body class="container" style="background: black; background-image: url(https://fondosmil.com/fondo/10790.jpg);">
	    '+titulo()+'
	    '+cards(photos)+'
	    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
  	</body>
	</html>
	'
end

def titulo()
	'<h1 class="text-center text-white" style="font-size: 60px;">Fotos Mars  Rover</h1>'
end

def cards(photos)
	cards = ''

	photos.each_slice(2) do |photos_gropup|
		cards += "<div class='card-deck my-5'>\n"
		photos_gropup.each do |photo|
		cards += "\t\t"+'<div class="card text-white bg-secondary mb-3" style="width: 18rem;">
		  	<img src="' +photo["img_src"]+ '" class="card-img-top" alt="...">
		  	<div class="card-body">
		    	<p class="card-text h5 text-center">Nombre de la camara: ' +photo["camera"]["full_name"]+ '</p>
		    	<p class="card-text h5 text-center">Fecha de la fotografía: ' +photo["earth_date"]+ '</p>
		    	<p class="card-text h5 text-center">Status: ' +photo["rover"]["status"]+ '</p>
		  	</div>
		</div>' + "\n"
		end
		cards += "</div>\n"
	end
	return cards
end