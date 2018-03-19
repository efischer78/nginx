pkg {
	names "build-essential zlib1g-dev libpcre3-dev libssl-dev libxslt1-dev libxml2-dev libgd2-xpm-dev libgeoip-dev libgoogle-perftools-dev libperl-dev"
	os "ubuntu"
}
pkg {
	names "gcc-c++ pcre-devel zlib-devel make wget openssl-devel libxml2-devel libxslt-devel gd-devel perl-ExtUtils-Embed GeoIP-devel gperftools-devel"
	os "centos"
}
def version = "1.13.0"
url("http://nginx.org/download/nginx-${version}.tar.gz") {
    to "/usr/src"
    unpack true
    inline "./configure --prefix=${ product.nginxHome } --sbin-path=${ product.sbinPath } --conf-path=${ product.confPath } --error-log-path=${ product.errorLogPath } --http-log-path=${ product.httpLogPath } --pid-path=${ product.pidPath } --lock-path=${ product.lockPath } --user=${ product.owner } --group=${ product.owner } ${ product.modules.file_aio ? "--with-file-aio" : ""} ${ product.modules.ipv6 ? "--with-ipv6" : ""} ${ product.modules.http_ssl_module ? "--with-http_ssl_module" : ""} ${ product.modules.http_realip_module ? "--with-http_realip_module" : ""} ${ product.modules.http_addition_module ? "--with-http_addition_module" : ""} ${ product.modules.http_xslt_module ? "--with-http_xslt_module" : ""}  ${ product.modules.http_image_filter_module ? "--with-http_image_filter_module" : ""}  ${ product.modules.http_sub_module ? "--with-http_sub_module" : ""} ${ product.modules.http_flv_module ? "--with-http_flv_module" : ""}  ${ product.modules.http_mp4_module ? "--with-http_mp4_module" : ""}  ${ product.modules.http_gunzip_module ? "--with-http_gunzip_module" : ""}  ${ product.modules.http_gzip_static_module ? "--with-http_gzip_static_module" : ""}  ${ product.modules.http_secure_link_module ? "--with-http_secure_link_module" : ""}  ${ product.modules.http_degradation_module ? "--with-http_degradation_module" : ""}  ${ product.modules.http_stub_status_module ? "--with-http_stub_status_module" : ""}  ${ product.modules.http_perl_module ? "--with-http_perl_module" : ""}  ${ product.modules.mail ? "--with-mail" : ""}  ${ product.modules.mail_ssl_module ? "--with-mail_ssl_module" : ""}  ${ product.modules.pcre ? "--with-pcre" : ""}  ${ product.modules.google_perftools_module ? "--with-google_perftools_module" : ""}  ${ product.modules.debug ? "--with-debug" : ""}"
    inline "make"
    inline "make install"
    workingDir "/usr/src/nginx-${version}"
}
