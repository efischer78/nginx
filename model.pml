owner "nginx" user()
nginxHome "/usr/local/nginx"

logDir "/var/log/nginx" directory(owner: "{{ product.owner }}", persistent: "NGINX_LOG_DIR", command: "deploy")

sbinPath "/usr/local/sbin/nginx"
confPath "/etc/nginx/nginx.conf"
errorLogPath "{{ product.logDir }}/error.log"
httpLogPath "{{ product.logDir }}/access.log"
pidPath "/run/nginx.pid"
lockPath "/run/lock/subsys/nginx"

worker_processes 1
http {
    port 80 exposed("NGINX_HTTP_PORT") exported()
    proxy ""
}

startCommand "{{ product.sbinPath }} -c '{{ product.confPath }}'" start()
stopCommand "{{ product.sbinPath }} -c '{{ product.confPath }}' -s stop" stop()

modules {
    file_aio true
    ipv6  true
    http_ssl_module  true
    http_realip_module  true
    http_addition_module  true
    http_xslt_module  true
    http_image_filter_module  true
    http_geoip_module  true
    http_sub_module  true
    http_dav_module  true
    http_flv_module  true
    http_mp4_module  true
    http_gunzip_module  true
    http_gzip_static_module  true
    http_random_index_module  true
    http_secure_link_module  true
    http_degradation_module  true
    http_stub_status_module  true
    http_perl_module  true
    mail  true
    mail_ssl_module  true
    pcre  true
    google_perftools_module  true
    debug  true
}

