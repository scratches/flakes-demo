This is expected:

```
$ nix shell
error: flake 'git+file:///home/dsyer/dev/scratch/flakes-demo' does not provide attribute 'packages.x86_64-linux.default' or 'defaultPackage.x86_64-linux'
```

It means there is no default package in the flake.  You can still use the flake to set up a shell:

```
$ nix develop
$ hello | cowsay
 _______________ 
< Hello, world! >
 --------------- 
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```