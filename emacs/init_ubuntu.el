
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


;; (load "server")
;; (unless (server-running-p) (server-start))

;;(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


(require 'pdf-tools)
(pdf-tools-install)


(set-face-background hl-line-face "#303030"); 

(put 'erase-buffer 'disabled nil)


(load "~/dotfiles/emacs/init_shared.el")
