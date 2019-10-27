# docker-fpm

Use it from the [Docker Hub](http://hub.docker.com/r/devopsfaith/fpm).
_UPDATES-2019_ http://hub.docker.com/r/cpasternack/fpm-updates

## Deb packages

Uses Ubuntu Bionic

```
docker build -t fpm-updates:bionic deb
```

Uses Ubuntu Xenial

```
docker build -t fpm-updates:xenial deb
```

## RPM packages

Uses CentOS 8

```
docker build -t fpm-updates:centos8 rpm
```

Uses CentOS 7

```
docker build -t fpm-updates:centos7 rpm
```

## Custom Linux distributions

For another deb-flavored distro, change the `FROM` in the `deb/Dockerfile`.

For another rpm-flavored distro, change the `FROM` in the `rpm/Dockerfile`.
