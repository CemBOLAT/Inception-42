all:
	# Add cbolat.42.fr to /etc/hosts
	@if ! grep -q 'cbolat\.42\.fr' /etc/hosts; then \
        sudo sed -i '1s/^/127.0.0.1\tcbolat.42.fr\n/' /etc/hosts; \
    fi
	@mkdir -p /home/cbolat/data/wordpress
	@mkdir -p /home/cbolat/data/mariadb
	@mkdir -p /home/cbolat/data/redis
	@docker-compose -f srcs/docker-compose.yml up --build

start:
	@docker-compose -f srcs/docker-compose.yml start

stop:
	@docker-compose -f srcs/docker-compose.yml stop

clean:
	@docker-compose -f srcs/docker-compose.yml down --volumes

fclean: clean
	@docker system prune -af
	@sudo sed -i '/127.0.0.1\tcbolat\.42\.fr/d' /etc/hosts
	@rm -rf /home/cbolat/data

re : fclean all

.PHONY: all start stop clean fclean re
