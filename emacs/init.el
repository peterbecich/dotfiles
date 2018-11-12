(require 'package) ;; You might already have this line
(require 'tls)
(setq gnutls-trustfiles
  (quote
    ("/etc/ssl/certs/ca-certificates.crt" "/etc/pki/tls/certs/ca-bundle.crt" "/etc/ssl/ca-bundle.pem" "/usr/ssl/certs/ca-bundle.crt" "/usr/local/share/certs/ca-root-nss.crt" "/opt/local/share/curl/curl-ca-bundle.crt")))
(setq tls-checktrust t)
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


(use-package ag)
(use-package auctex-latexmk)
(use-package auto-compile)
(use-package auto-virtualenv)
(use-package browse-at-remote)
(use-package butler)
(use-package cider)
(use-package company-irony)
(use-package company-irony-c-headers)
(use-package company-rtags)
(use-package company-terraform)
(use-package csv-mode)
(use-package dired-du)
(use-package docker :ensure t :bind ("C-c d d" . docker))
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
(use-package fill-column-indicator)
(use-package flatui-theme)
(use-package flx-ido)
(use-package flycheck-haskell)
(use-package flycheck-rtags)
(use-package ghc)
(use-package git-gutter-fringe)
(use-package git-link)
(use-package haskell-mode)
(use-package hasky-stack)
(use-package helm)
(use-package helm-ag)
(use-package helm-elscreen)
(use-package helm-eww)
(use-package helm-flx)
(use-package helm-flycheck)
(use-package helm-flyspell)
(use-package helm-ghc)
(use-package helm-google)
(use-package helm-hoogle)
(use-package helm-make)
(use-package helm-projectile)
(use-package helm-slime)
(use-package helm-swoop)
(use-package helm-tramp)
(use-package highlight-defined)
(use-package highlight-indent-guides)
(use-package highlight-thing)
(use-package hindent)
(use-package hlint-refactor)
(use-package intero)
(use-package irony)
(use-package irony-eldoc)
(use-package jdee)
(use-package js-format)
(use-package js2-mode)
(use-package js2-refactor)
(use-package kubernetes)
(use-package kubernetes-tramp)
(use-package magit :ensure t)
(use-package magit-popup)
(use-package magit-todos)
(use-package magithub :after magit :ensure t :config (magithub-feature-autoinject t))
(use-package markdown-mode)
(use-package multi-web-mode)
(use-package nlinum)
(use-package org)
(use-package paradox)
;; (use-package paredit)
(use-package pdf-tools)
(use-package persistent-scratch)
(use-package psc-ide)
(use-package puppet-mode)
(use-package purescript-mode)
(use-package racket-mode)
(use-package rainbow-delimiters)
(use-package restart-emacs)
(use-package restclient)
(use-package rjsx-mode)
(use-package rtags)
(use-package sage-shell-mode)
(use-package sbt-mode)
(use-package shakespeare-mode)
(use-package shm)
(use-package slime)
(use-package slime-company)
(use-package smart-mode-line)
(use-package smartparens)
(use-package sml-mode)
(use-package sx)
(use-package symon)
(use-package terraform-mode)
(use-package tide)
(use-package twittering-mode)
(use-package typescript-mode)
(use-package vue-html-mode)
(use-package vue-mode)
(use-package w3m)
(use-package web-mode)
(use-package websocket)
(use-package ws-butler)
(use-package yaml-mode)
(require 'paradox)
(paradox-enable)


(require 'magit)
(require 'magit-todos)


(load "~/dotfiles/emacs/init_private.el")

(load "~/dotfiles/emacs/custom_commands.el")
(load "~/dotfiles/emacs/auctex_related.el")
(load "~/dotfiles/emacs/package_list.el")


(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)


;; (require 'flx-ido)
(ido-mode 0)
(ido-everywhere 0)
(flx-ido-mode 0)

(require 'smartparens-config)
(elscreen-start)
(require 'helm-config)


(add-hook 'after-init-hook 'global-company-mode)

(eval-when-compile
  (require 'use-package))

(setq tramp-default-method "ssh")

(async-bytecomp-package-mode 1)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(setq request-backend 'url-retrieve)

(setq docker-global-mode 1)

(desktop-save-mode 0)

(pdf-tools-install)

(setq dired-listing-switches "-alh")

(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 1
	 auto-package-update-at-time "20:00")
   (auto-package-update-maybe))


(setq dired-dwim-target nil)

(setq emerge-diff-options "--ignore-all-space")

(setq column-number-mode t)


(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(global-visual-line-mode 1)             ; Proper line wrapping
(show-paren-mode 1); Matches parentheses and such in every mode

(add-to-list 'default-frame-alist '(height . 59)); Default frame height.

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
 '(auto-revert-verbose nil)
 '(beacon-color "#cc6666")
 '(byte-compile-warnings nil)
 '(column-number-mode t)
 '(company-clang-executable "clang")
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-always-kill t)
 '(compilation-auto-jump-to-first-error nil)
 '(compilation-message-face (quote default))
 '(coq-compile-before-require t)
 '(coq-compile-parallel-in-background t)
 '(custom-enabled-themes (quote (flatui)))
 '(custom-safe-themes
   (quote
    ("392395ee6e6844aec5a76ca4f5c820b97119ddc5290f4e0f58b38c9748181e8d" "1a1cdd9b407ceb299b73e4afd1b63d01bbf2e056ec47a9d95901f4198a0d2428" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "e61752b5a3af12be08e99d076aedadd76052137560b7e684a8be2f8d2958edc3" "47ec21abaa6642fefec1b7ace282221574c2dd7ef7715c099af5629926eb4fd7" "ec5f697561eaf87b1d3b087dd28e61a2fc9860e4c862ea8e6b0b77bd4967d0ba" "e03d2f414fb109f3920752b10b92323697174f49d577da9e69979edbb147a921" "ddac2dc87d1c654578cde2340baff68f76c3ccd67b75ba9310993ed96e371d36" "fd825ffbcec8199cd08266a50441df9c68db831a4bdb9cb5d85dfbb2c59c96ae" "0c32e4f0789f567a560be625f239ee9ec651e524e46a4708eb4aba3b9cdc89c5" "89dd0329d536d389753111378f2425bd4e4652f892ae8a170841c3396f5ba2dd" "3f44e2d33b9deb2da947523e2169031d3707eec0426e78c7b8a646ef773a2077" "190a9882bef28d7e944aa610aa68fe1ee34ecea6127239178c7ac848754992df" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "c3d4af771cbe0501d5a865656802788a9a0ff9cf10a7df704ec8b8ef69017c68" "291588d57d863d0394a0d207647d9f24d1a8083bb0c9e8808280b46996f3eb83" "9fe1540491fcf692b8c639a3abacd32b29233bc4cb834a12a0fd1e01cbd0a128" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" "ba7917b02812fee8da4827fdf7867d3f6f282694f679b5d73f9965f45590843a" "c72a772c104710300103307264c00a04210c00f6cc419a79b8af7890478f380e" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "a0dc0c1805398db495ecda1994c744ad1a91a9455f2a17b59b716f72d3585dde" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(desktop-save-mode t)
 '(dired-du-on-find-dired-ok nil)
 '(dired-du-size-format t)
 '(dired-du-update-headers t)
 '(display-time-day-and-date t)
 '(display-time-mode t)
 '(display-time-world-list
   (quote
    (("America/Los_Angeles" "Los Angeles")
     ("America/New_York" "Boston")
     ("Europe/Zurich" "Zurich")
     ("US/Hawaii" "Honolulu"))))
 '(display-time-world-time-format "%A %d %B %I:%M %p %Z")
 '(doc-view-pdf->png-converter-function (quote doc-view-pdf->png-converter-mupdf))
 '(doc-view-resolution 200)
 '(docker-image-default-sort-key (quote ("Tag")))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(elfeed-feeds
   (quote
    ("http://www.wsj.com/xml/rss/3_7455.xml" "http://www.wsj.com/xml/rss/3_7031.xml" "http://www.wsj.com/xml/rss/3_7014.xml" "http://www.wsj.com/xml/rss/3_7085.xml" "http://www.wsj.com/xml/rss/3_7041.xml" "http://feeds.reuters.com/reuters/topNews" "http://feeds.reuters.com/Reuters/domesticNews" "http://feeds.reuters.com/Reuters/worldNews" "https://news.google.com/news/rss/headlines?ned=us&gl=US&hl=en" "https://news.ycombinator.com/rss" "http://www.thehill.com/rss/syndicator/19110" "http://www.thehill.com/rss/syndicator/19109" "http://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml" "http://rss.slashdot.org/Slashdot/slashdotMain" "http://www.latimes.com/local/rss2.0.xml" "http://feeds.marketwatch.com/marketwatch/topstories/" "http://feeds.marketwatch.com/marketwatch/realtimeheadlines/" "https://thediplomat.com/feed/" "http://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml" "http://rss.nytimes.com/services/xml/rss/nyt/World.xml" "http://rss.nytimes.com/services/xml/rss/nyt/US.xml")))
 '(elfeed-search-filter "@1-week-ago")
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
 '(eshell-buffer-maximum-lines 6000)
 '(eshell-history-size 2048)
 '(fci-rule-width 1)
 '(fill-column 100)
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(flycheck-hlint-args (quote ("-j")))
 '(flycheck-idle-change-delay 0.1)
 '(flycheck-navigation-minimum-level (quote warning))
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(git-link-use-commit t)
 '(global-git-gutter-mode t)
 '(global-highlight-thing-mode t)
 '(global-linum-mode nil)
 '(global-nlinum-mode t)
 '(haskell-font-lock-symbols nil)
 '(haskell-tags-on-save t)
 '(hasky-stack-auto-target t)
 '(helm-ag-insert-at-point (quote ##))
 '(helm-buffers-fuzzy-matching t)
 '(helm-flx-for-helm-find-files t)
 '(helm-flx-for-helm-locate t)
 '(helm-flx-mode t)
 '(helm-fuzzy-match-fn (quote helm-fuzzy-match))
 '(helm-imenu-fuzzy-match t)
 '(helm-locate-command "glocate %s %s")
 '(helm-locate-create-db-command "gupdatedb --output='%s' --localpaths='%s'")
 '(helm-make-arguments "")
 '(helm-make-cache-targets t)
 '(helm-make-fuzzy-matching t)
 '(helm-make-list-target-method (quote qp))
 '(helm-make-named-buffer t)
 '(helm-make-sort-targets t)
 '(helm-mode-fuzzy-match t)
 '(helm-swoop-use-fuzzy-match t)
 '(helm-time-zone-home-location "Los Angeles")
 '(helm-top-command
   "env COLUMNS=%s ps -raxo pid,user,pri,nice,ucomm,tty,start_time,vsz,%%cpu,%%mem,etime")
 '(helm-top-poll-mode t)
 '(highlight-thing-case-sensitive-p t)
 '(highlight-thing-exclude-thing-under-point t)
 '(intero-debug nil)
 '(intero-extra-ghc-options (quote ("-dppr-cols200")))
 '(intero-extra-ghci-options (quote ("-dppr-cols200")))
 '(intero-global-mode nil nil (intero))
 '(intero-pop-to-repl nil)
 '(intero-stack-executable "stack")
 '(isearch-allow-scroll t)
 '(ispell-dictionary "english")
 '(ispell-local-dictionary-alist nil)
 '(jit-lock-debug-mode nil)
 '(jit-lock-defer-time 0.25)
 '(jit-lock-stealth-nice 0.25)
 '(jit-lock-stealth-verbose nil)
 '(json-reformat:indent-width 2)
 '(json-reformat:pretty-string\? t)
 '(magit-diff-refine-hunk (quote all))
 '(magit-diff-use-overlays nil)
 '(magit-section-cache-visibility nil)
 '(magithub-api-available-check-frequency 2)
 '(magithub-api-timeout 10)
 '(magithub-issue-issue-filter-functions nil)
 '(menu-bar-mode nil)
 '(message-log-max 4096)
 '(nlinum-format "%d ")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-protocol org-w3m)))
 '(package-selected-packages
   (quote
    (highlight-defined suggest racket-mode helm-slime slime slime-company ac-rtags adoc-mode afternoon-theme ag alect-themes ample-theme anti-zenburn-theme apel apiwrap async auctex auctex-latexmk auto-compile auto-package-update auto-virtualenv auto-virtualenvwrapper bind-key birds-of-paradise-plus-theme boron-theme browse-at-remote buffer-move build-status butler cider circe clojure-mode color-identifiers-mode color-theme-actress color-theme-approximate color-theme-buffer-local color-theme-cobalt color-theme-complexity color-theme-dg color-theme-dpaste color-theme-eclipse color-theme-emacs-revert-theme color-theme-github color-theme-gruber-darker color-theme-heroku color-theme-ir-black color-theme-library color-theme-molokai color-theme-monokai color-theme-railscasts color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow color-theme-solarized color-theme-tango color-theme-tangotango color-theme-twilight color-theme-vim-insert-mode color-theme-wombat color-theme-zenburn colormaps company company-c-headers company-coq company-emacs-eclim company-ghc company-irony company-irony-c-headers company-math company-rtags company-shell company-terraform csv-mode ctags ctags-update cyberpunk-theme dash dash-functional deferred dired-du docker docker-compose-mode docker-tramp dockerfile-mode eclim edit-indirect elfeed elm-mode elpy elscreen emacsql emacsql-mysql emacsql-psql emacsql-sqlite emojify ensime ereader espresso-theme ess ess-R-data-view ess-R-object-popup fill-column-indicator flatui-theme flycheck-haskell flycheck-irony flycheck-ocaml flycheck-purescript flycheck-scala-sbt fold-this geiser ghub ghub gist git git-commit git-gutter-fringe glsl-mode go-autocomplete go-mode golden-ratio hamlet-mode helm helm-spotify-plus helm-tramp hide-comnt highlight-indent-guides hl-todo hlint-refactor-mode idris-mode indium info-colors info-colors intero ipython julia-mode keychain-environment kubernetes kubernetes-tramp latex-extra latex-math-preview latex-preview-pane let-alist lsp-haskell lsp-mode lsp-typescript lsp-ui lsp-vue magit magit magit-gh-pulls magit-gh-pulls magit-todos magit-todos maker-mode markdown-mode mmm-mode monokai-theme multi multi-line nix-mode nlinum nlinum-mode noflet nov oauth2 org org-caldav org-pomodoro orgit pcre2el persistent-scratch pg popwin projectile proof-general psci redprl restart-emacs rtags sage-shell-mode sbt-mode seq slack smart-mode-line smartparens sml-mode solarized-theme spinner sublime-themes system-packages tide twittering-mode typescript-mode undo-tree wakatime-mode web-mode)))
 '(paradox-execute-asynchronously nil)
 '(paradox-github-token t)
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(projectile-enable-idle-timer t)
 '(projectile-idle-timer-seconds 30)
 '(projectile-require-project-root nil)
 '(projectile-tags-backend (quote etags-select))
 '(projectile-tags-command "fast-tags -e -R %s")
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
 '(vc-display-status nil)
 '(w3m-confirm-leaving-secure-page nil)
 '(wakatime-python-bin nil t)
 '(whitespace-style
   (quote
    (face trailing tabs spaces lines newline empty indentation space-after-tab space-before-tab space-mark tab-mark newline-mark)))
 '(ws-butler-keep-whitespace-before-point nil))


(sml/setup)
(setq sml/theme 'light)


(setq ring-bell-function 'ignore)

;; https://www.masteringemacs.org/article/keeping-secrets-in-emacs-gnupg-auth-sources
(setq epg-gpg-program "gpg2")

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(load "~/dotfiles/emacs/areas/c.el")
(load "~/dotfiles/emacs/areas/epub.el")
(load "~/dotfiles/emacs/areas/git.el")
(load "~/dotfiles/emacs/areas/haskell.el")
(load "~/dotfiles/emacs/areas/helm.el")
(load "~/dotfiles/emacs/areas/irc.el")
(load "~/dotfiles/emacs/areas/java.el")
(load "~/dotfiles/emacs/areas/javascript.el")
(load "~/dotfiles/emacs/areas/json.el")
(load "~/dotfiles/emacs/areas/lisp.el")
(load "~/dotfiles/emacs/areas/markdown.el")
(load "~/dotfiles/emacs/areas/org.el")
(load "~/dotfiles/emacs/areas/proof-general.el")
(load "~/dotfiles/emacs/areas/purescript.el")
(load "~/dotfiles/emacs/areas/python.el")
(load "~/dotfiles/emacs/areas/sage.el")
(load "~/dotfiles/emacs/areas/scala.el")
(load "~/dotfiles/emacs/areas/shell.el")
(load "~/dotfiles/emacs/areas/sql.el")
(load "~/dotfiles/emacs/areas/twitter.el")
(load "~/dotfiles/emacs/areas/web.el")

(defadvice message (before when-was-that activate)
  "Add timestamps to `message' output."
  (ad-set-arg 0 (concat (format-time-string "[%Y-%m-%d %T %Z] ")
			(ad-get-arg 0)) ))

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


(setq-default line-spacing 0)

(setq helm-ag-insert-at-point 'symbol)

(setq helm-projectile-fuzzy-match t)
(require 'helm-projectile)
(helm-projectile-on)

;;https://emacs.stackexchange.com/questions/1028/mark-and-open-multiple-files-with-helm-and-projectile
(setq projectile-completion-system 'helm
      projectile-switch-project-action 'helm-projectile)

(setq docker-arguments nil)

(define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)

(global-set-key (kbd "\C-c d l") 'docker-logs)

(global-set-key (kbd "\C-c g l") 'git-link)

(global-set-key (kbd "\C-c g g") 'helm-google)

(global-set-key (kbd "\C-cM") 'helm-make-projectile)

(global-set-key (kbd "\C-c s n") 'helm-elscreen)

(global-set-key (kbd "\C-c s s") 'helm-spotify-plus)  ;; s for SEARCH
(global-set-key (kbd "\C-c s f") 'helm-spotify-plus-next)
(global-set-key (kbd "\C-c s b") 'helm-spotify-plus-previous)
(global-set-key (kbd "\C-c s p") 'helm-spotify-plus-play)
(global-set-key (kbd "\C-c s g") 'helm-spotify-plus-pause) ;; g cause you know.. C-g stop things :)

(global-set-key (kbd "\C-cww") 'helm-eww)
(global-set-key (kbd "\C-cwt") 'helm-world-time)


(global-set-key (kbd "\C-ci") 'helm-imenu)

(global-set-key (kbd "\C-co") 'helm-multi-swoop-projectile)


(global-set-key (kbd "\C-cfc") 'helm-flycheck)
(global-set-key (kbd "\C-cfs") 'helm-flyspell-correct)

(setq-default indent-tabs-mode nil)

(setq global-whitespace-cleanup-mode t)
(require 'ws-butler)
(add-hook 'prog-mode-hook #'ws-butler-mode)

;; Optional face for line numbers
;; Face name is `helm-swoop-line-number-face`
(setq helm-swoop-use-line-number-face t)

;; If you prefer fuzzy matching
(setq helm-swoop-use-fuzzy-match t)

(setq gc-cons-threshold (eval-when-compile (* 1024 1024 1024)))
(run-with-idle-timer 2 t (lambda () (garbage-collect)))

(setq garbage-collection-messages nil)

(setq auto-window-vscroll nil)

(global-set-key (kbd "<kp-2>") 'end-of-defun)
(global-set-key (kbd "<kp-8>") 'beginning-of-defun)
(global-set-key (kbd "<kp-6>") 'elscreen-next)
(global-set-key (kbd "<kp-4>") 'elscreen-previous)
(global-set-key (kbd "<kp-5>") 'elscreen-swap)

(setq global-auto-revert-mode 0)

(persistent-scratch-setup-default)
(setq helm-split-window-inside-p t)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(add-to-list 'auto-mode-alist (cons "\\.asciidoc\\'" 'adoc-mode))

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

(setq redisplay-dont-pause t)

(require 'git-gutter-fringe)
(setq global-git-commit-mode t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'magit-clean 'disabled nil)
