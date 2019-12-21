


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setenv "PATH" (concat (getenv "PATH") ":/home/peterbecich/node/bin"))
(setq exec-path (append exec-path '("/home/peterbecich/node/bin")))

(setenv "PATH" (concat (getenv "PATH") ":/home/peterbecich/.npm-global/bin"))
(setq exec-path (append exec-path '("/home/peterbecich/.npm-global/bin")))

(setenv "PATH" (concat (getenv "PATH") ":/home/peterbecich/.cabal/bin"))
(setq exec-path (append exec-path '("/home/peterbecich/.cabal/bin")))

(setenv "PATH" (concat "/home/peterbecich/.local/bin:" (getenv "PATH")))
(setq exec-path (append '("/home/peterbecich/.local/bin") exec-path ))

(setenv "PATH" (concat "/opt/ghc/bin:" (getenv "PATH")))
(setq exec-path (append '("/opt/ghc/bin") exec-path ))

(setenv "GOPATH" "/home/peterbecich/go")
(setenv "SPARK_HOME" "/home/peterbecich/bin/spark")

(setenv "PATH" (concat "/home/peterbecich/bin/spark/bin/:" (getenv "PATH")))
(setq exec-path (append '("/home/peterbecich/bin/spark/bin/") exec-path ))

(setenv "PATH" (concat "/opt/cabal/bin/:" (getenv "PATH")))
(setq exec-path (append '("/opt/cabal/bin/") exec-path ))

(setenv "PATH" (concat "/opt/ghc/bin/:" (getenv "PATH")))
(setq exec-path (append '("/opt/ghc/bin/") exec-path ))


(setenv "PATH" (concat (getenv "PATH")     (concat ":" (concat (getenv "GOPATH") "/bin"))))
(setq exec-path (append exec-path '((concat (getenv "GOPATH") "/bin"))))


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

(setq helm-top-command
   "env COLUMNS=%s ps --sort=-pcpu -axo pid,user,pri,nice,ucomm,tty,start_time,vsz,%%cpu,%%mem,etime")


;; (setq jdee-server-dir "/home/peterbecich/java/jars")


(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)
;; (set-frame-font "Helvetica 12" nil t)
;; (set-frame-font "Liberation Mono-14:antialias=1")
