run:
	docker run -d -p 10000:10000 --name test dns2utf8/frontg8_server

dockerImage:
	docker build -t dns2utf8/frontg8_server:latest .
