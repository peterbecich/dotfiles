(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))


(setq load-prefer-newer t)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

(setq use-package-always-ensure t)


;; https://stackoverflow.com/questions/1817257/how-to-determine-operating-system-in-elisp

(if (eq system-type 'darwin)
    (load "~/dotfiles/emacs/init_mac.el")
    )
(if (eq system-type 'gnu/linux)
    (load "~/dotfiles/emacs/init_debian.el")
    )


(load "~/dotfiles/emacs/init_private.el")

(load "~/dotfiles/emacs/custom_commands.el")
(load "~/dotfiles/emacs/auctex_related.el")
(load "~/dotfiles/emacs/package_list.el")


(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)

(use-package ag)
(use-package auctex-latexmk)
(use-package auto-compile)
(use-package auto-virtualenv)
(use-package browse-at-remote)
(use-package company-irony)
(use-package company-irony-c-headers)
(use-package company-rtags)
(use-package company-terraform)
(use-package docker)
(use-package docker-compose-mode)
(use-package dockerfile-mode)
(use-package elfeed)
(use-package elscreen)
(use-package emacsql)
(use-package emacsql-mysql)
(use-package emacsql-psql)
(use-package emacsql-sqlite)
(use-package emojify)
(use-package ensime)
(use-package ess)
(use-package flycheck-haskell)
(use-package flycheck-rtags)
(use-package ghc)
(use-package haskell-mode)
(use-package helm)
(use-package helm-ag)
(use-package helm-elscreen)
(use-package helm-ghc)
(use-package helm-hoogle)
(use-package helm-projectile)
(use-package hlint-refactor)
(use-package intero)
(use-package irony)
(use-package irony-eldoc)
(use-package jdee)
(use-package js2-mode)
(use-package js2-refactor)
(use-package magit)
(use-package markdown-mode)
(use-package multi-web-mode)
(use-package nlinum)
(use-package org)
(use-package paredit)
(use-package pdf-tools)
(use-package psc-ide)
(use-package puppet-mode)
(use-package purescript-mode)
(use-package rainbow-delimiters)
(use-package restclient)
(use-package rtags)
(use-package shakespeare-mode)
(use-package shm)
(use-package smart-mode-line)
(use-package smartparens)
(use-package sml-mode)
(use-package sx)
(use-package symon)
(use-package terraform-mode)
(use-package twittering-mode)
(use-package typescript-mode)
(use-package vue-html-mode)
(use-package vue-mode)
(use-package w3m)
(use-package websocket)
(use-package yaml-mode)
(use-package js-format)
(use-package hasky-stack)

;; (use-package flx-ido)
(use-package helm-flx)


;; (require 'flx-ido)
(ido-mode 0)
(ido-everywhere 0)
(flx-ido-mode 0)
;; ;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching 0)
;; (setq ido-use-faces nil)

(setq ido-use-filename-at-point 'guess)
(setq ido-ignore-extensions t)

(helm-flx-mode +1)
(setq helm-flx-for-helm-find-files t ;; t by default
      helm-flx-for-helm-locate t) ;; nil by default

;; (require 'symon)

;; (add-hook 'after-init-hook #'global-emojify-mode)

;; (use-package auto-virtualenv)
;; (use-package company-emacs-eclim)
;; (use-package eclim)
;; (use-package flycheck-rtags)

;;(use-package ess)

(require 'smartparens-config)
(elscreen-start)
(require 'helm-config)

(setq sml/no-confirm-load-theme t)
(sml/setup)
(setq sml/theme 'dark)

(add-hook 'after-init-hook 'global-company-mode)



(eval-when-compile
  (require 'use-package))




;; (setq themes '(zenburn sanityinc-solarized-light sanityinc-tomorrow-eighties sanityinc-tomorrow-day))
;; (setq themes-index 0)

;; (defun cycle-theme ()
;;   (interactive)
;;   (setq themes-index (% (1+ themes-index) (length themes)))
;;   (load-indexed-theme))

;; (defun load-indexed-theme ()
;;   (try-load-theme (nth themes-index themes)))

;; (defun try-load-theme (theme)
;;   (if (ignore-errors (load-theme theme :no-confirm))
;;       (mapcar #'disable-theme (remove theme custom-enabled-themes))
;;     (message "Unable to find theme file for ‘%s’" theme)))

(require 'tls)

(setq tramp-default-method "ssh")


(async-bytecomp-package-mode 1)

;;(newsticker-start)

;;(twit)


(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(setq request-backend 'url-retrieve)


(setq global-auto-revert-mode 1)

(desktop-save-mode 0)

(pdf-tools-install)

(setq dired-listing-switches "-alh")
(add-hook 'dired-mode-hook 'auto-revert-mode)

;;(global-flycheck-mode)

(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 1
	 auto-package-update-at-time "20:00")
   (auto-package-update-maybe))

(defadvice load-theme (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))

;; https://noahfrederick.com/log/restclient-for-emacs
;; (use-package restclient
;;   :mode ("\\.http\\'" . restclient-mode))

(setq dired-dwim-target t)

(setq emerge-diff-options "--ignore-all-space")

(setq column-number-mode t)


(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(global-set-key (kbd "C-c b")  'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c p")    'windmove-up)
(global-set-key (kbd "C-c n")  'windmove-down)

(global-visual-line-mode 1); Proper line wrapping
;; (global-hl-line-mode 0); Highlight current row
(show-paren-mode 1); Matches parentheses and such in every mode

;; (setq visible-bell t); Flashes on error

(add-to-list 'default-frame-alist '(height . 59)); Default frame height.

;; (add-hook 'prog-mode-hook 'linum-mode)
;; (setq linum-format "%d ")

(add-hook 'prog-mode-hook 'nlinum-mode)

(yas-global-mode 0)

;; http://www.emacswiki.org/emacs/WinnerMode
(when (fboundp 'winner-mode)
  (winner-mode 1))

(setq resize-mini-windows t)
;; (setq max-mini-window-height 2)

;; http://stackoverflow.com/questions/3447531/emacs-ess-version-of-clear-console

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments
   (quote
    ("--smart-case" "--stats" "-p '~/dotfiles/.agignore'")))
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(async-bytecomp-allowed-packages (quote (quote (all))))
 '(auth-sources (quote ("~/.authinfo.gpg" "~/.authinfo" "~/.netrc")))
 '(auto-package-update-hide-results t)
 '(beacon-color "#cc6666")
 '(byte-compile-warnings nil)
 '(column-number-mode t)
 '(company-clang-executable "clang")
 '(compilation-message-face (quote default))
 '(coq-compile-before-require t)
 '(coq-compile-parallel-in-background t)
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "c3d4af771cbe0501d5a865656802788a9a0ff9cf10a7df704ec8b8ef69017c68" "291588d57d863d0394a0d207647d9f24d1a8083bb0c9e8808280b46996f3eb83" "9fe1540491fcf692b8c639a3abacd32b29233bc4cb834a12a0fd1e01cbd0a128" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" "ba7917b02812fee8da4827fdf7867d3f6f282694f679b5d73f9965f45590843a" "c72a772c104710300103307264c00a04210c00f6cc419a79b8af7890478f380e" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "a0dc0c1805398db495ecda1994c744ad1a91a9455f2a17b59b716f72d3585dde" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(desktop-save-mode t)
 '(display-time-day-and-date t)
 '(display-time-mode t)
 '(display-time-world-list
   (quote
    (("America/Los_Angeles" "Los Angeles")
     ("America/New_York" "Boston"))))
 '(doc-view-pdf->png-converter-function (quote doc-view-pdf->png-converter-mupdf))
 '(doc-view-resolution 200)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(elfeed-feeds
   (quote
    ("http://www.wsj.com/xml/rss/3_7455.xml" "http://www.wsj.com/xml/rss/3_7031.xml" "http://www.wsj.com/xml/rss/3_7014.xml" "http://www.wsj.com/xml/rss/3_7085.xml" "http://www.wsj.com/xml/rss/3_7041.xml" "http://feeds.reuters.com/reuters/topNews" "http://feeds.reuters.com/Reuters/domesticNews" "http://feeds.reuters.com/Reuters/worldNews" "https://news.google.com/news/rss/headlines?ned=us&gl=US&hl=en" "https://news.ycombinator.com/rss" "http://www.thehill.com/rss/syndicator/19110" "http://www.thehill.com/rss/syndicator/19109" "http://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml" "http://rss.slashdot.org/Slashdot/slashdotMain")))
 '(ensime-sbt-perform-on-save "compile")
 '(erc-autojoin-domain-only nil)
 '(erc-autojoin-timing (quote ident))
 '(erc-dcc-chat-request (quote ignore))
 '(erc-dcc-send-request (quote ignore))
 '(erc-email-userid "peterbecich@gmail.com")
 '(erc-join-buffer (quote bury))
 '(erc-log-insert-log-on-open nil)
 '(erc-log-write-after-insert t)
 '(erc-log-write-after-send t)
 '(erc-modules
   (quote
    (autojoin button completion fill irccontrols list log match menu move-to-prompt netsplit networks noncommands readonly ring stamp spelling)))
 '(erc-nick "peterbecich")
 '(erc-notifications-mode nil)
 '(erc-notify-mode t)
 '(erc-public-away-p t)
 '(erc-rename-buffers t)
 '(erc-reuse-frames nil)
 '(erc-server-reconnect-attempts 6)
 '(erc-server-reconnect-timeout 15)
 '(erc-track-minor-mode nil)
 '(erc-track-mode nil)
 '(erc-track-position-in-mode-line t)
 '(erc-truncate-mode t)
 '(erc-try-new-nick-p nil)
 '(erc-user-mode "+RZgi")
 '(eshell-history-size 2048)
 '(fci-rule-color "#eee8d5")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(flycheck-hlint-args (quote ("-j")))
 '(frame-background-mode (quote dark))
 '(fringe-mode 0 nil (fringe))
 '(gnutls-trustfiles
   (quote
    ("/etc/ssl/certs/ca-certificates.crt" "/etc/pki/tls/certs/ca-bundle.crt" "/etc/ssl/ca-bundle.pem" "/usr/ssl/certs/ca-bundle.crt" "/usr/local/share/certs/ca-root-nss.crt" "/opt/local/share/curl/curl-ca-bundle.crt")))
 '(haskell-tags-on-save t)
 '(helm-locate-command "glocate %s %s")
 '(helm-locate-create-db-command "gupdatedb --output='%s' --localpaths='%s'")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(intero-debug nil)
 '(intero-extra-ghc-options nil)
 '(intero-extra-ghci-options nil)
 '(intero-stack-executable "stack")
 '(json-reformat:indent-width 2)
 '(json-reformat:pretty-string\? t)
 '(magit-diff-use-overlays nil)
 '(magit-section-cache-visibility nil)
 '(magithub-api-available-check-frequency 2)
 '(magithub-api-timeout 10)
 '(magithub-issue-issue-filter-functions nil)
 '(message-log-max 4096)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-protocol org-w3m)))
 '(package-selected-packages
   (quote
    (helm-make hasky-stack flycheck-hdevtools undo-tree circe helm-flx intero js-format helm-dash kubernetes kubernetes-tramp symon emojify nlinum-mode nlinum auto-compile helm-descbinds helm-google magit-org-todos nix-mode elfeed-goodies multi-term jenkins whitespace-cleanup-mode emacsql emacsql-mysql emacsql-psql emacsql-sqlite shakespeare-mode typescript-mode vue-html-mode vue-mode websocket ac-rtags afternoon-theme ag alect-themes ample-theme anti-zenburn-theme auctex-latexmk auto-package-update auto-virtualenv auto-virtualenvwrapper birds-of-paradise-plus-theme boron-theme browse-at-remote buffer-move build-status cider clojure-mode color-identifiers-mode color-theme-actress color-theme-approximate color-theme-buffer-local color-theme-cobalt color-theme-complexity color-theme-dg color-theme-dpaste color-theme-eclipse color-theme-emacs-revert-theme color-theme-github color-theme-gruber-darker color-theme-heroku color-theme-ir-black color-theme-library color-theme-molokai color-theme-monokai color-theme-railscasts color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow color-theme-solarized color-theme-tango color-theme-tangotango color-theme-twilight color-theme-vim-insert-mode color-theme-wombat color-theme-zenburn colormaps company-c-headers company-coq company-emacs-eclim company-ghc company-irony company-irony-c-headers company-rtags company-shell company-terraform csv-mode ctags ctags-update cyberpunk-theme docker docker-compose-mode dockerfile-mode eclim elfeed elm-mode elpy elscreen ensime ereader espresso-theme ess ess-R-data-view ess-R-object-popup exec-path-from-shell flx-ido flycheck-haskell flycheck-irony flycheck-ocaml flycheck-purescript flycheck-rtags flycheck-scala-sbt fold-this geiser ghc ghub gist git glsl-mode go-autocomplete go-mode hamlet-mode haskell-mode helm helm-ag helm-company helm-elscreen helm-ghc helm-hoogle helm-projectile helm-tramp hide-comnt hindent hlint-refactor hlint-refactor-mode idris-mode ipython irony irony-eldoc jdee js2-mode js2-refactor keychain-environment latex-extra latex-math-preview latex-preview-pane leuven-theme magit magit-gh-pulls magithub maker-mode markdown-mode monokai-theme multi-web-mode nov org org-caldav org-pomodoro orgit paradox paredit pdf-tools powerline psc-ide psci puppet-mode purescript-mode rainbow-delimiters redprl restclient rtags scala-mode shm slack smart-mode-line smartparens sml-mode solarized-theme sublime-themes sx terraform-mode twittering-mode use-package w3m wakatime-mode web-mode xterm-color yaml-mode zenburn-theme)))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(projectile-enable-idle-timer nil)
 '(projectile-require-project-root nil)
 '(projectile-tags-backend (quote etags-select))
 '(projectile-tags-command "hasktags --ignore-close-implementation --ctags %s")
 '(safe-local-variable-values
   (quote
    ((haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4))))
 '(sbt:scroll-to-bottom-on-output t)
 '(scroll-bar-mode nil)
 '(shm-use-hdevtools t)
 '(show-paren-mode t)
 '(slack-buffer-create-on-notify (quote true))
 '(slack-buffer-emojify (quote true))
 '(slack-prefer-current-team (quote true))
 '(slack-room-subscription nil)
 '(slack-typing-visibility (quote never))
 '(symon-mode nil)
 '(symon-monitors
   (quote
    (symon-darwin-memory-monitor symon-darwin-cpu-monitor symon-darwin-network-rx-monitor symon-darwin-network-tx-monitor symon-darwin-battery-monitor)))
 '(symon-sparkline-type (quote boxed))
 '(term-scroll-to-bottom-on-output t)
 '(tool-bar-mode nil)
 '(twittering-timer-interval 300)
 '(twittering-use-icon-storage t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(w3m-confirm-leaving-secure-page nil)
 '(wakatime-python-bin nil t)
 )

(setq ring-bell-function 'ignore)

;; https://www.masteringemacs.org/article/keeping-secrets-in-emacs-gnupg-auth-sources
(setq epg-gpg-program "gpg2")

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))


(setq compilation-scroll-output 'first-error)

(load "~/dotfiles/emacs/areas/c.el")
(load "~/dotfiles/emacs/areas/epub.el")
(load "~/dotfiles/emacs/areas/git.el")
(load "~/dotfiles/emacs/areas/haskell.el")
(load "~/dotfiles/emacs/areas/helm.el")
(load "~/dotfiles/emacs/areas/irc.el")
(load "~/dotfiles/emacs/areas/java.el")
(load "~/dotfiles/emacs/areas/javascript.el")
(load "~/dotfiles/emacs/areas/lisp.el")
(load "~/dotfiles/emacs/areas/markdown.el")
(load "~/dotfiles/emacs/areas/org.el")
(load "~/dotfiles/emacs/areas/proof-general.el")
(load "~/dotfiles/emacs/areas/purescript.el")
(load "~/dotfiles/emacs/areas/python.el")
(load "~/dotfiles/emacs/areas/scala.el")
(load "~/dotfiles/emacs/areas/shell.el")
(load "~/dotfiles/emacs/areas/twitter.el")
(load "~/dotfiles/emacs/areas/web.el")

;; (use-package zenburn-theme)
;; (use-package espresso-theme)
;; (use-package leuven-theme)
;; (use-package moe-theme)
;; (use-package solarized-theme)
;;(set-face-background hl-line-face "#dbdbdb"); Same color as greyness in gtk


(defadvice message (before when-was-that activate)
  "Add timestamps to `message' output."
  (ad-set-arg 0 (concat (format-time-string "[%Y-%m-%d %T %Z] ") 
			(ad-get-arg 0)) ))

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


(setq-default line-spacing 0)


(put 'magit-clean 'disabled nil)

;; https://github.com/Fuco1/.emacs.d/blob/master/files/smartparens.el
;; (define-key smartparens-mode-map (kbd "C-M-f") 'sp-forward-sexp)
;; (define-key smartparens-mode-map (kbd "C-M-b") 'sp-backward-sexp)

;; (define-key smartparens-mode-map (kbd "C-M-d") 'sp-down-sexp)
;; (define-key smartparens-mode-map (kbd "C-M-a") 'sp-backward-down-sexp)
;; (define-key smartparens-mode-map (kbd "C-S-d") 'sp-beginning-of-sexp)
;; (define-key smartparens-mode-map (kbd "C-S-a") 'sp-end-of-sexp)

;; (define-key smartparens-mode-map (kbd "C-M-e") 'sp-up-sexp)
;; (define-key smartparens-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
;; (define-key smartparens-mode-map (kbd "C-M-t") 'sp-transpose-sexp)

;; (define-key smartparens-mode-map (kbd "C-M-n") 'sp-forward-hybrid-sexp)
;; (define-key smartparens-mode-map (kbd "C-M-p") 'sp-backward-hybrid-sexp)

;; (define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
;; (define-key smartparens-mode-map (kbd "C-M-w") 'sp-copy-sexp)

;; (define-key smartparens-mode-map (kbd "M-<delete>") 'sp-unwrap-sexp)
;; (define-key smartparens-mode-map (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

(define-key smartparens-mode-map (kbd "C-M-<right>") 'sp-forward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-M-<left>") 'sp-forward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-S-M-<left>") 'sp-backward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-S-M-<right>") 'sp-backward-barf-sexp)


;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(shm-current-face ((t (:background "#c7fbea"))))
;;  '(shm-quarantine-face ((t (:background "#ffd8e1")))))

(let ((inhibit-message t))
  (message "Invalid face reference: 1"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(shm-current-face ((t (:background "Black")))))
