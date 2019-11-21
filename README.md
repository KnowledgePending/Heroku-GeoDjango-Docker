<img src="./images/django.png" width="100%">

# Heroku-GeoDjango-Docker
🐳🌎GeoDjango Docker for Heroku Deployments

## Deploying a GeoDjango Application to Heroku
* Create a Heroku application through the Website or CLI like down below 
* Run the command below
    * Use the app name and add it to allowed hosts \<your-heroku-app-name\>.herokuapp.com
```BASH
heroku create
```
* Add your django project/app name to the the docker file and build it at the location of your project/app
```BASH
docker build -t registry.heroku.com/<your-heroku-app-name>/web .
```

* Push your docker build to heroku
```BASH
docker push registry.heroku.com/<your-heroku-app-name>/web
```

* Release the container
```BASH
heroku container:release -a <your-heroku-app-name> web
```
