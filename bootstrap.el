;; (with-temp-buffer (url-insert-file-contents "https://raw.githubusercontent.com/brool/emacs-remote-bootstrap/master/bootstrap.el") (eval-buffer))

;; You may not need all these archives
(setq package-archives '(("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(defun load-file-remotely (url)
  (with-temp-buffer (url-insert-file-contents url) (eval-buffer)))

;; Bootstrap up the Try package
(defvar try-tmp-dir (make-temp-file "try" t))
(setq package-user-dir try-tmp-dir)
(setq package-alist nil)
(package-initialize)
(package-refresh-contents)
(if (version< emacs-version "25.1")
    (package-install 'try)
  (package-install 'try 'dont-select))

;; now install everything you need
(try 'use-package)
(try 'web-mode)
(try 'ivy)
(try 'counsel)
(try 'zenburn-theme)
(try 'ack)
(load-file-remotely "https://raw.githubusercontent.com/brool/emacs-remote-bootstrap/master/init.el")
