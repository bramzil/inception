all		: up

up		:
	mkdir -p /home/bramzil/data/wordpress
	mkdir -p /home/bramzil/data/DB
	mkdir -p /home/bramzil/data/prometheus
	docker compose -f ./srcs/docker-compose.yml up -d

fclean          : down
	docker compose -f ./srcs/docker-compose.yml down -v
	rm -rf /home/bramzil/data/wordpress
	rm -rf /home/bramzil/data/DB
	rm -rf /home/bramzil/data/prometheus

re              : fclean all

down		:
	docker compose -f ./srcs/docker-compose.yml down

stop		:
	docker compose -f ./srcs/docker-compose.yml stop

start		:
	docker compose -f ./srcs/docker-compose.yml start

status 		:
	docker ps
