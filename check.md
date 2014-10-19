Checks
======

In order to have a working stack, ensure these items :
* Vagrant is installed, in your PATH and >= 1.6.5 :
```
$ vagrant -v
1.6.5
```
* VirtualBox is installed, in your PATH and == 4.3.12 :
```
$ VBoxManage -v
4.3.12....
```
* If you're under an HTTP proxy :
 * Vagrant plugin's *vagrant-proxyconf* is installed and >= 1.4.0
```
$ vagrant plugin list
...
vagrant-proxyconf (1.4.0)
...
```
 * Your system environment variables points to the proxy :
```
> echo %HTTP_PROXY% #(Windows)
> echo %HTTPS_PROXY% #(Windows)
> echo %NO_PROXY% #(Windows)
$ echo $http_proxy #(Linux)
$ echo $https_proxy #(Linux)
$ echo $no_proxy #(Linux)
```
 * Same thing with vagrant-proxyconf's configuration :
```
> echo %VAGRANT_HHTTP_PROXY%
> echo %VAGRANT_NO_PROXY%
```