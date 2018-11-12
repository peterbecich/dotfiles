
(setenv "PATH" (concat "/Users/peterbecich/.cabal/bin:" (getenv "PATH")))
(setq exec-path (append '("/Users/peterbecich/.cabal/bin") exec-path))

(setenv "PATH" (concat "/opt/local/bin:" (getenv "PATH")))
(setq exec-path (append '("/opt/local/bin") exec-path))


(setenv "PATH" (concat "/Users/peterbecich/.local/bin:" (getenv "PATH")))
(setq exec-path (append '("/Users/peterbecich/.local/bin") exec-path ))

(setenv "PATH" (concat "/opt/local/lib/postgresql96/bin:" (getenv "PATH")))
(setq exec-path (append '("/opt/local/lib/postgresql96/bin") exec-path ))

(setenv "PATH" (concat "/Users/peterbecich/bin:" (getenv "PATH")))
(setq exec-path (append '("/Users/peterbecich/bin") exec-path ))


(setenv "PATH" (concat "/Applications/Firefox Developer Edition.app/Contents/MacOS:" (getenv "PATH")))
(setq exec-path (append '("/Applications/Firefox Developer Edition.app/Contents/MacOS") exec-path ))


(setenv "PATH" (concat "/opt/local/libexec/gnubin/:" (getenv "PATH")))
(setq exec-path (append '("/opt/local/libexec/gnubin") exec-path ))

(setq use-package-always-ensure t)


(setenv "WORKON_HOME" "/Users/peterbecich/.virtualenv/")


;; ;; (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
;; (setq exec-path (append exec-path '("/usr/local/bin")))

;; ;; (setenv "PATH" (concat (getenv "PATH") ":/opt/local/bin"))
;; (setq exec-path (append exec-path '("/opt/local/bin")))

;; ;; (setenv "PATH" (concat (getenv "PATH") ":/Users/peterbecich/.local/bin/"))
;; (setq exec-path (append exec-path '("/Users/peterbecich/.local/bin/")))

;; ;; (setenv "PATH" (concat (getenv "PATH") ":/Users/peterbecich/.npm-global/bin/"))
;; (setq exec-path (append exec-path '("/Users/peterbecich/.npm-global/bin/")))


(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


(load "~/dotfiles/emacs/init_private_mac.el")


;; (set-face-background hl-line-face "#dbdbdb"); Same color as greyness in gtk


(let ((gls "/opt/local/bin/gls"))
  (if (file-exists-p gls) (setq insert-directory-program gls)))
(put 'erase-buffer 'disabled nil)

(set-face-attribute 'default nil :height 135)

(setq markdown-command "/opt/local/bin/pandoc")

(setq jdee-server-dir "/Users/peter/java/jars")
