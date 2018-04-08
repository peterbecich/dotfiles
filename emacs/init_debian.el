


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

(setenv "GOPATH" "/home/peterbecich/go")
(setenv "SPARK_HOME" "/home/peterbecich/bin/spark")

(setenv "PATH" (concat "/home/peterbecich/bin/spark/bin/:" (getenv "PATH")))
(setq exec-path (append '("/home/peterbecich/bin/spark/bin/") exec-path ))


(setenv "PATH" (concat (getenv "PATH")     (concat ":" (concat (getenv "GOPATH") "/bin"))))
(setq exec-path (append exec-path '((concat (getenv "GOPATH") "/bin"))))


(eval-when-compile
  (require 'use-package))


(load "~/dotfiles/emacs/init_private_debian.el")

(add-hook 'after-init-hook 'global-company-mode)

;;https://www.emacswiki.org/emacs/CompanyMode#toc6
(global-set-key (kbd "C-;") 'company-complete)


(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(put 'erase-buffer 'disabled nil)

(setq-default line-spacing 0)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(default ((t (:inherit nil :stipple nil :background "#FFFFFF" :foreground "#333333" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 140 :width normal :foundry "nil" :family "Menlo"))))
 ;; '(mode-line ((t (:background "selectedKnobColor" :foreground "gray60" :inverse-video nil))))
 ;; '(mode-line-inactive ((t (:background "#d8d8d8" :foreground "gray60" :inverse-video nil))))
 '(shm-current-face ((t (:background "#c7fbea"))))
 '(shm-quarantine-face ((t (:background "#ffd8e1")))))

;; (put 'magit-clean 'disabled nil)
