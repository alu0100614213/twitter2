require 'twitter'
require './configure'
require 'thin'
require 'rack'

class Mostrar_Twitt

  def call env
    req = Rack::Request.new(env)
    res = Rack::Response.new 
    res['Content-Type'] = 'text/html'
    #Obtiene el nombre del usuario
    user_name = (req["user"] && req["user"] != '') ? req["user"] :''
    #Obtiene los tweets del usuario 
    user_tweets = (!user_name.empty? && tweets_number.zero) ? user_reg?(user_name) : ''
    #Formulario
    res.write <<-"EOS"
    <!DOCTYPE HTML>
    <html>
 	<body>
          	<h1>Twitter</h1>
          	<form action="/" method="post">
            		Nombre de usuario: <input type="text" name="user" autofocus>
            		<br>
           		<input type="submit" value="Ok">
          	</form>
	  	<br>
	        <h3>Twitt</h3>
        	Usuario: #{user_name}
		<br>
	        Ultimo tweet: #{user_tweets}
	</body>
    </html>
    EOS
    res.finish
  end
  #Comprueba que el usuario esta registrado en Twitter
  def user_reg?(user)
    begin
    	Twitter.user_timeline(user).first.text
    	rescue
      	"El nombre de Usuario Introducido no tiene cuenta en Twitter"
    end
  end
end

Rack::Server.start(
  :app => Mostrar_Twitt.new,
  :Port => 9292,
  :server => 'thin'
)
