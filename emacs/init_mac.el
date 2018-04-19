
(setenv "PATH" (concat "/Users/peterbecich/.cabal/bin:" (getenv "PATH")))
(setq exec-path (append '("/Users/peterbecich/.cabal/bin") exec-path))

(setenv "PATH" (concat "/Users/peterbecich/.local/bin:" (getenv "PATH")))
(setq exec-path (append '("/Users/peterbecich/.local/bin") exec-path ))

(setenv "PATH" (concat "/opt/local/lib/postgresql96/bin:" (getenv "PATH")))
(setq exec-path (append '("/opt/local/lib/postgresql96/bin") exec-path ))

(setenv "PATH" (concat "/Applications/Firefox Developer Edition.app/Contents/MacOS:" (getenv "PATH")))
(setq exec-path (append '("/Applications/Firefox Developer Edition.app/Contents/MacOS") exec-path ))


(setenv "PATH" (concat "/opt/local/libexec/gnubin/:" (getenv "PATH")))
(setq exec-path (append '("/opt/local/libexec/gnubin") exec-path ))

(setq use-package-always-ensure t)


(setenv "WORKON_HOME" "/Users/peterbecich/.virtualenv/")


(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setenv "PATH" (concat (getenv "PATH") ":/opt/local/bin"))
(setq exec-path (append exec-path '("/opt/local/bin")))

(setenv "PATH" (concat (getenv "PATH") ":/Users/peterbecich/bin/spark-2.1.1-bin-hadoop2.7/bin"))
(setq exec-path (append exec-path '("/Users/peterbecich/bin/spark-2.1.1-bin-hadoop2.7/bin")))

(setenv "PATH" (concat (getenv "PATH") ":/Users/peterbecich/.local/bin/"))
(setq exec-path (append exec-path '("/Users/peterbecich/.local/bin/")))


(load "~/dotfiles/emacs/init_private_mac.el")


;; (set-face-background hl-line-face "#dbdbdb"); Same color as greyness in gtk


(let ((gls "/opt/local/bin/gls"))
  (if (file-exists-p gls) (setq insert-directory-program gls)))
(put 'erase-buffer 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(default ((t (:inherit nil :stipple nil :background "#FFFFFF" :foreground "#333333" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 140 :width normal :foundry "nil" :family "Menlo"))))
 ;; '(mode-line ((t (:background "selectedKnobColor" :foreground "gray60" :inverse-video nil))))
 ;; '(mode-line-inactive ((t (:background "#d8d8d8" :foreground "gray60" :inverse-video nil))))
 '(shm-current-face ((t (:background "#c7fbea"))))
 '(shm-quarantine-face ((t (:background "#ffd8e1"))))

 )

(set-face-attribute 'default nil :height 135)

(put 'magit-clean 'disabled nil)
