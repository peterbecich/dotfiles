;;(setq use-package-always-ensure t)

(let ((private-mac-file
       (expand-file-name "init_private_mac.el"
                         (file-name-directory (or load-file-name buffer-file-name)))))
  (load private-mac-file 'noerror 'nomessage))


;; (set-face-background hl-line-face "#dbdbdb"); Same color as greyness in gtk


;; (let ((gls "/opt/local/bin/gls"))
;;   (if (file-exists-p gls) (setq insert-directory-program gls)))
;; (put 'erase-buffer 'disabled nil)

(set-face-attribute 'default nil :height 160)

(setq markdown-command "pandoc")

;; (setq jdee-server-dir "/Users/peter/java/jars")

(setq magit-git-executable "/opt/local/bin/git")


;; (set-face-attribute 'default nil :height 210 :font "Andale Mono")

(set-face-attribute 'default nil :font "Menlo" :height 180 :weight 'normal)

 ;; (set-face-attribute 'default nil
 ;;                :family "Inconsolata" :height 180 :weight 'normal)
;; (setq ns-antialiased-text nil)
