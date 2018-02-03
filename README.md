# Bootstrap Emacs from a remote

You're working on a coworker's / friend's computer, and they have only an uninitialized Emacs...  none of the keys are right.

Or, worse, they have set up their Emacs and customized it, but they didn't have the good sense to copy your configuration, so everything is strange and insane, with bindings only Cthulhu could love.

You could git clone your Emacs configuration, but that seems kind of weird, and you'd be polluting his or her package space.

Fortunately, it's easy to set up a bootstrap configuration that you can bring up anywhere into the current running copy of Emacs, using the very neat [Try package](https://github.com/larstvei/Try) available in Emacs. 

## Bringing Up Your Configuration

Possibly, start `emacs -Q` to go completely clean, and then go to the scratch window and evaluate:

```
(with-temp-buffer (url-insert-file-contents "https://raw.githubusercontent.com/brool/emacs-remote-bootstrap/master/bootstrap.el") (eval-buffer))
```

(or, go to bootstrap.el and copy/paste the first commented line into a scratch buffer and evaluate)

Wait a bit for everything to load up, and then you're done!

