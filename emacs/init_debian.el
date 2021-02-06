;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(eval-when-compile
  (require 'use-package))

(load "~/dotfiles/emacs/init_private_debian.el")

(add-hook 'after-init-hook 'global-company-mode)

;;https://www.emacswiki.org/emacs/CompanyMode#toc6
;; (global-set-key (kbd "C-;") 'company-complete)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(put 'erase-buffer 'disabled nil)

(setq-default line-spacing 0)

;; (setq helm-top-command
;;    "env COLUMNS=%s ps --sort=-pcpu -axo pid,user,pri,nice,ucomm,tty,start_time,vsz,%%cpu,%%mem,etime")


;; (setq jdee-server-dir "/home/peterbecich/java/jars")


(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)
;; (set-frame-font "Helvetica 12" nil t)
;; (set-frame-font "Liberation Mono-14:antialias=1")

(set-face-attribute 'default nil :height 140)
