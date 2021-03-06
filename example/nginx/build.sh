#!/bin/bash
# coding: utf-8
# Copyright (c) 2017
# Gmail:liuzheng712
#

set -ex

source ./app.rc 

# Nginx
if [ ! -f ${NGINX_DIST} ]; then
  curl -LO ${NGINX_DOWNLOAD_LINK}
fi
tar xzf ${NGINX_DIST}

# OpenSSL
if [ ! -f ${OpenSSL_DIST} ]; then
  curl -LO ${OpenSSL_URL}
fi
tar xzf ${OpenSSL_DIST}

# PCRE
if [ ! -f ${PCRE_DIST} ]; then
  curl -LO ${PCRE_URL}
fi
tar xzf ${PCRE_DIST}

# zlib
if [ ! -f ${zlib_DIST} ]; then
  curl -LO ${zlib_URL}
fi
tar xzf ${zlib_DIST}

# redis2-nginx-module
if [ ! -f ${redis2_nginx_module_DIST} ]; then
  curl -LO ${redis2_nginx_module_URL}
fi
tar xzf ${redis2_nginx_module_DIST}

# ngx_devel_kit
if [ ! -f ${ngx_devel_kit_DIST} ]; then
  curl -LO ${ngx_devel_kit_URL}
fi
tar xzf ${ngx_devel_kit_DIST}

# lua_nginx_module
if [ ! -f ${lua_nginx_module_DIST} ]; then
  curl -LO ${lua_nginx_module_URL}
fi
tar xzf ${lua_nginx_module_DIST}

# LuaJIT
if [ ! -f ${LuaJIT_DIST} ]; then
  curl -LO ${LuaJIT_URL}
fi
tar xzf ${LuaJIT_DIST}

cd LuaJIT-${LuaJIT_VERSION}
sudo make install
cd -

cd ${NGINX_FOLDER}
goconfigure -c ../configure.yml

make -j8
