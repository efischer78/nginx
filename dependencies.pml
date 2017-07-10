def version = "1.13.0"
dependency("http://nginx.org/download/nginx-${version}.tar.gz") {
    to "/usr/src"
    unpack true
    inline "./configure --user=www-data --group=www-data --with-http_ssl_module --with-http_realip_module --prefix={{ product.nginxHome }}"
    inline "make"
    inline "make install"
    workingDir "/usr/src/nginx-${version}"
    id "nginx"
}
