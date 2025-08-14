(require 'package) ;; You might already have this line

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; (setq network-security-level 'high)

;; (setq tls-checktrust t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)


(setq vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))


(setq load-prefer-newer t)

(use-package auto-compile :ensure t)

(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

(setq use-package-always-ensure t)

(if (eq system-type 'darwin)
    (load "~/dotfiles/emacs/init_mac.el")
    )


(use-package lsp-mode
;;   :hook (
;;          (c++-mode . lsp-deferred)
;;          (c-mode . lsp-deferred)
;;          (css-mode . lsp-deferred)
;;          (csharp-mode . lsp-deferred)
;;          (dhall-mode . lsp-deferred)
;;          (dockerfile-mode . lsp-deferred)
;;          (haskell-mode . lsp-deferred)
;;          (java-mode . lsp-deferred)
;;          (js-mode . lsp-deferred)
;;          (json-mode . lsp-deferred)
;;          (latex-mode . lsp-deferred)
;;          (nix-mode . lsp-deferred)
;;          (purescript-mode . lsp-deferred)
;;          (python-mode . lsp-deferred)
;;          (sh-mode . lsp-deferred)
;;          (scala-mode . lsp-deferred)
;;          (typescript-mode . lsp-deferred)
;;          (rust-mode . lsp-deferred)
;;          ;; (ruby-mode . lsp-deferred)
;;          (terraform-mode . lsp-deferred)
;;          ;; (groovy-mode . lsp-deferred)
;;          ;; (yaml-mode . lsp-deferred)
;;          )
  :config
  ;; Uncomment following section if you would like to tune lsp-mode performance according to
  ;; https://emacs-lsp.github.io/lsp-mode/page/performance/
  ;; (setq gc-cons-threshold 100000000) ;; 100mb
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-idle-delay 0.500)
  ;;       (setq lsp-log-io nil)
  ;; (setq lsp-completion-provider :capf)
  ;; (setq lsp-prefer-flymake nil)
  )

(use-package lsp-ui :commands lsp-ui-mode)

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

;; (add-hook 'prog-mode-hook #'lsp-deferred)

;; (add-hook 'json-mode-hook #'lsp-deferred)
;; (add-hook 'yaml-mode-hook #'lsp-deferred)
;; (add-hook 'bash-mode-hook #'lsp-deferred)



;; (use-package ace-popup-menu :ensure t)
;; (use-package add-node-modules-path :ensure t)
(use-package ag :ensure t)
(use-package alect-themes :ensure t)
;; (use-package all-the-icons :ensure t)
(use-package ansible :ensure t)
(use-package auto-virtualenv :ensure t)
(use-package browse-at-remote :ensure t)
;; (use-package butler :ensure t)
;; (use-package cider :ensure t)
;; (use-package company
;;   :config (setq lsp-completion-provider :capf)
;;   :ensure t
;;   )
(use-package company-terraform :ensure t)
(use-package counsel :ensure t)
;; (use-package counsel-projectile :ensure t)
(use-package csv-mode :ensure t)
(use-package darktooth-theme :ensure t)
(use-package dhall-mode :ensure t)
(use-package diff-hl :ensure t)
(use-package diminish :ensure t)
(use-package dired-git-info :ensure t)
(use-package diredfl :ensure t)
(use-package docker :ensure t)
(use-package docker-compose-mode :ensure t)
(use-package dockerfile-mode :ensure t)
;; (use-package editorconfig
;;   :ensure t
;;   :config
;;   (editorconfig-mode 1))
;; (use-package elfeed :ensure t)
(use-package emacsql :ensure t)
;; (use-package emojify :ensure t)
(use-package espresso-theme :ensure t)
;; (use-package ess :ensure t)
(use-package exec-path-from-shell :ensure t)
(use-package eyebrowse :ensure t)
(use-package fill-column-indicator :ensure t)
(use-package flycheck :ensure t)
;; (use-package flycheck-rtags :ensure t)
(use-package format-all :ensure t)
(use-package git-link :ensure t)
(use-package git-timemachine :ensure t)
;;(use-package groovy-mode :ensure t :mode "\\.jenkinsfile")
(use-package haskell-mode :ensure t)
(use-package helpful :ensure t)
(use-package hlint-refactor :ensure t)
(use-package ivy :ensure t)
;; (use-package jenkinsfile-mode :ensure t)
;; (use-package kubernetes :ensure t)
;; (use-package lsp-haskell :ensure t)
;; (use-package lsp-java :ensure t)
(use-package lsp-metals
  :ensure t
  :custom
  (lsp-metals-enable-semantic-highlighting t)
  )
;; (use-package lsp-metals
;;   :ensure t
;;   :custom
;;   ;; You might set metals server options via -J arguments. This might not always work, for instance when
;;   ;; metals is installed using nix. In this case you can use JAVA_TOOL_OPTIONS environment variable.
;;   (lsp-metals-server-args '(;; Metals claims to support range formatting by default but it supports range
;;                             ;; formatting of multiline strings only. You might want to disable it so that
;;                             ;; emacs can use indentation provided by scala-mode.
;;                             "-J-Dmetals.allow-multiline-string-formatting=off"
;;                             ;; Enable unicode icons. But be warned that emacs might not render unicode
;;                             ;; correctly in all cases.
;;                             "-J-Dmetals.icons=unicode"))
;;   ;; In case you want semantic highlighting. This also has to be enabled in lsp-mode using
;;   ;; `lsp-semantic-tokens-enable' variable. Also you might want to disable highlighting of modifiers
;;   ;; setting `lsp-semantic-tokens-apply-modifiers' to `nil' because metals sends `abstract' modifier
;;   ;; which is mapped to `keyword' face.
;;   (lsp-metals-enable-semantic-highlighting t)
;;   ;; :hook (scala-mode . lsp)
;;   )
(use-package magit :ensure t)
(use-package transient :ensure t)
(use-package markdown-mode :ensure t)
(use-package mustache-mode :ensure t)
;; (use-package nix-mode :ensure t :mode "\\.nix\\'")
(use-package rg :ensure t)
(use-package org :ensure t)
;; (use-package pdf-tools :ensure t)
(use-package persistent-scratch :ensure t)
;; (use-package proof-general :ensure t)
(use-package protobuf-mode :ensure t)
;;(use-package puppet-mode :ensure t)
;; (use-package purescript-mode :ensure t)
;; (use-package racket-mode :ensure t)
;; (use-package repl-toggle :ensure t)
(use-package restart-emacs :ensure t)
(use-package restclient :ensure t)
;; (use-package rtags :ensure t)
;; (use-package sage-shell-mode :ensure t)
;; (use-package shakespeare-mode :ensure t)
;; (use-package slime :ensure t)
;; (use-package slime-company :ensure t)
(use-package smartparens :ensure t)
;; (use-package snakemake-mode :ensure t)
;; (use-package swift-mode :ensure t)
(use-package swiper :ensure t)
;; (use-package symon :ensure t)
(use-package terraform-mode :ensure t)
(use-package typescript-mode :ensure t)
;; (use-package uuidgen :ensure t)
;; (use-package vagrant :ensure)
;; (use-package vagrant-tramp :ensure t)
(use-package vdiff :ensure t)
;; (use-package visual-fill-column :ensure t)
(use-package vterm :ensure t)
;; (use-package vue-html-mode :ensure t)
;; (use-package vue-mode :ensure t)
(use-package web-mode :ensure t)
(use-package websocket :ensure t)
(use-package ws-butler :ensure t)
(use-package xterm-color :ensure t)
;; (use-package yaml-imenu :ensure t)
(use-package yaml-mode :ensure t)
(use-package rust-mode :ensure t)
(use-package yasnippet :ensure t)
(use-package scala-mode :ensure t)
(use-package go-mode :ensure t)

(use-package eglot :ensure t)

(use-package tramp :ensure t)


(use-package gptel :ensure t)

;; (use-package tramp :ensure t)
;; (use-package envrc :ensure t)
;; (use-package direnv :ensure t :config (direnv-mode))

;; (load "~/dotfiles/emacs/areas/c.el")
;;(load "~/dotfiles/emacs/areas/csharp.el")
;; (load "~/dotfiles/emacs/areas/epub.el")
(load "~/dotfiles/emacs/areas/git.el")
;; (load "~/dotfiles/emacs/areas/haskell.el")
;; (load "~/dotfiles/emacs/areas/helm.el")
;;(load "~/dotfiles/emacs/areas/irc.el")
(load "~/dotfiles/emacs/areas/java.el")
(load "~/dotfiles/emacs/areas/javascript.el")
(load "~/dotfiles/emacs/areas/json.el")
;; (load "~/dotfiles/emacs/areas/lisp.el")
;; (load "~/dotfiles/emacs/areas/markdown.el")
;; (load "~/dotfiles/emacs/areas/org.el")
;; (load "~/dotfiles/emacs/areas/proof-general.el")
;; (load "~/dotfiles/emacs/areas/purescript.el")
;; (load "~/dotfiles/emacs/areas/python.el")
;; (load "~/dotfiles/emacs/areas/sage.el")
(load "~/dotfiles/emacs/areas/scala.el")
(load "~/dotfiles/emacs/areas/shell.el")
(load "~/dotfiles/emacs/areas/sql.el")
;; (load "~/dotfiles/emacs/areas/twitter.el")
(load "~/dotfiles/emacs/areas/web.el")
(load "~/dotfiles/emacs/areas/yaml.el")
(load "~/dotfiles/emacs/init_private.el")
(load "~/dotfiles/emacs/custom_commands.el")
(load "~/dotfiles/emacs/package_list.el")

(projectile-mode 1)

;; (ace-popup-menu-mode 1)

(eval-when-compile
  (require 'use-package))

;; (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'auto-revert-mode)

;; (setq request-backend 'url-retrieve)

(desktop-save-mode 0)

;; (pdf-tools-install)

(setq dired-listing-switches "-alh")

(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t)
   )

(setq dired-dwim-target t)

(setq emerge-diff-options "--ignore-all-space")

(setq column-number-mode t)


(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(show-paren-mode 1); Matches parentheses and such in every mode

(add-to-list 'default-frame-alist '(height . 59)); Default frame height.

;; http://www.emacswiki.org/emacs/WinnerMode
(when (fboundp 'winner-mode)
  (winner-mode 1))

(setq resize-mini-windows t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#32302F" "#FB4934" "#B8BB26" "#FABD2F" "#83A598" "#D3869B" "#17CCD5" "#EBDBB2"])
 '(auth-sources '("~/.authinfo.gpg" "~/.authinfo" "~/.netrc"))
 '(auto-package-update-hide-results t)
 '(auto-revert-check-vc-info t)
 '(auto-revert-remote-files t)
 '(battery-mode-line-limit 99)
 '(bidi-paragraph-direction 'left-to-right)
 '(blink-cursor-blinks 0)
 '(byte-compile-warnings nil)
 '(column-number-mode t)
 '(company-backends
   '(company-bbdb company-semantic company-clang company-cmake company-capf company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords) company-oddmuse company-dabbrev))
 '(company-clang-executable "clang")
 '(compilation-always-kill t)
 '(compilation-ask-about-save nil)
 '(compilation-auto-jump-to-first-error nil)
 '(compilation-message-face 'default)
 '(compilation-scroll-output 'first-error)
 '(compilation-skip-threshold 2)
 '(confirm-kill-processes nil)
 '(counsel-mode t)
 '(counsel-mode-override-describe-bindings t)
 '(counsel-projectile-mode nil)
 '(cursor-type t)
 '(custom-enabled-themes '(wombat))
 '(custom-file "~/dotfiles/emacs/init.el")
 '(custom-safe-themes
   '("c23446c6dd105f7eda80655f500e8554d701c7729867a1ad578c211b47a25482"
     "d5fd482fcb0fe42e849caba275a01d4925e422963d1cd165565b31d3f4189c87"
     "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d"
     "b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d"
     "5aedf993c7220cbbe66a410334239521d8ba91e1815f6ebde59cecc2355d7757"
     "0517759e6b71f4ad76d8d38b69c51a5c2f7196675d202e3c2507124980c3c2a3"
     "b5fab52f16546a15f171e6bd450ff11f2a9e20e5ac7ec10fa38a14bb0c67b9ab"
     "e266d44fa3b75406394b979a3addc9b7f202348099cfde69e74ee6432f781336"
     "8dbbcb2b7ea7e7466ef575b60a92078359ac260c91fe908685b3983ab8e20e3f"
     "0489e00d609dd8d3262d03e2c72b1da0a040c25806c230c6602005be1db01e46"
     "2d70bca08b194d0becf19a1df2c54fcb78daeeebc880042de47c735a5c837af0"
     "bfd5296f0c37dc9a52a0416f1d3c380ac381c1da112d061ceb784d0ed51d6587"
     "07885feecd236e4ba3837e7ff15753d47694e1f9a8049400c114b3298285534e"
     "046a2b81d13afddae309930ef85d458c4f5d278a69448e5a5261a5c78598e012"
     "98ef36d4487bf5e816f89b1b1240d45755ec382c7029302f36ca6626faf44bbd"
     "ba323a013c25b355eb9a0550541573d535831c557674c8d59b9ac6aa720c21d3"
     "d824f0976625bb3bb38d3f6dd10b017bdb4612f27102545a188deef0d88b0cd9"
     "5eed5311ae09ed84cb2e4bf2f033eb4df27e7846a68e4ea3ab8d28f6b017e44a"
     "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58"
     "d2e0c53dbc47b35815315fae5f352afd2c56fa8e69752090990563200daae434"
     "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64"
     "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481"
     "0feb7052df6cfc1733c1087d3876c26c66410e5f1337b039be44cb406b6187c6"
     "eb3ef63dc31fbebb37df3646fbc1e07f25159d19bb1cade2a80000a2764690de"
     "d94a55a07623ee474ddb4a0a5dca9a250ea4dcebe554249ce305560c3340ec57"
     "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb"
     "e1d09f1b2afc2fed6feb1d672be5ec6ae61f84e058cb757689edb669be926896"
     "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa"
     "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a"
     "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223"
     "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa"
     "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6"
     "1a1cdd9b407ceb299b73e4afd1b63d01bbf2e056ec47a9d95901f4198a0d2428"
     "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(datetime-timezone 'US/Pacific)
 '(desktop-load-locked-desktop t)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(dgi-commit-message-format "%cr %s ")
 '(diary-entry-marker 'font-lock-variable-name-face)
 '(diff-hl-draw-borders t)
 '(diff-hl-fringe-bmp-function 'diff-hl-fringe-bmp-from-pos)
 '(diff-hl-side 'left)
 '(diredfl-global-mode t nil (diredfl))
 '(display-battery-mode t)
 '(display-line-numbers-grow-only t)
 '(display-time-day-and-date nil)
 '(display-time-default-load-average nil)
 '(display-time-format nil)
 '(display-time-mode nil)
 '(doc-view-pdf->png-converter-function 'doc-view-pdf->png-converter-mupdf)
 '(doc-view-resolution 200)
 '(docker-image-default-sort-key '("Tag"))
 '(ediff-split-window-function 'split-window-horizontally)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(eglot-autoreconnect t)
 '(eglot-autoshutdown t)
 '(eglot-events-buffer-config '(:size 0 :format full))
 '(emms-mode-line-icon-color "#1fb3b3" t)
 '(emms-stream-default-action "play")
 '(emms-stream-repeat-p t)
 '(envrc-global-mode nil)
 '(eshell-buffer-maximum-lines 4096)
 '(explicit-shell-file-name "zsh")
 '(eyebrowse-keymap-prefix "\3")
 '(eyebrowse-mode t)
 '(eyebrowse-mode-line-style 'smart)
 '(eyebrowse-new-workspace t)
 '(eyebrowse-wrap-around t)
 '(fci-rule-color "#222222")
 '(fill-column 120)
 '(fringe-mode '(nil . 0) nil (fringe))
 '(git-link-use-commit nil)
 '(global-auto-revert-mode t)
 '(global-company-mode t)
 '(global-completion-preview-mode t)
 '(global-diff-hl-mode t)
 '(global-display-line-numbers-mode t)
 '(global-git-commit-mode t)
 '(global-git-gutter-mode nil)
 '(global-highlight-thing-mode nil)
 '(global-hl-todo-mode t)
 '(global-so-long-mode t)
 '(global-visual-line-mode t)
 '(gnus-logo-colors '("#528d8d" "#c0c0c0") t)
 '(gnus-mode-line-image-cache
   '(image :type xpm :ascent center :data
           "/* XPM */\12static char *gnus-pointer[] = {\12/* width height num_colors chars_per_pixel */\12\"    18    13        2            1\",\12/* colors */\12\". c #1fb3b3\",\12\"# c None s None\",\12/* pixels */\12\"##################\",\12\"######..##..######\",\12\"#####........#####\",\12\"#.##.##..##...####\",\12\"#...####.###...##.\",\12\"#..###.######.....\",\12\"#####.########...#\",\12\"###########.######\",\12\"####.###.#..######\",\12\"######..###.######\",\12\"###....####.######\",\12\"###..######.######\",\12\"###########.######\" };") t)
 '(gptel-default-mode 'org-mode)
 '(gptel-org-branching-context t)
 '(gradle-gradlew-executable "./gradlew")
 '(gradle-mode nil)
 '(gradle-use-gradlew t)
 '(grep-command "grep  -h --null -e ")
 '(grep-highlight-matches 'auto)
 '(grep-scroll-output t)
 '(groovy-indent-offset 2)
 '(haskell-font-lock-symbols nil)
 '(haskell-stylish-on-save nil)
 '(haskell-tags-on-save nil)
 '(highlight-symbol-colors
   '("#FFF68F" "#B7EB8F" "#76DDBA" "#91D5FF" "#ADC6FF" "#D3ADF7" "#FFADD2" "#FFA39E" "#FFD591"))
 '(ibuffer-default-sorting-mode 'recency)
 '(imenu-sort-function 'imenu--sort-by-name)
 '(initial-major-mode 'fundamental-mode)
 '(isearch-allow-scroll t)
 '(ispell-dictionary "english")
 '(ispell-local-dictionary-alist nil)
 '(ivy-initial-inputs-alist nil)
 '(jdee-jdk-registry
   '(("1.8" . "/Library/Java/JavaVirtualMachines/openjdk8/Contents/Home/")))
 '(json-reformat:indent-width 2)
 '(json-reformat:pretty-string? t)
 '(large-file-warning-threshold 100000000)
 '(line-number-display-limit-width 1024)
 '(line-number-mode nil)
 '(logview-additional-level-mappings nil)
 '(logview-auto-revert-mode 'auto-revert-tail-mode)
 '(lsp-auto-guess-root t)
 '(lsp-auto-select-workspace nil)
 '(lsp-disabled-clients '(vue-semantic-server-tramp))
 '(lsp-enable-file-watchers nil)
 '(lsp-keep-workspace-alive nil)
 '(lsp-log-io t)
 '(lsp-metals-ammonite-jvm-properties ["-Xmx12g" "-Xms1g"])
 '(lsp-metals-bloop-sbt-already-installed t)
 '(lsp-metals-enable-semantic-highlighting t)
 '(lsp-metals-install-scala-version "2.12")
 '(lsp-metals-show-inferred-type t)
 '(lsp-restart 'auto-restart)
 '(lsp-ruby-lsp-use-bundler nil)
 '(lsp-semgrep-metrics-enabled nil)
 '(magit-auto-revert-mode t)
 '(magit-diff-refine-hunk 'all)
 '(magit-diff-use-overlays nil)
 '(magit-fetch-modules-jobs 8 t)
 '(magit-log-auto-more t)
 '(magit-pull-or-fetch t)
 '(magit-refresh-status-buffer t)
 '(magit-section-cache-visibility nil)
 '(magit-status-show-hashes-in-headers t)
 '(magithub-api-available-check-frequency 2)
 '(magithub-api-timeout 10)
 '(max-lisp-eval-depth 5000)
 '(menu-bar-mode nil)
 '(message-log-max 4096)
 '(mode-line-format
   '("%e" (eyebrowse-mode (:eval (eyebrowse-mode-line-indicator))) mode-line-front-space mode-line-mule-info
     mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification
     "   " mode-line-position (vc-mode vc-mode) "  " mode-line-modes mode-line-misc-info mode-line-end-spaces))
 '(network-security-level 'high)
 '(ns-antialias-text t)
 '(ns-confirm-quit t)
 '(org-format-latex-options
   '(:foreground default :background default :scale 2.0 :html-foreground "Black" :html-background "Transparent" :html-scale
                 1.0 :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-hide-emphasis-markers nil)
 '(org-imenu-depth 6)
 '(package-native-compile t)
 '(package-selected-packages nil)
 '(pdf-view-midnight-colors '("#FDF4C1" . "#282828"))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(proced-auto-update-flag t)
 '(projectile-completion-system 'ivy)
 '(projectile-mode t nil (projectile))
 '(projectile-require-project-root t)
 '(projectile-sort-order 'recently-active)
 '(projectile-tags-command "echo foo")
 '(recentf-auto-cleanup 300)
 '(recentf-keep '(recentf-keep-default-predicate file-remote-p))
 '(remote-file-name-access-timeout 10)
 '(rich-minority-mode t)
 '(ring-bell-function nil)
 '(rm-blacklist
   '(" hl-p" " hlt" " wb" " Hi" " h-i-g" " GitGutter" " ElDoc" " Wrap" " company" " Projectile"))
 '(rm-whitelist nil)
 '(ruby-flymake-use-rubocop-if-available t)
 '(safe-local-variable-values
   '((eval c-set-offset 'inlambda 0) (eval c-set-offset 'access-label '-) (eval c-set-offset 'substatement-open 0)
     (eval c-set-offset 'arglist-cont-nonempty '+) (eval c-set-offset 'arglist-cont 0)
     (eval c-set-offset 'arglist-intro '+) (eval c-set-offset 'inline-open 0) (eval c-set-offset 'defun-open 0)
     (eval c-set-offset 'innamespace 0) (indicate-empty-lines . t) (c-block-comment-prefix . "  ")
     (eval add-hook 'before-save-hook 'time-stamp) (buffer-file-coding-system . utf-8-unix) (TeX-master . t)))
 '(sbt:scroll-to-bottom-on-output t)
 '(scroll-bar-mode nil)
 '(shm-use-hdevtools t)
 '(show-paren-mode t)
 '(show-smartparens-global-mode t)
 '(shr-max-image-proportion 1.0)
 '(smartparens-global-strict-mode nil)
 '(sml/extra-filler 0)
 '(sml/mode-width 'full)
 '(sml/shorten-modes t)
 '(sml/theme 'respectful)
 '(sp-base-key-bindings 'sp)
 '(sp-navigate-reindent-after-up
   '((interactive cider-repl-mode clojure-mode clojurec-mode clojurescript-mode clojurex-mode common-lisp-mode
                  emacs-lisp-mode eshell-mode geiser-repl-mode gerbil-mode inf-clojure-mode inferior-emacs-lisp-mode
                  inferior-lisp-mode inferior-scheme-mode lisp-interaction-mode lisp-mode monroe-mode racket-mode
                  racket-repl-mode scheme-interaction-mode scheme-mode slime-repl-mode stumpwm-mode haskell-mode)))
 '(sp-navigate-reindent-after-up-in-string nil)
 '(sp-no-reindent-after-kill-modes
   '(python-mode coffee-mode asm-mode makefile-gmake-mode haml-mode haskell-mode))
 '(split-height-threshold 120)
 '(split-width-threshold 120)
 '(symon-mode nil)
 '(symon-monitors
   '(symon-darwin-memory-monitor symon-darwin-cpu-monitor symon-darwin-network-rx-monitor symon-darwin-network-tx-monitor symon-darwin-battery-monitor))
 '(symon-sparkline-type 'boxed)
 '(tags-revert-without-query t)
 '(term-scroll-to-bottom-on-output t)
 '(tool-bar-mode nil)
 '(tramp-use-connection-share t)
 '(twittering-timer-interval 300)
 '(twittering-use-icon-storage t)
 '(typescript-indent-level 2)
 '(vc-annotate-background "#222222")
 '(vc-annotate-color-map
   '((20 . "#fa5151") (40 . "#ea3838") (60 . "#f8ffa0") (80 . "#e8e815") (100 . "#fe8b04") (120 . "#e5c900")
     (140 . "#32cd32") (160 . "#8ce096") (180 . "#7fb07f") (200 . "#3cb370") (220 . "#099709") (240 . "#2fdbde")
     (260 . "#1fb3b3") (280 . "#8cf1f1") (300 . "#94bff3") (320 . "#62b6ea") (340 . "#30a5f5") (360 . "#e353b9")))
 '(vc-annotate-very-old-color "#e353b9")
 '(vc-handled-backends '(Git))
 '(vdiff-diff-algorithm 'git-diff)
 '(visible-bell nil)
 '(vterm-always-compile-module t)
 '(vterm-min-window-width 60)
 '(vterm-tramp-shells '(("docker" "/usr/bin/zsh") ("ssh" "/usr/bin/zsh")))
 '(w3m-confirm-leaving-secure-page nil)
 '(wakatime-python-bin nil t)
 '(whitespace-style
   '(face trailing tabs spaces lines newline empty indentation space-after-tab space-before-tab space-mark tab-mark
          newline-mark))
 '(world-clock-list
   '(("Europe/Zurich" "Zurich") ("Europe/Madrid" "Madrid") ("Etc/UTC" "UTC") ("America/New_York" "Boston")
     ("America/Chicago" "Chicago") ("US/Arizona" "Phoenix") ("America/Los_Angeles" "Los Angeles")
     ("US/Hawaii" "Honolulu")))
 '(world-clock-time-format "%A %d %B %I:%M %p %Z")
 '(ws-butler-keep-whitespace-before-point nil)
 '(xref-search-program 'ripgrep)
 '(yas-global-mode nil))

;; (setq ring-bell-function 'ignore)

;; https://www.masteringemacs.org/article/keeping-secrets-in-emacs-gnupg-auth-sources
(setq epg-gpg-program "gpg2")

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(setq-default line-spacing 0)

(setq docker-arguments nil)

(define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)

(global-set-key (kbd "\C-c l") 'git-link)

(global-set-key (kbd "\C-x r h") 'git-gutter:revert-hunk)

(setq-default indent-tabs-mode nil)

(setq global-whitespace-cleanup-mode t)
(require 'ws-butler)
(add-hook 'prog-mode-hook #'ws-butler-mode)

(add-hook 'yaml-mode-hook #'ws-butler-mode)

;; (setq-default gc-cons-threshold (eval-when-compile (* 1024 1024 32)))
;; (setq garbage-collection-messages nil)
;; (run-with-idle-timer 10 t (lambda () (garbage-collect)))

;; (setq garbage-collection-messages nil)

(setq auto-window-vscroll nil)

(global-set-key (kbd "<kp-2>") 'end-of-defun)
(global-set-key (kbd "<kp-8>") 'beginning-of-defun)

(persistent-scratch-setup-default)

(add-to-list 'auto-mode-alist (cons "\\.asciidoc\\'" 'adoc-mode))

;; (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;; (add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)

(setq tags-add-tables nil)

;; (require 'flycheck)
;; (add-hook 'prog-mode-hook #'flycheck-mode)
;; (add-hook 'prog-mode-hook #'flymake-mode)

;; (add-hook 'eglot-server-initialized-hook (lambda (server) (run-at-time 1 nil (lambda() (mmm-parse-buffer)))))
;; (add-hook 'prog-mode-hook 'eglot-ensure)

;; (add-hook 'json-mode-hook 'eglot-ensure)
;; (add-hook 'yaml-mode-hook 'eglot-ensure)
;; (add-hook 'bash-mode-hook 'eglot-ensure)

;; (breadcrumb-mode)

;; (add-hook 'prog-mode-hook 'breadcrumb-mode)

;; (add-hook 'json-mode-hook 'breadcrumb-mode)
;; (add-hook 'yaml-mode-hook 'breadcrumb-mode)
;; (add-hook 'bash-mode-hook 'breadcrumb-mode)


;; (with-eval-after-load 'flycheck
;;   (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

;; (add-hook 'prog-mode-hook #'display-line-numbers-mode)
;; (add-hook 'text-mode-hook #'display-line-numbers-mode)

;; (add-hook 'prog-mode-hook #'line-number-mode)
;; (add-hook 'text-mode-hook #'line-number-mode)

;; (global-set-key (kbd "C-M-s") #'flx-isearch-forward)
;; (global-set-key (kbd "C-M-r") #'flx-isearch-backward)


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

(global-set-key "\C-xO" 'other-frame)

;; (setq x-wait-for-event-timeout nil)

(add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))

(eyebrowse-mode t)
(eyebrowse-setup-opinionated-keys)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-hl-change ((t (:inherit diff-changed :background "#EBDBB2"))))
 '(diff-hl-delete ((t (:inherit diff-removed :background "#FB4934"))))
 '(diff-hl-insert ((t (:inherit diff-added :background "#B8BB26"))))
 '(eyebrowse-mode-line-active ((t (:inverse-video t :weight bold)))))

(add-to-list 'auto-mode-alist '("\\.out\\'" . logview-mode))

(diminish 'smartparens-mode)
(diminish 'auto-revert-mode)
(diminish 'counsel-mode)
(diminish 'ivy-mode)
(diminish 'highlight-indent-guides-mode)
(diminish 'highlight-thing-mode)
(diminish 'yas-global-mode)
(diminish 'ws-butler-mode)
(diminish 'eldoc-mode)
(diminish 'yas-minor-mode)
(diminish 'company-mode)
(diminish 'projectile-mode)
(diminish 'editorconfig-mode)
(diminish 'visual-line-mode)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
;; (setq enable-recursive-minibuffers t)
;; ;; enable this if you want `swiper' to use it
(setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key "\M-s" 'swiper-isearch-thing-at-point)
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;; (global-set-key (kbd "<f6>") 'ivy-resume)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c k") 'counsel-ag)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(global-set-key (kbd "C-c i") 'counsel-imenu)

(require 'vdiff)
(define-key vdiff-mode-map (kbd "C-.") vdiff-mode-prefix-map)


(add-to-list 'auto-mode-alist '("\\.jenkins\\'" . groovy-mode))




(add-to-list 'auto-mode-alist '("\\.avsc\\'" . js-json-mode))
(add-to-list 'auto-mode-alist '("\\.avro\\'" . js-json-mode))
(put 'magit-clean 'disabled nil)


(setq lsp-semgrep-languages nil)

(advice-add 'lsp :before (lambda (&rest _args) (eval '(setf (lsp-session-server-id->folders (lsp-session)) (ht)))))


(gcmh-mode 1)

(unless (version< emacs-version "27.0")
  (add-function :after after-focus-change-function
                (lambda ()
                  (unless (frame-focus-state)
                    (garbage-collect)))))

(rg-enable-menu)

(setq lsp-copilot-enabled nil)


;; (customize-set-variable 'tramp-use-ssh-controlmaster-options nil)

(setq remote-file-name-inhibit-locks t
      tramp-use-scp-direct-remote-copying t
      remote-file-name-inhibit-auto-save-visited t)

(setq tramp-copy-size-limit (* 1024 1024) ;; 1MB
      tramp-verbose 2)

(connection-local-set-profile-variables
 'remote-direct-async-process
 '((tramp-direct-async-process . t)))

(connection-local-set-profiles
 '(:application tramp :protocol "scp")
 'remote-direct-async-process)

(setq magit-tramp-pipe-stty-settings 'pty)

(with-eval-after-load 'tramp
  (with-eval-after-load 'compile
    (remove-hook 'compilation-mode-hook #'tramp-compile-disable-ssh-controlmaster-options)))

;; don't show the diff by default in the commit buffer. Use `C-c C-d' to display it
(setq magit-commit-show-diff nil)
;; don't show git variables in magit branch
(setq magit-branch-direct-configure nil)
;; don't automatically refresh the status buffer after running a git command
(setq magit-refresh-status-buffer nil)


(gptel-make-gh-copilot "Copilot")
;; OPTIONAL configuration
(setq gptel-model 'gpt-4.1 ;;'claude-3.7-sonnet
      gptel-backend (gptel-make-gh-copilot "Copilot"))

;; (let ((major-mode 'org-mode))
;;   (org-latex-preview))


;; (defun my/gptel-org-latex-preview (_response)
;;   "Run `org-latex-preview' after a GPTEL response."
;;   (when (derived-mode-p 'org-mode)
;;     (org-latex-preview '(16)))) ; '(16) refreshes all equations for safety

;; (add-hook 'gptel-post-response-functions #'my/gptel-org-latex-preview)

;; (add-hook 'gptel-post-response-functions ('org-latex-preview ()))


(defun my/gptel-org-latex-preview (beg end)
  "Preview LaTeX fragments after GPTel response in org-mode."
  (when (derived-mode-p 'org-mode)
    (org-latex-preview '16)))  ;; 16 = preview whole buffer
    ;;(org-latex-preview (list 1 beg end))))  ;; 16 = preview whole buffer

(add-hook 'gptel-post-response-functions #'my/gptel-org-latex-preview)
(setq org-preview-latex-default-process 'dvisvgm) ;No blur when scaling



;; (setq org-preview-latex-default-process 'convert) ;No blur when scaling
;; (setq org-latex-create-formula-image-program 'imagemagick)

;; (setq org-latex-create-formula-image-program 'imagemagick)

;; (add-to-list 'org-preview-latex-process-alist
;; 	     '(tectonic :programs ("tectonic" "magick")
;; 			:description "pdf > png"
;; 			:message "you need install the programs: tectonic and imagemagick."
;; 			:image-input-type "pdf"
;; 			:image-output-type "png"
;; 			:image-size-adjust (1.0 . 1.0)
;; 			:latex-compiler
;; 			("tectonic -Z shell-escape-cwd=%o --outfmt pdf --outdir %o %f")
;; 			:image-converter
;; 			("magick -density %D -trim -antialias %f -quality 300 %O")))
;; (setq org-preview-latex-default-process 'tectonic)

(setf (alist-get 'org-mode gptel-prompt-prefix-alist) "@user\n")
(setf (alist-get 'org-mode gptel-response-prefix-alist) "@assistant\n")
