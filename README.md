This project is about printing Jira tickets in your own formatted way. PHP 5.3 and XSL are required on your server.

In case you're on mac and dont have docker yet, install docker and boot2docker for mac and then:
```
boot2docker init
boot2docker start
$(boot2docker shellinit)
```

```
docker build -t cards .
docker run -it --rm -p 80:80 --name cards-app cards
```

```
boot2docker ip # --> copy IP address
```

Visit http://<copiedIP>/ on your browser.