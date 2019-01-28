


(require 'package) ;; You might already have this line
;; (require 'tls)
(setq gnutls-trustfiles
  (quote
    ("/etc/ssl/certs/ca-certificates.crt" "/etc/pki/tls/certs/ca-bundle.crt" "/etc/ssl/ca-bundle.pem" "/usr/ssl/certs/ca-bundle.crt" "/usr/local/share/certs/ca-root-nss.crt" "/opt/local/share/curl/curl-ca-bundle.crt")))
(setq tls-checktrust t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(package-refresh-contents)

(package-install 'use-package)


(require 'use-package)

(setq load-prefer-newer t)


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


(use-package ag :ensure t)
(use-package auctex-latexmk :ensure t)
(use-package auto-virtualenv :ensure t)
(use-package browse-at-remote :ensure t)
(use-package auto-compile :ensure t)
(use-package butler :ensure t)
(use-package cider :ensure t)
(use-package company-irony :ensure t)
(use-package company-irony-c-headers :ensure t)
(use-package company-rtags :ensure t)
(use-package company-terraform :ensure t)
(use-package csv-mode :ensure t)
(use-package docker :ensure t :bind ("C-c d d" . docker))
(use-package docker-compose-mode :ensure t)
(use-package dockerfile-mode :ensure t)
(use-package elfeed :ensure t)
(use-package elscreen :ensure t)
(use-package emacsql :ensure t)
(use-package emacsql-mysql :ensure t)
(use-package emacsql-psql :ensure t)
(use-package emacsql-sqlite :ensure t)
(use-package emojify :ensure t)
(use-package espresso-theme :ensure t)
(use-package ensime :ensure t)
(use-package ess :ensure t)
(use-package fill-column-indicator :ensure t)
(use-package flx-ido :ensure t)
(use-package flycheck-haskell :ensure t)
(use-package flycheck-rtags :ensure t)
(use-package ghc :ensure t)
(use-package git-gutter-fringe :ensure t)
(use-package git-link :ensure t)
(use-package git-timemachine :ensure t)
(use-package haskell-mode :ensure t)
(use-package hasky-stack :ensure t)
(use-package helm :ensure t)
(use-package helm-ag :ensure t)
(use-package helm-elscreen :ensure t)
(use-package helm-eww :ensure t)
(use-package helm-flx :ensure t)
(use-package helm-flycheck :ensure t)
(use-package helm-flyspell :ensure t)
(use-package helm-ghc :ensure t)
(use-package helm-google :ensure t)
(use-package helm-hoogle :ensure t)
(use-package helm-make :ensure t)
(use-package helm-projectile :ensure t)
(use-package helm-slime :ensure t)
(use-package helm-swoop :ensure t)
(use-package helm-tramp :ensure t)
(use-package highlight-defined :ensure t)
(use-package highlight-indent-guides :ensure t)
(use-package highlight-thing :ensure t)
(use-package hindent :ensure t)
(use-package hlint-refactor :ensure t)
(use-package intero :ensure t)
(use-package irony :ensure t)
(use-package irony-eldoc :ensure t)
(use-package jdee :ensure t)
(use-package js-format :ensure t)
(use-package js2-mode :ensure t)
(use-package js2-refactor :ensure t)
(use-package kubernetes :ensure t)
(use-package kubernetes-tramp :ensure t)
(use-package magit :ensure t)
(use-package magit-popup :ensure t)
(use-package magit-todos :ensure t)
(use-package magithub
  :after magit
  :config
  (magithub-feature-autoinject t))
(use-package markdown-mode :ensure t)
(use-package multi-web-mode :ensure t)
(use-package nlinum :ensure t)
(use-package org :ensure t)
(use-package paradox :ensure t)
;; (use-package paredit :ensure t)
(use-package pdf-tools :ensure t)
(use-package persistent-scratch :ensure t)
(use-package psc-ide :ensure t)
(use-package puppet-mode :ensure t)
(use-package purescript-mode :ensure t)
(use-package racket-mode :ensure t)
(use-package rainbow-delimiters :ensure t)
(use-package restart-emacs :ensure t)
(use-package restclient :ensure t)
(use-package rjsx-mode :ensure t)
(use-package rtags :ensure t)
(use-package sage-shell-mode :ensure t)
(use-package sbt-mode :ensure t)
(use-package shakespeare-mode :ensure t)
(use-package shm :ensure t)
(use-package slime :ensure t)
(use-package slime-company :ensure t)
(use-package smart-mode-line :ensure t)
(use-package smartparens :ensure t)
(use-package sml-mode :ensure t)
(use-package sx :ensure t)
(use-package symon :ensure t)
(use-package terraform-mode :ensure t)
(use-package tide :ensure t)
(use-package twittering-mode :ensure t)
(use-package typescript-mode :ensure t)
(use-package vue-html-mode :ensure t)
(use-package vue-mode :ensure t)
(use-package w3m :ensure t)
(use-package web-mode :ensure t)
(use-package websocket :ensure t)
(use-package ws-butler :ensure t)
(use-package yaml-mode :ensure t)
(use-package yaml-imenu :ensure t)
(use-package exec-path-from-shell :ensure t)
(use-package iedit :ensure t)
(use-package ansible :ensure t)
(use-package ansible-vault :ensure t)
(use-package org :ensure t)
(use-package emms :ensure t)
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
 '(ansi-color-names-vector
   ["#ecf0f1" "#e74c3c" "#2ecc71" "#f1c40f" "#2492db" "#9b59b6" "#1abc9c" "#2c3e50"])
 '(async-bytecomp-allowed-packages (quote (quote (all))))
 '(auth-sources (quote ("~/.authinfo.gpg" "~/.authinfo" "~/.netrc")))
 '(auto-package-update-hide-results t)
 '(auto-revert-verbose nil)
 '(battery-mode-line-limit 99)
 '(beacon-color "#cc6666")
 '(beacon-mode t)
 '(browse-url-browser-function
   (quote
    ((".*.stackexchange.com" . sx-open-link)
     ("stackoverflow.com" . sx-open-link)
     ("." . eww-browse-url))))
 '(byte-compile-warnings nil)
 '(column-number-mode t)
 '(company-clang-executable "clang")
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-always-kill t)
 '(compilation-ask-about-save nil)
 '(compilation-auto-jump-to-first-error t)
 '(compilation-message-face (quote default))
 '(compilation-scroll-output (quote first-error))
 '(compilation-skip-threshold 2)
 '(coq-compile-before-require t)
 '(coq-compile-parallel-in-background t)
 '(custom-enabled-themes (quote (espresso)))
 '(custom-safe-themes
   (quote
    ("1a1cdd9b407ceb299b73e4afd1b63d01bbf2e056ec47a9d95901f4198a0d2428" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(desktop-save-mode t)
 '(display-battery-mode t)
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
 '(emms-stream-default-action "play")
 '(emms-stream-repeat-p t)
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
 '(fci-rule-color "#f1c40f")
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
 '(hasky-stack-auto-newest-version t)
 '(hasky-stack-auto-target t)
 '(hasky-stack-build-arguments (quote ("--fast")))
 '(helm-ag-insert-at-point (quote ##))
 '(helm-buffers-fuzzy-matching t)
 '(helm-etags-fuzzy-match t)
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
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(intero-debug nil)
 '(intero-extra-ghc-options (quote ("-dppr-cols200")))
 '(intero-extra-ghci-options (quote ("-dppr-cols200")))
 '(intero-global-mode nil nil (intero))
 '(intero-pop-to-repl nil)
 '(intero-repl-no-build t)
 '(intero-repl-no-load t)
 '(intero-stack-executable "stack")
 '(isearch-allow-scroll t)
 '(ispell-dictionary "english")
 '(ispell-local-dictionary-alist nil)
 '(jit-lock-debug-mode nil)
 '(jit-lock-defer-time 0.05)
 '(jit-lock-stealth-nice 0.05)
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
    (magithub helm-emms emms beacon ansible ansible-vault yaml-mode know-your-http-well all-the-icons iedit git-timemachine yaml-imenu reveal-in-osx-finder highlight-defined suggest racket-mode helm-slime slime slime-company ac-rtags adoc-mode afternoon-theme ag alect-themes ample-theme anti-zenburn-theme apel apiwrap async auctex auctex-latexmk auto-compile auto-package-update auto-virtualenv auto-virtualenvwrapper bind-key birds-of-paradise-plus-theme boron-theme browse-at-remote buffer-move build-status butler cider circe clojure-mode color-identifiers-mode color-theme-actress color-theme-approximate color-theme-buffer-local color-theme-cobalt color-theme-complexity color-theme-dg color-theme-dpaste color-theme-eclipse color-theme-emacs-revert-theme color-theme-github color-theme-gruber-darker color-theme-heroku color-theme-ir-black color-theme-library color-theme-molokai color-theme-monokai color-theme-railscasts color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow color-theme-solarized color-theme-tango color-theme-tangotango color-theme-twilight color-theme-vim-insert-mode color-theme-wombat color-theme-zenburn colormaps company company-c-headers company-coq company-emacs-eclim company-ghc company-irony company-irony-c-headers company-math company-rtags company-shell company-terraform csv-mode ctags ctags-update cyberpunk-theme dash dash-functional deferred docker docker-compose-mode docker-tramp dockerfile-mode eclim edit-indirect elfeed elm-mode elpy elscreen emacsql emacsql-mysql emacsql-psql emacsql-sqlite emojify ensime ereader espresso-theme ess ess-R-data-view ess-R-object-popup fill-column-indicator flycheck-haskell flycheck-irony flycheck-ocaml flycheck-purescript flycheck-scala-sbt fold-this geiser ghub ghub gist git git-commit git-gutter-fringe glsl-mode go-autocomplete go-mode golden-ratio hamlet-mode helm helm-spotify-plus helm-tramp hide-comnt highlight-indent-guides hl-todo hlint-refactor-mode idris-mode indium info-colors info-colors intero ipython julia-mode keychain-environment kubernetes kubernetes-tramp latex-extra latex-math-preview latex-preview-pane let-alist lsp-haskell lsp-mode lsp-typescript lsp-ui lsp-vue magit magit magit-gh-pulls magit-gh-pulls magit-todos magit-todos maker-mode markdown-mode mmm-mode monokai-theme multi multi-line nix-mode nlinum nlinum-mode noflet nov oauth2 org org-caldav org-pomodoro orgit pcre2el persistent-scratch pg popwin projectile proof-general psci redprl restart-emacs rtags sage-shell-mode sbt-mode seq slack smart-mode-line smartparens sml-mode solarized-theme spinner sublime-themes system-packages tide twittering-mode typescript-mode undo-tree wakatime-mode web-mode)))
 '(paradox-execute-asynchronously nil)
 '(paradox-github-token t)
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(projectile-enable-idle-timer t)
 '(projectile-idle-timer-seconds 30)
 '(projectile-require-project-root nil)
 '(projectile-tags-backend (quote etags-select))
 '(projectile-tags-command "fast-tags -e -R %s")
 '(safe-local-variable-values (quote ((Syntax . Common-Lisp))))
 '(sbt:scroll-to-bottom-on-output t)
 '(scroll-bar-mode nil)
 '(shm-use-hdevtools t)
 '(show-paren-mode t)
 '(slack-buffer-create-on-notify (quote true))
 '(slack-buffer-emojify (quote true))
 '(slack-prefer-current-team (quote true))
 '(slack-room-subscription nil)
 '(slack-typing-visibility (quote never))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(symon-mode nil)
 '(symon-monitors
   (quote
    (symon-darwin-memory-monitor symon-darwin-cpu-monitor symon-darwin-network-rx-monitor symon-darwin-network-tx-monitor symon-darwin-battery-monitor)))
 '(symon-sparkline-type (quote boxed))
 '(term-scroll-to-bottom-on-output t)
 '(tool-bar-mode nil)
 '(twittering-timer-interval 300)
 '(twittering-use-icon-storage t)
 '(vc-annotate-background "#ecf0f1")
 '(vc-annotate-color-map
   (quote
    ((30 . "#e74c3c")
     (60 . "#c0392b")
     (90 . "#e67e22")
     (120 . "#d35400")
     (150 . "#f1c40f")
     (180 . "#d98c10")
     (210 . "#2ecc71")
     (240 . "#27ae60")
     (270 . "#1abc9c")
     (300 . "#16a085")
     (330 . "#2492db")
     (360 . "#0a74b9"))))
 '(vc-annotate-very-old-color "#0a74b9")
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
(load "~/dotfiles/emacs/areas/yaml.el")

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

(global-set-key (kbd "\C-c s x") 'sx-search)

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

(global-set-key (kbd "\C-xrh") 'git-gutter:revert-hunk)

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
(add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)


(setq redisplay-dont-pause t)

(require 'git-gutter-fringe)
(setq global-git-commit-mode t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq tags-add-tables nil)
(setq tags-revert-without-query t)
(put 'magit-clean 'disabled nil)


;; (require 'emms-setup)
;; (require 'emms-player-vlc)
;; (emms-standard)
;; (emms-default-players)
;; (setq emms-player-vlc-command-name
;;       "/Applications/VLC.app/Contents/MacOS/VLC")
