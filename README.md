This project is about printing Jira tickets in your own formatted way. PHP 5.3 and XSL are required on your server.

In case you're on Mac and don't have docker yet, install Docker and boot2docker for ac OS X and then:
```
boot2docker init
boot2docker start
$(boot2docker shellinit)
```

Build it:
```
docker build -t cards .
docker run -it --rm -p 80:80 --name cards-app cards
```

Open the app in your browser:
```
$ open http://`boot2docker ip`/
```
