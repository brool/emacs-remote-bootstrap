;; example init.el

(use-package ivy
  :config
  (use-package counsel)
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-extra-directories nil)
  (setq counsel-find-file-ignore-regexp
        (concat
         ;; File names beginning with # or .
         "\\(?:\\`[#.]\\)"
         ;; File names ending with # or ~
         "\\|\\(?:\\`.+?[#~]\\'\\)"))
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (define-key ivy-minibuffer-map "\C-d" #'ivy-done)
  )

(eval-after-load 'web-mode
  '(progn
     (require 'web-mode)
     (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
     (add-to-list 'auto-mode-alist '("\\.template\\.php\\'" . web-mode))
     (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))))

(global-font-lock-mode t)
(setq font-lock-verbose nil)
(setq byte-compile-verbose nil)
(setq backup-inhibited t)
(show-paren-mode 1)

;; ===== from http://www.emacswiki.org/emacs/BackupDirectory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory))
      tramp-backup-directory-alist backup-directory-alist
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)
;; ===== 

;; ===== from http://mumble.net/~campbell/emacs/init.el
(transient-mark-mode 1)
;; =====

;; ===== from http://mumble.net/~campbell/emacs/init.el
;; get rid of stuff that wastes pixels
(if (featurep 'tool-bar)
    (tool-bar-mode -1))
(if (featurep 'scroll-bar)
    (scroll-bar-mode -1))
(if (featurep 'tooltip)
    (tooltip-mode -1))
;; =====

;; Typing should delete the region
;; ===== from http://cl-cookbook.sourceforge.net/.emacs
(delete-selection-mode 1)
;; =====

;; Column & line numbers in mode bar
(column-number-mode t)
(line-number-mode t)	

;; ===== from http://www.moxleystratton.com/article/dot-emacs
;; Don't make me type out 'yes' and 'no'
(fset 'yes-or-no-p 'y-or-n-p)
;; =====

;; Set the name of the host and current path/file in title bar:
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; display time and date
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

;; ugh, 8 space tabs are horrible
(setq tab-width 4)

;; disable these, they are annoying
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; turn off that annoying ediff window
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; I hate the "are you sure you want to kill the process buffer" that was added
(setq kill-buffer-query-functions 
      (remove 'process-kill-buffer-query-function 
              kill-buffer-query-functions)) 

(load-theme 'zenburn 'no-confirm)
