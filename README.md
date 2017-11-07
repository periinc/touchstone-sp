# Dockerized Springboot SAML 2.0 Service Provider

In order for a Service Provider to talk to an IDP, couple of configuration parameters have to be in place.

1. SP needs to be accessible via HTTPS
2. Service Provider needs to be registered with MIT Shib IDP


# SSO (Sinle-Sign-On)

The application talks to MIT Shib IDP and receives a "__eduPersonPrincipalName__" as a unique logged in user that can be returned to the calling application. 
A sample response can be found under [idp-response.xml](../idp-response.xml). 


# Application accessible via HTTPS
1. Obtain a CA issued certificate from MIT or generate a self-signed SSL cert. 
2. Create a keystore file with atleast one private key entry
       
        keytool -genkey -alias selfsigned_localhost_sslserver -keyalg RSA -keysize 2048 -validity 700 -keypass changeit -storepass changeit -keystore ssl-server.jks
3. Import the certficate into the keystore.
    
        keytool -importcert -alias mit-cert -file libthing_mit_edu.cer -keystore ssl-server.jks
       
4. List to view the keystore contents

        keytool -list -keystore ssl-server.jks
        
5. Update application.properties with SSL parameters


# SP Keystore (Required to communicate with IDP)
1. Generate the keystore file as above
2. Import the public certificate used for SP


#Docker Commands

1. Build docker image (From the root directory)
       
       "docker build -t 'name-of-the-image' ." (Ex. docker build -t touchstone-sp .)
       
2. Running the image
    
       "docker run --name 'name-of-the-container' -port 80:8443 -v /Users/peris/touchstone-sp:/touchstone-sp -d 'name-of-the-image'" (Ex. docker run --name touchstone-sp -port 80:8443 -d touchstone-sp)
             
#Docker cheat sheet

1. List images

       docker images
       
       
2. List running containers

       docker ps -a
       
3. Checking logs of a particular container

        docker logs -f 'conatiner-name' (Ex. docker logs -f touchstone-sp)
      
      
4. Stopping a container 

        docker stop 'container-name'
      
5. Removing a container
   
        docker rm -f 'container-name'
      
6. Removing an image
    
        docker rmi -f 'image-name'
       
        
    
    