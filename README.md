# ft_server
42Cursus
	
	  	   
	Commands You will need : 
	if you are working on Docker using a VirtalBox :
	1- Docker-machine start "nameofthevirtualmachine"
	2- Docker-machine env "nameofthevirtualmachine"
	3- eval $(docker-machine env "nameofthevirtualmachine")

	After that Run the following Commands inside the workspace :
	1- Docker build -t test .
	2- Docker run -it -p 80:80 -p 443:443 test
	All what u have to do is open Your web browser and tap localhost.. U welcome to my Wordpress website 
	if you are working on docker Using VirtualBox dont forget to port Forwarding your machine "443:443" and "80:80" 
	@
