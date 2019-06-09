


(require 'package) ;; You might already have this line
;; (require 'tls)
(setq gnutls-trustfiles
  (quote
    ("/etc/ssl/certs/ca-certificates.crt" "/etc/pki/tls/certs/ca-bundle.crt" "/etc/ssl/ca-bundle.pem" "/usr/ssl/certs/ca-bundle.crt" "/usr/local/share/certs/ca-root-nss.crt" "/opt/local/share/curl/curl-ca-bundle.crt")))
(setq tls-checktrust t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("melpa-kent" . "https://www.mirrorservice.org/sites/melpa.org/packages/"))

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

(use-package gcmh :ensure t)

(require 'gcmh)
(gcmh-mode 1)

(use-package ag :ensure t)
(use-package auctex-latexmk :ensure t)
(use-package auto-virtualenv :ensure t)
(use-package browse-at-remote :ensure t)
(use-package auto-compile :ensure t)
(use-package butler :ensure t)
(use-package cider :ensure t)
(use-package company :ensure t)
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
(use-package helm-descbinds :ensure t)
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
;; (use-package jdee :ensure t)
;; (use-package js-format :ensure t)
(use-package js2-mode :ensure t)
(use-package js2-refactor :ensure t)
(use-package kubernetes :ensure t)
(use-package kubernetes-tramp :ensure t)
(use-package magit :ensure t)
(use-package magit-popup :ensure t)
;; (use-package magit-todos :ensure t)
(use-package forge :ensure t)
(use-package markdown-mode :ensure t)
(use-package multi-web-mode :ensure t)
(use-package nlinum :ensure t)
(use-package org :ensure t)
(use-package paradox :ensure t)
;; (use-package paredit :ensure t)
(use-package pdf-tools :ensure t)
(use-package persistent-scratch :ensure t)
(use-package psc-ide :ensure t)
(use-package psci :ensure t)
(use-package puppet-mode :ensure t)
(use-package purescript-mode :ensure t)
(use-package racket-mode :ensure t)
(use-package rainbow-delimiters :ensure t)
(use-package restart-emacs :ensure t)
(use-package restclient :ensure t)
(use-package rjsx-mode :ensure t)
(use-package rtags :ensure t)
(use-package sage-shell-mode :ensure t)
(use-package sbt-mode
  :ensure t
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

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
(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))
(use-package twittering-mode :ensure t)
(use-package flycheck-ensime :ensure t)
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
(use-package org :ensure t)
(use-package emms :ensure t)
(use-package proof-general :ensure t)
(use-package helpful :ensure t)
(use-package flycheck-inline :ensure t)
(use-package logview :ensure t)
(use-package diredfl :ensure t)
;;(require 'paradox)
;;(paradox-enable)


(require 'magit)
;; (require 'magit-todos)

(load "~/dotfiles/emacs/init_private.el")

(load "~/dotfiles/emacs/custom_commands.el")
(load "~/dotfiles/emacs/auctex_related.el")
(load "~/dotfiles/emacs/package_list.el")

(require 'helm-descbinds)
(helm-descbinds-mode)

(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)


;; (require 'flx-ido)
(ido-mode 0)
(ido-everywhere 0)
(flx-ido-mode 0)

(ace-popup-menu-mode 1)

(require 'smartparens-config)
(elscreen-start)
(require 'helm-config)


;; (add-hook 'after-init-hook 'global-company-mode)

(eval-when-compile
  (require 'use-package))

(setq tramp-default-method "ssh")

(async-bytecomp-package-mode 1)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'auto-revert-mode)

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

;; (require 'framemove)
;; (windmove-default-keybindings)
;; (setq framemove-hook-into-windmove t)

                                        ; Proper line wrapping
(show-paren-mode 1); Matches parentheses and such in every mode

(add-to-list 'default-frame-alist '(height . 59)); Default frame height.

(add-hook 'prog-mode-hook 'nlinum-mode)

(yas-global-mode 0)

;; http://www.emacswiki.org/emacs/WinnerMode
(when (fboundp 'winner-mode)
  (winner-mode 1))

(setq resize-mini-windows t)
;; (setq max-mini-window-height 2)

(require 'eclim)
(setq eclimd-autostart t)

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
 '(auto-revert-remote-files t)
 '(auto-revert-verbose nil)
 '(battery-mode-line-limit 99)
 '(beacon-color "#cc6666")
 '(beacon-mode t)
 '(blink-cursor-blinks 0)
 '(browse-url-browser-function
   (quote
    ((".*.stackexchange.com" . sx-open-link)
     ("stackoverflow.com" . sx-open-link)
     ("." . eww-browse-url))))
 '(byte-compile-warnings nil)
 '(column-number-mode t)
 '(company-backends
   (quote
    (intero-company company-tide company-psc-ide-backend company-bbdb company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
                    (company-dabbrev-code company-gtags company-etags company-keywords)
                    company-oddmuse company-dabbrev)))
 '(company-clang-executable "clang")
 '(company-idle-delay 0.1)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(company-tooltip-idle-delay 0.1)
 '(compilation-always-kill t)
 '(compilation-ask-about-save nil)
 '(compilation-auto-jump-to-first-error nil)
 '(compilation-message-face (quote default))
 '(compilation-scroll-output (quote first-error))
 '(compilation-skip-threshold 2)
 '(coq-compile-before-require t)
 '(coq-compile-parallel-in-background t)
 '(cursor-type t)
 '(custom-enabled-themes (quote (espresso)))
 '(custom-safe-themes
   (quote
    ("1a1cdd9b407ceb299b73e4afd1b63d01bbf2e056ec47a9d95901f4198a0d2428" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(datetime-timezone (quote US/Pacific))
 '(desktop-save t)
 '(desktop-save-mode t)
 '(diredfl-global-mode t nil (diredfl))
 '(display-battery-mode t)
 '(display-time-day-and-date t)
 '(display-time-format nil)
 '(display-time-mode t)
 '(display-time-world-list
   (quote
    (("Europe/Zurich" "Zurich")
     ("America/New_York" "Boston")
     ("America/Chicago" "Chicago")
     ("America/Los_Angeles" "Los Angeles")
     ("US/Hawaii" "Honolulu")
     ("Etc/UTC" "UTC"))))
 '(display-time-world-time-format "%A %d %B %I:%M %p %Z")
 '(doc-view-pdf->png-converter-function (quote doc-view-pdf->png-converter-mupdf))
 '(doc-view-resolution 200)
 '(docker-image-default-sort-key (quote ("Tag")))
 '(eclim-executable "/Users/peter/.p2/pool/plugins/org.eclim_2.8.0/bin/eclim")
 '(eclimd-autostart-with-default-workspace t)
 '(eclimd-executable
   "/Users/peter/eclipse/java-2019-03/Eclipse.app/Contents/Eclipse/eclimd")
 '(eclimd-wait-for-process nil)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(elfeed-feeds
   (quote
    ("http://www.wsj.com/xml/rss/3_7455.xml" "http://www.wsj.com/xml/rss/3_7031.xml" "http://www.wsj.com/xml/rss/3_7014.xml" "http://www.wsj.com/xml/rss/3_7085.xml" "http://www.wsj.com/xml/rss/3_7041.xml" "http://feeds.reuters.com/reuters/topNews" "http://feeds.reuters.com/Reuters/domesticNews" "http://feeds.reuters.com/Reuters/worldNews" "https://news.google.com/news/rss/headlines?ned=us&gl=US&hl=en" "https://news.ycombinator.com/rss" "http://www.thehill.com/rss/syndicator/19110" "http://www.thehill.com/rss/syndicator/19109" "http://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml" "http://rss.slashdot.org/Slashdot/slashdotMain" "http://www.latimes.com/local/rss2.0.xml" "http://feeds.marketwatch.com/marketwatch/topstories/" "http://feeds.marketwatch.com/marketwatch/realtimeheadlines/" "https://thediplomat.com/feed/" "http://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml" "http://rss.nytimes.com/services/xml/rss/nyt/World.xml" "http://rss.nytimes.com/services/xml/rss/nyt/US.xml")))
 '(elfeed-search-filter "@1-week-ago")
 '(emms-stream-default-action "play")
 '(emms-stream-repeat-p t)
 '(ensime-auto-generate-config t)
 '(ensime-company-idle-delay 0.1)
 '(ensime-sbt-perform-on-save "compile")
 '(ensime-typecheck-idle-interval 0.1)
 '(eshell-buffer-maximum-lines 6000)
 '(eshell-history-size 2048)
 '(fci-rule-color "#f1c40f")
 '(fci-rule-width 1)
 '(fill-column 100)
 '(flycheck-buffer-switch-check-intermediate-buffers t)
 '(flycheck-check-syntax-automatically
   (quote
    (save idle-change idle-buffer-switch new-line mode-enabled)))
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(flycheck-display-errors-delay 0.1)
 '(flycheck-hlint-args (quote ("-j")))
 '(flycheck-idle-buffer-switch-delay 0.1)
 '(flycheck-idle-change-delay 0.1)
 '(flycheck-navigation-minimum-level (quote warning))
 '(forge-pull-notifications t)
 '(forge-topic-list-limit (quote (5 . 5)))
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(git-link-use-commit t)
 '(global-company-mode t)
 '(global-display-line-numbers-mode nil)
 '(global-eclim-mode t)
 '(global-git-gutter-mode t)
 '(global-highlight-thing-mode t)
 '(global-hl-todo-mode t)
 '(global-linum-mode nil)
 '(global-nlinum-mode t)
 '(global-visual-line-mode t)
 '(gradle-gradlew-executable "./gradlew")
 '(gradle-mode nil)
 '(gradle-use-gradlew t)
 '(haskell-font-lock-symbols nil)
 '(haskell-tags-on-save t)
 '(hasky-stack-auto-newest-version t)
 '(hasky-stack-auto-target t)
 '(hasky-stack-build-arguments (quote ("--fast")))
 '(helm-ag-insert-at-point (quote ##))
 '(helm-autoresize-mode t)
 '(helm-buffers-fuzzy-matching t)
 '(helm-completion-in-region-fuzzy-match t)
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
 '(helm-projectile-truncate-lines t)
 '(helm-swoop-use-fuzzy-match t)
 '(helm-time-zone-home-location "Los Angeles")
 '(helm-top-command
   "env COLUMNS=%s ps -raxo pid,user,pri,nice,ucomm,tty,start_time,vsz,%%cpu,%%mem,etime")
 '(helm-top-poll-mode t)
 '(highlight-thing-all-visible-buffers-p t)
 '(highlight-thing-case-sensitive-p t)
 '(highlight-thing-exclude-thing-under-point t)
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(ibuffer-default-sorting-mode (quote recency))
 '(imenu-sort-function (quote imenu--sort-by-name))
 '(intero-debug nil)
 '(intero-extra-ghc-options (quote ("-dppr-cols200")))
 '(intero-extra-ghci-options (quote ("-dppr-cols200")))
 '(intero-global-mode nil nil (intero))
 '(intero-pop-to-repl nil)
 '(intero-repl-no-build nil)
 '(intero-repl-no-load t)
 '(intero-stack-executable "stack")
 '(isearch-allow-scroll t)
 '(ispell-dictionary "english")
 '(ispell-local-dictionary-alist nil)
 '(jdee-jdk-registry
   (quote
    (("1.8" . "/Library/Java/JavaVirtualMachines/openjdk8/Contents/Home/"))))
 '(jit-lock-debug-mode nil)
 '(jit-lock-defer-time 0.05)
 '(jit-lock-stealth-nice 0.05)
 '(jit-lock-stealth-verbose nil)
 '(json-reformat:indent-width 2)
 '(json-reformat:pretty-string\? t)
 '(kubernetes-pod-restart-warning-threshold 5)
 '(kubernetes-poll-frequency 100)
 '(kubernetes-redraw-frequency 100)
 '(line-number-display-limit-width 1024)
 '(logview-additional-level-mappings nil)
 '(logview-auto-revert-mode (quote auto-revert-tail-mode))
 '(magit-diff-refine-hunk (quote all))
 '(magit-diff-use-overlays nil)
 '(magit-log-auto-more t)
 '(magit-section-cache-visibility nil)
 '(magithub-api-available-check-frequency 2)
 '(magithub-api-timeout 10)
 '(magithub-issue-issue-filter-functions nil)
 '(menu-bar-mode nil)
 '(message-log-max 4096)
 '(network-security-level (quote high))
 '(nlinum-format "%d ")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-protocol org-w3m)))
 '(package-selected-packages
   (quote
    (gcmh repl-toggle ace-popup-menu font-lock-studio flycheck-gradle gradle-mode flycheck-ensime logview ini-mode forge kubernetes-helm git-commit kubernetes-tramp kubel dired-filter dired-git-info diredfl disk-usage helm-descbinds k8s-mode kubernetes-helm ace-window helm-system-packages rich-minority flx flx-ido flycheck git-gutter git-gutter-fringe git-link git-timemachine haskell-mode hasky-stack helm-ag helm-core helm-elscreen helm-eww helm-flx helm-flycheck helm-flyspell helm-ghc helm-google helm-hoogle helm-make helm-projectile helm-swoop highlight-thing hindent hlint-refactor js2-mode kubernetes kubernetes-tramp magit magit-popup pdf-tools use-package forge ghub helpful flx-isearch flycheck-inline helm-emms emms beacon ansible yaml-mode know-your-http-well all-the-icons iedit yaml-imenu reveal-in-osx-finder highlight-defined suggest racket-mode helm-slime slime slime-company ac-rtags adoc-mode afternoon-theme ag alect-themes ample-theme anti-zenburn-theme apel apiwrap async auctex auctex-latexmk auto-compile auto-package-update auto-virtualenv auto-virtualenvwrapper bind-key birds-of-paradise-plus-theme boron-theme browse-at-remote buffer-move build-status butler cider circe clojure-mode color-identifiers-mode color-theme-actress color-theme-approximate color-theme-buffer-local color-theme-cobalt color-theme-complexity color-theme-dg color-theme-dpaste color-theme-eclipse color-theme-emacs-revert-theme color-theme-github color-theme-gruber-darker color-theme-heroku color-theme-ir-black color-theme-library color-theme-molokai color-theme-monokai color-theme-railscasts color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow color-theme-solarized color-theme-tango color-theme-tangotango color-theme-twilight color-theme-vim-insert-mode color-theme-wombat color-theme-zenburn colormaps company company-c-headers company-coq company-emacs-eclim company-ghc company-irony company-irony-c-headers company-math company-rtags company-shell company-terraform csv-mode ctags ctags-update cyberpunk-theme dash dash-functional deferred docker docker-compose-mode docker-tramp dockerfile-mode eclim edit-indirect elfeed elm-mode elpy elscreen emacsql emacsql-mysql emacsql-psql emacsql-sqlite emojify ensime ereader espresso-theme ess ess-R-data-view ess-R-object-popup fill-column-indicator flycheck-haskell flycheck-irony flycheck-ocaml flycheck-purescript flycheck-scala-sbt fold-this geiser gist git glsl-mode go-autocomplete go-mode golden-ratio hamlet-mode helm helm-spotify-plus helm-tramp hide-comnt highlight-indent-guides hl-todo hlint-refactor-mode idris-mode indium info-colors info-colors intero ipython julia-mode keychain-environment latex-extra latex-math-preview latex-preview-pane let-alist lsp-haskell lsp-mode lsp-typescript lsp-ui lsp-vue magit-gh-pulls magit-gh-pulls maker-mode markdown-mode mmm-mode monokai-theme multi multi-line nix-mode nlinum nlinum-mode noflet nov oauth2 org org-caldav org-pomodoro orgit pcre2el persistent-scratch pg popwin projectile proof-general psci redprl restart-emacs rtags sage-shell-mode sbt-mode seq slack smart-mode-line smartparens sml-mode solarized-theme spinner sublime-themes system-packages tide twittering-mode typescript-mode undo-tree wakatime-mode web-mode)))
 '(paradox-execute-asynchronously nil)
 '(paradox-github-token t)
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(projectile-enable-caching t)
 '(projectile-enable-idle-timer t)
 '(projectile-idle-timer-seconds 30)
 '(projectile-require-project-root t)
 '(projectile-sort-order (quote recently-active))
 '(projectile-tags-backend (quote etags-select))
 '(projectile-tags-command "fast-tags -e -R %s")
 '(projectile-use-git-grep t)
 '(purescript-mode-hook
   (quote
    (turn-on-purescript-indent
     (lambda nil
       (psc-ide-mode)
       (company-mode)
       (flycheck-mode)
       (turn-on-purescript-indentation)))))
 '(rm-blacklist
   (quote
    (" hl-p" " hlt" " wb" " Hi" " h-i-g" " GitGutter" " ElDoc" " Wrap" " Helm" " Intero" " company")))
 '(rm-whitelist nil)
 '(sbt:scroll-to-bottom-on-output t)
 '(scroll-bar-mode nil)
 '(shm-use-hdevtools t)
 '(show-paren-mode t)
 '(show-smartparens-global-mode t)
 '(shr-max-image-proportion 1.0)
 '(slack-buffer-create-on-notify (quote true))
 '(slack-buffer-emojify (quote true))
 '(slack-prefer-current-team (quote true))
 '(slack-room-subscription nil)
 '(slack-typing-visibility (quote never))
 '(smartparens-global-strict-mode nil)
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/extra-filler 0)
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(sml/mode-width (quote full))
 '(sml/shorten-modes t)
 '(sp-base-key-bindings (quote sp))
 '(sp-navigate-reindent-after-up
   (quote
    ((interactive cider-repl-mode clojure-mode clojurec-mode clojurescript-mode clojurex-mode common-lisp-mode emacs-lisp-mode eshell-mode geiser-repl-mode gerbil-mode inf-clojure-mode inferior-emacs-lisp-mode inferior-lisp-mode inferior-scheme-mode lisp-interaction-mode lisp-mode monroe-mode racket-mode racket-repl-mode scheme-interaction-mode scheme-mode slime-repl-mode stumpwm-mode haskell-mode))))
 '(sp-navigate-reindent-after-up-in-string nil)
 '(sp-no-reindent-after-kill-modes
   (quote
    (python-mode coffee-mode asm-mode makefile-gmake-mode haml-mode haskell-mode)))
 '(split-height-threshold 120)
 '(split-width-threshold 120)
 '(symon-mode nil)
 '(symon-monitors
   (quote
    (symon-darwin-memory-monitor symon-darwin-cpu-monitor symon-darwin-network-rx-monitor symon-darwin-network-tx-monitor symon-darwin-battery-monitor)))
 '(symon-sparkline-type (quote boxed))
 '(term-scroll-to-bottom-on-output t)
 '(tool-bar-mode nil)
 '(tramp-persistency-file-name "/Users/peter/.emacs.d/tramp" nil (tramp))
 '(tramp-verbose 6 nil (tramp))
 '(twittering-timer-interval 300)
 '(twittering-use-icon-storage t)
 '(w3m-confirm-leaving-secure-page nil)
 '(wakatime-python-bin nil t)
 '(whitespace-style
   (quote
    (face trailing tabs spaces lines newline empty indentation space-after-tab space-before-tab space-mark tab-mark newline-mark)))
 '(ws-butler-keep-whitespace-before-point nil))


 ;; '(vc-annotate-background "#ecf0f1")
 ;; '(vc-annotate-color-map
 ;;   (quote
 ;;    ((30 . "#e74c3c")
 ;;     (60 . "#c0392b")
 ;;     (90 . "#e67e22")
 ;;     (120 . "#d35400")
 ;;     (150 . "#f1c40f")
 ;;     (180 . "#d98c10")
 ;;     (210 . "#2ecc71")
 ;;     (240 . "#27ae60")
 ;;     (270 . "#1abc9c")
 ;;     (300 . "#16a085")
 ;;     (330 . "#2492db")
 ;;     (360 . "#0a74b9"))))
 ;; '(vc-annotate-very-old-color "#0a74b9")
 ;; '(vc-display-status nil)

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

(global-set-key (kbd "\C-z h") 'helm-elscreen)

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

(add-hook 'yaml-mode-hook #'ws-butler-mode)

;; Optional face for line numbers
;; Face name is `helm-swoop-line-number-face`
(setq helm-swoop-use-line-number-face t)

;; If you prefer fuzzy matching
(setq helm-swoop-use-fuzzy-match t)

;; (setq gc-cons-threshold (eval-when-compile (* 1024 1024 128)))
;; (run-with-idle-timer 2 t (lambda () (garbage-collect)))

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
 '(compilation-error ((t (:inherit error :weight normal))))
 '(compilation-info ((t (:inherit success :weight normal))))
 '(compilation-warning ((t (:inherit warning :weight normal)))))

(setq tags-add-tables nil)
(setq tags-revert-without-query t)


;; (require 'emms-setup)
;; (require 'emms-player-vlc)
;; (emms-standard)
;; (emms-default-players)
;; (setq emms-player-vlc-command-name
;;       "/Applications/VLC.app/Contents/MacOS/VLC")

(require 'flycheck)
(add-hook 'prog-mode-hook #'flycheck-mode)

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

;; (with-eval-after-load 'flycheck
;;   (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

(global-set-key (kbd "C-M-s") #'flx-isearch-forward)
(global-set-key (kbd "C-M-r") #'flx-isearch-backward)


(global-set-key (kbd "M-y") 'helm-show-kill-ring)


(defun htop ()
  (interactive)
  (if (get-buffer "*htop*")
      (switch-to-buffer "*htop*")
    (ansi-term "/bin/bash" "htop")
    (comint-send-string "*htop*" "htop\n")))



;; Note that the built-in `describe-function' includes both functions
;; and macros. `helpful-function' is functions only, so we provide
;; `helpful-callable' as a drop-in replacement.
(global-set-key (kbd "C-h f") #'helpful-callable)

(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)

;; Lookup the current symbol at point. C-c C-d is a common keybinding
;; for this in lisp modes.
(global-set-key (kbd "C-c C-d") #'helpful-at-point)

;; Look up *F*unctions (excludes macros).
;;
;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
;; already links to the manual, if a function is referenced there.
(global-set-key (kbd "C-h F") #'helpful-function)

;; Look up *C*ommands.
;;
;; By default, C-h C is bound to describe `describe-coding-system'. I
;; don't find this very useful, but it's frequently useful to only
;; look at interactive functions.
(global-set-key (kbd "C-h C") #'helpful-command)

(global-set-key "\M-P" 'flycheck-previous-error)
(global-set-key "\M-N" 'flycheck-next-error)
(global-set-key "\M-L" 'flycheck-list-errors)

;; (global-set-key "\M-o" 'ace-window)

(global-set-key "\C-xO" 'other-frame)


(setq warning-minimum-level :emergency)

;; /Users/peter/.emacs.d/tramp



(setq tramp-default-method "ssh")
(define-key global-map (kbd "C-c s") 'helm-tramp)
(add-hook 'helm-tramp-pre-command-hook '(lambda ()
				     (projectile-mode 0)
				     ))
(add-hook 'helm-tramp-quit-hook '(lambda ()
			      (projectile-mode 1)
			      ))



(add-hook 'logview-mode-hook 'auto-revert-tail-mode)
(put 'magit-clean 'disabled nil)

(setq x-wait-for-event-timeout nil)


(add-hook 'after-save-hook 'magit-after-save-refresh-status)
