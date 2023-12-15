.PHONY: start broker client receive send

start: broker client

broker:
	docker run -ti -p 15691:15691 -e RABBITMQ_DEFAULT_USER=guest -e RABBITMQ_DEFAULT_PASS=guest rabbitmq:3.12-alpine

client:
	docker run -ti -p 8080:15672 -p 5672:5672 -p 25676:25676 rabbitmq:3-management

receive:
	go run receive.go

send:
	go run send.go
