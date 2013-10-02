Practica 2

Por: Sebastian Ospina Berrio

Objetivo: Convierta el programa de ejemplo usado en la sección Ejemplo en Ruby: 
Accediendo a Twitter en una aplicación Rack que muestre en su página los últimos twitts 
de una lista de usuarios obtenidos desde un formulario (puede modificar/diseñar la interfaz 
como crea conveniente).

NOTA IMPORTANTE:

Debe crear el fichero "configure.rb" en donde introducira las credenciales de Twitter

Twitter.configure do |config|
  config.consumer_key       = "YOUR_CONSUMER_KEY"
  config.consumer_secret    = "YOUR_CONSUMER_SECRET"
  config.oauth_token        = "YOUR_ACCESS_TOKEN"
  config.oauth_token_secret = "YOUR_ACCESS_SECRET"
end

