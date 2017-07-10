
nginxHome "/logiciels/nginx"

owner "nginx" systemPassword("tomcat")
worker_processes 1

http {
    port 80 exposed("NGINX_HTTP_PORT")
    proxy ""
}

domainName "mynginx"
domainBase "/appli/domains/{{ product.domainName }}" domainHome() directory() owner "{{ product.owner }}"
logDir "/var/{{ product.domainName }}/logs" directory() owner "{{ product.owner }}" persistent("NGINX_LOG_DIR") command "deploy"

startCommand "{{ product.nginxHome }}/sbin/nginx -c '{{ product.domainBase }}/conf/nginx.conf'" start()
stopCommand "{{ product.nginxHome }}/sbin/nginx -c '{{ product.domainBase }}/conf/nginx.conf' -s stop" stop()
