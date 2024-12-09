FROM nginx:latest

COPY nginxTemplates/default.conf.template /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
