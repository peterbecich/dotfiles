(require 'package) ;; You might already have this line


(autoload #'tramp-register-crypt-file-name-handler "tramp-crypt")

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))



(setq tls-checktrust t)
(setq network-security-level 'high)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))


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

(if (eq system-type 'gnu/linux)
    (load "~/dotfiles/emacs/init_debian.el")
    )



(use-package ace-popup-menu :ensure t)
(use-package ag :ensure t)
(use-package alect-themes :ensure t)
(use-package ansible :ensure t)
(use-package auto-compile :ensure t)
(use-package browse-at-remote :ensure t)
(use-package cider :ensure t)
(use-package company
  :hook (scala-mode . company-mode)
  :config (setq lsp-completion-provider :capf)
  :ensure t
  )
(use-package company-terraform :ensure t)
(use-package counsel :ensure t)
(use-package counsel-projectile :ensure t)
(use-package csv-mode :ensure t)
(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode)
  )
(use-package darktooth-theme :ensure t)
(use-package dhall-mode :ensure t)
(use-package diff-hl :ensure t)
(use-package diminish :ensure t)
(use-package dired-git-info :ensure t)
(use-package diredfl :ensure t)
(use-package docker :ensure t)
(use-package docker-compose-mode :ensure t)
(use-package dockerfile-mode :ensure t)
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))
(use-package emacsql :ensure t)
(use-package espresso-theme :ensure t)
(use-package ess :ensure t)
(use-package exec-path-from-shell :ensure t)
(use-package eyebrowse :ensure t)
(use-package fill-column-indicator :ensure t)
(use-package flycheck :init (global-flycheck-mode))
(use-package flycheck-haskell :ensure t)
(use-package flycheck-inline :ensure t)
(use-package flycheck-rtags :ensure t)
(use-package fsharp-mode :ensure t)
(use-package git-link :ensure t)
(use-package git-timemachine :ensure t)
(use-package go-mode :ensure t)
(use-package groovy-mode :ensure t :mode "\\.jenkinsfile")
(use-package haskell-mode :ensure t)
(use-package helpful :ensure t)
(use-package highlight-defined :ensure t)
(use-package highlight-indent-guides :ensure t)
(use-package highlight-thing :ensure t)
(use-package hindent :ensure t)
(use-package hlint-refactor :ensure t)
(use-package iedit :ensure t)
(use-package ivy :ensure t)
(use-package julia-mode :ensure t)
(use-package julia-repl :ensure t)
;; (use-package kubernetes :ensure t)
(use-package logview :ensure t)
(use-package lsp-haskell :ensure t)
;; (use-package lsp-java :ensure t)
(use-package lsp-metals)
(use-package lsp-ui :commands lsp-ui-mode)
(use-package magit :ensure t)
(use-package transient :ensure t)
(use-package markdown-mode :ensure t)
(use-package nix-mode :ensure t :mode "\\.nix\\'")
(use-package org :ensure t)
;; (use-package pdf-tools :ensure t)
(use-package persistent-scratch :ensure t)
(use-package protobuf-mode :ensure t)
(use-package puppet-mode :ensure t)
(use-package purescript-mode :ensure t)
(use-package racket-mode :ensure t)
(use-package rainbow-delimiters :ensure t)
(use-package repl-toggle :ensure t)
(use-package restart-emacs :ensure t)
(use-package restclient :ensure t)
(use-package slime :ensure t)
(use-package smartparens :ensure t)
(use-package snakemake-mode :ensure t)
(use-package swift-mode :ensure t)
(use-package swiper :ensure t)
(use-package terraform-mode :ensure t)
(use-package typescript-mode :ensure t)
(use-package uuidgen :ensure t)
(use-package vagrant :ensure)
(use-package vagrant-tramp :ensure t)
(use-package vdiff :ensure t)
(use-package visual-fill-column :ensure t)
(use-package vterm :ensure t)
(use-package web-mode :ensure t)
(use-package websocket :ensure t)
(use-package ws-butler :ensure t)
(use-package xterm-color :ensure t)
(use-package yaml-mode :ensure t)
(use-package rust-mode :ensure t)
(use-package envrc :ensure t
  :after (lsp-mode flycheck)
  :init (envrc-global-mode)
  )

(use-package copilot
  :vc (:url "https://github.com/copilot-emacs/copilot.el"
            :rev :newest
            :branch "main"))

;; (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize))

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


(use-package lsp-nix
  :ensure lsp-mode
  :after (lsp-mode)
  :demand t
  :custom
  (lsp-nix-nil-formatter ["nixfmt"]))

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)


(use-package nix-mode
  :hook (nix-mode . lsp-deferred)
  :ensure t)

;; (add-hook 'prog-mode-hook #'lsp-deferred)



(use-package ag :ensure t)
(use-package alect-themes :ensure t)
(use-package ansible :ensure t)
(use-package auto-virtualenv :ensure t)
(use-package browse-at-remote :ensure t)
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
(use-package espresso-theme :ensure t)
(use-package exec-path-from-shell :ensure t)
(use-package eyebrowse :ensure t)
(use-package fill-column-indicator :ensure t)
(use-package flycheck :ensure t)

(use-package format-all :ensure t)
(use-package git-link :ensure t)
(use-package git-timemachine :ensure t)

(use-package haskell-mode :ensure t)
(use-package helpful :ensure t)
(use-package hlint-refactor :ensure t)
(use-package ivy :ensure t)
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

(use-package gcmh :ensure t)

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
(load "~/dotfiles/emacs/areas/lisp.el")
(load "~/dotfiles/emacs/areas/markdown.el")
(load "~/dotfiles/emacs/areas/org.el")
(load "~/dotfiles/emacs/areas/purescript.el")
(load "~/dotfiles/emacs/areas/python.el")
(load "~/dotfiles/emacs/areas/scala.el")
(load "~/dotfiles/emacs/areas/shell.el")
(load "~/dotfiles/emacs/areas/sql.el")
(load "~/dotfiles/emacs/areas/web.el")
(load "~/dotfiles/emacs/areas/yaml.el")
(load "~/dotfiles/emacs/init_private.el")

(projectile-mode 1)

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
 '(ag-arguments '("--smart-case" "--stats" "-p '~/dotfiles/.agignore'"))
 '(ag-ignore-list '("*.js"))
 '(async-bytecomp-allowed-packages ''(all))
 '(auth-sources '("~/.authinfo.gpg" "~/.authinfo" "~/.netrc"))
 '(auto-package-update-hide-results t)
 '(auto-revert-avoid-polling t)
 '(auto-revert-check-vc-info t)
 '(auto-revert-remote-files t)
 '(auto-revert-verbose nil)
 '(battery-mode-line-limit 99)
 '(bidi-paragraph-direction 'left-to-right)
 '(blink-cursor-blinks 0)
 '(byte-compile-warnings nil)
 '(column-number-mode t)
 '(company-backends
   '(company-bbdb company-semantic company-clang company-cmake company-capf company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords) company-oddmuse company-dabbrev))
 '(connection-local-criteria-alist
   '(((:application tramp) tramp-connection-local-default-system-profile tramp-connection-local-default-shell-profile)
     ((:application eshell) eshell-connection-default-profile)))
 '(counsel-ag-base-command "ag --nocolor --nogroup %s")
 '(counsel-mode t)
 '(counsel-mode-override-describe-bindings t)
 '(counsel-projectile-ag-initial-input '(ivy-thing-at-point))
 '(counsel-projectile-mode t nil (counsel-projectile))
 '(counsel-projectile-rg-initial-input '(ivy-thing-at-point))
 '(counsel-projectile-sort-buffers t)
 '(counsel-projectile-sort-directories t)
 '(counsel-projectile-sort-files t)
 '(counsel-projectile-sort-projects t)
 '(cursor-type t)
 '(custom-enabled-themes '(darktooth))
 '(custom-file "~/dotfiles/emacs/init.el")
 '(datetime-timezone 'US/Pacific)
 '(desktop-load-locked-desktop t)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(dgi-commit-message-format "%cr %s ")
 '(diary-entry-marker 'font-lock-variable-name-face)
 '(diff-hl-draw-borders t)
 '(diff-hl-fringe-bmp-function 'diff-hl-fringe-bmp-from-pos)
 '(diff-hl-side 'left)
 '(dired-async--modeline-mode nil)
 '(dired-async-mode nil)
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
 '(elfeed-search-filter "@1-week-ago")
 '(emms-stream-default-action "play")
 '(emms-stream-repeat-p t)
 '(eshell-buffer-maximum-lines 4096)
 '(explicit-shell-file-name "zsh")
 '(eyebrowse-keymap-prefix "\3")
 '(eyebrowse-mode t)
 '(eyebrowse-mode-line-style 'smart)
 '(eyebrowse-new-workspace t)
 '(eyebrowse-wrap-around t)
 '(fill-column 120)
 '(flycheck-buffer-switch-check-intermediate-buffers t)
 '(flycheck-check-syntax-automatically
   '(save idle-change idle-buffer-switch new-line mode-enabled))
 '(flycheck-checker-error-threshold 3000)
 '(flycheck-checkers
   '(lsp rtags ada-gnat asciidoctor asciidoc awk-gawk bazel-build-buildifier bazel-module-buildifier
         bazel-starlark-buildifier bazel-workspace-buildifier c/c++-clang c/c++-gcc c/c++-cppcheck cfengine
         chef-foodcritic coffee coffee-coffeelint css-csslint css-stylelint cuda-nvcc cwl d-dmd dockerfile-hadolint
         elixir-credo emacs-lisp emacs-lisp-checkdoc ember-template erlang-rebar3 erlang eruby-erubis eruby-ruumba
         fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert go-staticcheck groovy haml
         handlebars haskell-ghc haskell-hlint html-tidy javascript-eslint javascript-jshint javascript-standard
         json-jsonlint json-python-json json-jq jsonnet less less-stylelint llvm-llc lua-luacheck lua
         markdown-markdownlint-cli markdown-mdl nix nix-linter opam perl perl-perlcritic php php-phpmd php-phpcs
         processing proselint protobuf-protoc protobuf-prototool pug puppet-parser puppet-lint python-flake8
         python-pylint python-pycompile python-pyright python-mypy r-lintr racket rpm-rpmlint rst-sphinx rst
         ruby-rubocop ruby-standard ruby-reek ruby-rubylint ruby ruby-jruby rust-cargo rust rust-clippy scala
         scala-scalastyle scheme-chicken scss-lint scss-stylelint sass/scss-sass-lint sass scss sh-bash sh-posix-dash
         sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint systemd-analyze tcl-nagelfar terraform
         terraform-tflint tex-chktex tex-lacheck texinfo textlint typescript-tslint verilog-verilator vhdl-ghdl
         xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby yaml-yamllint))
 '(flycheck-display-errors-delay 0.1)
 '(flycheck-hlint-args '("-j"))
 '(flycheck-idle-buffer-switch-delay 0.1)
 '(flycheck-idle-change-delay 0.1)
 '(flycheck-navigation-minimum-level 'warning)
 '(fringe-mode '(nil . 0) nil (fringe))
 '(git-link-use-commit t)
 '(global-auto-revert-mode t)
 '(global-company-mode t)
 '(global-diff-hl-mode t)
 '(global-display-line-numbers-mode t)
 '(global-emojify-mode nil)
 '(global-git-commit-mode t)
 '(global-git-gutter-mode nil)
 '(global-highlight-thing-mode nil)
 '(global-hl-todo-mode t)
 '(global-linum-mode nil)
 '(global-nlinum-mode nil)
 '(global-so-long-mode nil)
 '(global-visual-line-mode t)
 '(gradle-mode nil)
 '(gradle-use-gradlew t)
 '(grep-command "grep  -h --null -e ")
 '(grep-find-command
   '("find . -type f -exec grep  -nH --null -e  \\{\\} +" . 42))
 '(grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "node_modules" ".yarn" "webpack"))
 '(grep-find-template
   "find <D> <X> -type f <F> -exec grep <C> -nH -P -C 2 --null -e <R> \\{\\} +")
 '(grep-highlight-matches 'auto)
 '(grep-scroll-output t)
 '(groovy-indent-offset 2)
 '(haskell-font-lock-symbols nil)
 '(haskell-stylish-on-save nil)
 '(haskell-tags-on-save nil)
 '(highlight-thing-all-visible-buffers-p t)
 '(highlight-thing-case-sensitive-p t)
 '(highlight-thing-exclude-thing-under-point t)
 '(ibuffer-default-sorting-mode 'recency)
 '(imenu-sort-function 'imenu--sort-by-name)
 '(initial-major-mode 'fundamental-mode)
 '(isearch-allow-scroll t)
 '(ispell-dictionary "english")
 '(ispell-local-dictionary-alist nil)
 '(ivy-initial-inputs-alist nil)
 '(json-reformat:indent-width 2)
 '(json-reformat:pretty-string? t)
 '(large-file-warning-threshold 100000000)
 '(line-number-display-limit-width 1024)
 '(line-number-mode nil)
 '(logview-additional-level-mappings nil)
 '(logview-auto-revert-mode 'auto-revert-tail-mode)
 '(lsp-auto-guess-root t)
 '(lsp-diagnostics-attributes
   '((unnecessary :foreground "dim gray") (deprecated :strike-through t)))
 '(lsp-enable-file-watchers nil)
 '(lsp-enable-imenu t)
 '(lsp-enable-semantic-tokens t)
 '(lsp-haskell-formatting-provider "stylish-haskell")
 '(lsp-imenu-sort-methods '(name))
 '(lsp-lens-enable nil)
 '(lsp-modeline-workspace-status-enable t)
 '(lsp-restart 'ignore)
 '(lsp-sqls-server "~/go/bin/sqls")
 '(lsp-ui-doc-enable nil)
 '(lsp-ui-flycheck-enable t)
 '(lsp-ui-imenu-enable t)
 '(lsp-ui-peek-enable t)
 '(lsp-ui-sideline-enable t)
 '(magit-auto-revert-mode t)
 '(magit-diff-refine-hunk 'all)
 '(magit-diff-use-overlays nil)
 '(magit-fetch-modules-jobs 8 t)
 '(magit-log-auto-more t)
 '(magit-pull-or-fetch t)
 '(magit-refresh-status-buffer nil)
 '(magit-section-cache-visibility nil)
 '(magit-status-show-hashes-in-headers t)
 '(magithub-api-available-check-frequency 2)
 '(magithub-api-timeout 10)
 '(menu-bar-mode nil)
 '(message-log-max 4096)
 '(mode-line-format
   '("%e" (eyebrowse-mode (:eval (eyebrowse-mode-line-indicator))) mode-line-front-space mode-line-mule-info
     mode-line-client mode-line-modified mode-line-remote mode-line-auto-compile mode-line-frame-identification
     mode-line-buffer-identification "   " mode-line-position (vc-mode vc-mode) "  " mode-line-modes mode-line-misc-info
     mode-line-end-spaces))
 '(network-security-level 'high)
 '(ns-antialias-text t)
 '(ns-confirm-quit t)
 '(org-modules
   '(org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-protocol org-w3m))
 '(org-src-block-faces
   '(("emacs-lisp" (:background "#F0FFF0")) ("dot" (:foreground "gray50"))))
 '(package-native-compile t)
 '(package-selected-packages
   '(ace-popup-menu ag alect-themes ansible auto-compile auto-package-update auto-virtualenv browse-at-remote cider
                    company-terraform copilot copilot-chat counsel-projectile csv-mode darktooth-theme dhall-mode
                    diff-hl diminish dired-git-info diredfl docker docker-compose-mode dockerfile-mode emacsql envrc
                    espresso-theme ess exec-path-from-shell eyebrowse fill-column-indicator flycheck-haskell
                    flycheck-inline flycheck-rtags format-all fsharp-mode gcmd gcmh git-link git-timemachine go-mode
                    gptel groovy-mode gruvbox-theme helpful highlight-defined highlight-indent-guides highlight-thing
                    hindent hlint-refactor iedit julia-mode julia-repl logview lsp-haskell lsp-ivy lsp-metals lsp-ui
                    magit mustache-mode nix-mode persistent-scratch protobuf-mode puppet-mode purescript-mode
                    racket-mode rainbow-delimiters repl-toggle restart-emacs restclient rg rust-mode sbt-mode slime
                    smartparens snakemake-mode swift-mode typescript-mode uuidgen vagrant vagrant-tramp vdiff
                    visual-fill-column vterm web-mode websocket ws-butler xterm-color yasnippet))
 '(package-vc-selected-packages
   '((copilot :url "https://github.com/copilot-emacs/copilot.el" :branch "main")))
 '(pdf-view-midnight-colors '("#FDF4C1" . "#282828"))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(proced-auto-update-flag t)
 '(proced-format 'verbose)
 '(projectile-dynamic-mode-line nil)
 '(projectile-enable-caching t)
 '(projectile-enable-idle-timer nil)
 '(projectile-idle-timer-seconds 30)
 '(projectile-mode-line-function '(lambda nil ("")))
 '(projectile-mode-line-prefix " ")
 '(projectile-require-project-root t)
 '(projectile-sort-order 'recently-active)
 '(projectile-tags-backend 'auto)
 '(projectile-tags-command "fast-tags -e -R %s")
 '(projectile-use-git-grep t)
 '(purescript-mode-hook
   '(turn-on-eldoc-mode turn-on-purescript-indent
                        (lambda nil (company-mode) (lsp) (flycheck-mode) (turn-on-purescript-indentation))))
 '(rich-minority-mode t)
 '(ring-bell-function nil)
 '(rm-blacklist
   '(" hl-p" " hlt" " wb" " Hi" " h-i-g" " GitGutter" " ElDoc" " Wrap" " company" " Projectile"))
 '(rm-whitelist nil)
 '(safe-local-variable-values
   '((package-lint-main-file . "copilot-chat.el") (lsp-enabled-clients jsts-ls) (lsp-lens-enable)
     (haskell-process-args-cabal-repl "--ghc-option=-ferror-spans") (lsp-haskell-plugin-stan-global-on)
     (lsp-nix-nil-formatter "nixpkgs-fmt") (eval c-set-offset 'inlambda 0) (eval c-set-offset 'access-label '-)
     (eval c-set-offset 'substatement-open 0) (eval c-set-offset 'arglist-cont-nonempty '+)
     (eval c-set-offset 'arglist-cont 0) (eval c-set-offset 'arglist-intro '+) (eval c-set-offset 'inline-open 0)
     (eval c-set-offset 'defun-open 0) (eval c-set-offset 'innamespace 0) (indicate-empty-lines . t)
     (c-block-comment-prefix . "  ") (eval add-hook 'before-save-hook 'time-stamp)
     (buffer-file-coding-system . utf-8-unix) (TeX-master . t)))
 '(sbt:scroll-to-bottom-on-output t)
 '(scala-indent:default-run-on-strategy 0)
 '(scroll-bar-mode nil)
 '(shm-use-hdevtools t)
 '(show-paren-mode t)
 '(show-smartparens-global-mode t)
 '(shr-max-image-proportion 1.0)
 '(smartparens-global-strict-mode nil)
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
   '(symon-darwin-memory-monitor symon-darwin-cpu-monitor symon-darwin-network-rx-monitor symon-darwin-network-tx-monitor
                                 symon-darwin-battery-monitor))
 '(symon-sparkline-type 'boxed)
 '(tags-revert-without-query t)
 '(term-scroll-to-bottom-on-output t)
 '(tool-bar-mode nil)
 '(typescript-indent-level 2)
 '(vc-annotate-background "#222222")
 '(vc-annotate-color-map
   '((20 . "#fa5151") (40 . "#ea3838") (60 . "#f8ffa0") (80 . "#e8e815") (100 . "#fe8b04") (120 . "#e5c900")
     (140 . "#32cd32") (160 . "#8ce096") (180 . "#7fb07f") (200 . "#3cb370") (220 . "#099709") (240 . "#2fdbde")
     (260 . "#1fb3b3") (280 . "#8cf1f1") (300 . "#94bff3") (320 . "#62b6ea") (340 . "#30a5f5") (360 . "#e353b9")))
 '(vc-annotate-very-old-color "#e353b9")
 '(vdiff-diff-algorithm 'git-diff)
 '(visible-bell nil)
 '(vterm-always-compile-module t)
 '(vterm-min-window-width 60)
 '(wakatime-python-bin nil t)
 '(warning-suppress-types '((direnv) (frameset) (frameset) (comp) (comp) (comp)))
 '(whitespace-style
   '(face trailing tabs spaces lines newline empty indentation space-after-tab space-before-tab space-mark tab-mark
          newline-mark))
 '(world-clock-list
   '(("Europe/Zurich" "Zurich") ("Europe/Madrid" "Madrid") ("Etc/UTC" "UTC") ("America/New_York" "Boston")
     ("America/Chicago" "Chicago") ("US/Arizona" "Phoenix") ("America/Los_Angeles" "Los Angeles")
     ("US/Hawaii" "Honolulu")))
 '(world-clock-time-format "%A %d %B %I:%M %p %Z")
 '(ws-butler-keep-whitespace-before-point nil)
 '(yas-global-mode t))

;; (setq ring-bell-function 'ignore)

;; https://www.masteringemacs.org/article/keeping-secrets-in-emacs-gnupg-auth-sources
(setq epg-gpg-program "gpg2")

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(setq-default line-spacing 0)

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

(add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))

(eyebrowse-mode t)
(eyebrowse-setup-opinionated-keys)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(copilot-chat-spinner-face ((t nil)))
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

(global-set-key (kbd "C-c i") 'counsel-imenu)

(require 'vdiff)
(define-key vdiff-mode-map (kbd "C-.") vdiff-mode-prefix-map)


(add-to-list 'auto-mode-alist '("\\.jenkins\\'" . groovy-mode))




(add-to-list 'auto-mode-alist '("\\.avsc\\'" . js-json-mode))
(add-to-list 'auto-mode-alist '("\\.avro\\'" . js-json-mode))
(put 'magit-clean 'disabled nil)

(envrc-global-mode)

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
