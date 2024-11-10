The flake has a `defaultPackage` attribute, so you can `nix shell` to put the packages it defines on your path.

This can happen if you don't declare a `defaultPackage` in the flake:

```
$ nix shell
error: flake 'git+file:///home/dsyer/dev/scratch/flakes-demo' does not provide attribute 'packages.x86_64-linux.default' or 'defaultPackage.x86_64-linux'
```

You can still use the flake to set up a shell with `nix develop`:

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