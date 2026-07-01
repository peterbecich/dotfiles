;;; init.el --- Emacs startup configuration -*- lexical-binding: t; -*-

(setq network-security-level 'high)
(setq package-enable-at-startup nil
      package-native-compile nil
      native-comp-jit-compilation nil
      straight-disable-native-compile t)
(with-suppressed-warnings ((obsolete native-comp-deferred-compilation))
  (setq native-comp-deferred-compilation nil))
(setq tls-checktrust t)


(autoload #'tramp-register-crypt-file-name-handler "tramp-crypt")


(defvar my/emacs-config-directory
  (file-name-directory (or load-file-name buffer-file-name user-emacs-directory))
  "Directory containing this Emacs configuration.")

(defun my/config-file (path)
  "Return PATH expanded inside `my/emacs-config-directory'."
  (expand-file-name path my/emacs-config-directory))

(defun my/load-config-file (path &optional noerror)
  "Load PATH from `my/emacs-config-directory'."
  (load (my/config-file path) noerror 'nomessage))

(setq custom-file (my/config-file "custom.el"))

;; Bootstrap straight.el before `use-package' so explicit :straight recipes work.
(setq straight-check-for-modifications '(check-on-save find-when-checking)
      straight-vc-git-default-clone-depth 1)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir) user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(setq straight-use-package-by-default t)
(straight-use-package 'use-package)
(require 'use-package)

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure nil
      load-prefer-newer t)

;; Subprocess-heavy packages (LSP servers, shells, TRAMP, ripgrep, GPTel) are
;; where Emacs gets most of its useful parallelism.
(setenv "LSP_USE_PLISTS" "true")
(setq lsp-use-plists t
      read-process-output-max (* 4 1024 1024)
      process-adaptive-read-buffering nil
      async-shell-command-buffer 'new-buffer
      async-shell-command-display-buffer nil
      async-shell-command-width 200
      auto-revert-remote-files nil
      auto-revert-use-notify t)

;; (use-package auto-compile
;;   :demand t
;;   :custom
;;   (auto-compile-native-compile t)
;;   :config
;;   (auto-compile-on-load-mode)
;;   (auto-compile-on-save-mode))

(use-package async)


(if (eq system-type 'gnu/linux)
    (load "~/dotfiles/emacs/init_debian.el")
    )

(when (eq system-type 'darwin)
  (load "~/dotfiles/emacs/init_mac.el"))



(use-package compat)
(use-package transient)
(use-package tramp)
(defvar tramp-remote-path '(tramp-default-remote-path)
  "Remote PATH entries for TRAMP, set early so private config can extend it lazily.")

(use-package ace-popup-menu :commands ace-popup-menu-mode)
(use-package ag :commands (ag ag-project ag-regexp ag-project-regexp))
(use-package alect-themes)
;; (use-package ansible)
(use-package auto-virtualenv)
(use-package browse-at-remote :commands browse-at-remote)
(use-package cider)
(use-package company
  :demand t
  :hook (scala-mode . company-mode)
  :custom
  (lsp-completion-provider :capf)
  :config
  (global-company-mode 1))
(use-package company-terraform :after (company terraform-mode))
(use-package counsel
  :demand t
  :bind (("C-c i" . counsel-imenu))
  :init
  (setq counsel-ag-base-command "ag --nocolor --nogroup %s"
        counsel-mode-override-describe-bindings t)
  :config
  (counsel-mode 1))
(use-package counsel-projectile
  :demand t
  :init
  (setq counsel-projectile-ag-initial-input '(ivy-thing-at-point)
        counsel-projectile-rg-initial-input '(ivy-thing-at-point)
        counsel-projectile-sort-buffers t
        counsel-projectile-sort-directories t
        counsel-projectile-sort-files t
        counsel-projectile-sort-projects t)
  :config
  (counsel-projectile-mode +1))
(use-package csv-mode)
(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))
(use-package darktooth-theme)
(use-package dhall-mode)
(use-package diff-hl
  :demand t
  :custom
  (diff-hl-update-async t)
  :config
  (global-diff-hl-mode 1))

(defun my/diminish-modes ()
  "Hide noisy minor modes from the mode line."
  (dolist (mode '(smartparens-mode
                  auto-revert-mode
                  counsel-mode
                  ivy-mode
                  highlight-indent-guides-mode
                  highlight-thing-mode
                  yas-global-mode
                  ws-butler-mode
                  eldoc-mode
                  yas-minor-mode
                  company-mode
                  projectile-mode
                  editorconfig-mode
                  visual-line-mode))
    (ignore-errors
      (diminish mode))))

(use-package diminish
  :demand t
  :config
  (my/diminish-modes))
(use-package dired-git-info :commands dired-git-info-mode)
(use-package diredfl
  :demand t
  :config
  (diredfl-global-mode 1))
(use-package docker :commands docker)
(use-package docker-compose-mode)
(use-package dockerfile-mode)
(use-package editorconfig
  :demand t
  :config
  (editorconfig-mode 1))
(use-package emacsql)
(use-package espresso-theme)
(use-package ess)
(use-package exec-path-from-shell)
(use-package eyebrowse
  :demand t
  :config
  (defvar my/eyebrowse-mode-line-segment
    '(eyebrowse-mode
      (:eval
       (let ((indicator (eyebrowse-mode-line-indicator)))
         (if (string= indicator "")
             ""
           (concat indicator " ")))))
    "Left-side mode-line segment for `eyebrowse-mode'.")

  (defun my/eyebrowse-move-mode-line-left (&rest _)
    "Move the eyebrowse indicator to the left side of the mode line."
    (setq mode-line-misc-info
          (remove '(eyebrowse-mode (:eval (eyebrowse-mode-line-indicator)))
                  mode-line-misc-info))
    (setq-default mode-line-format
                  (let ((format (remove my/eyebrowse-mode-line-segment
                                        (default-value 'mode-line-format))))
                    (if (equal (car format) "%e")
                        (cons "%e" (cons my/eyebrowse-mode-line-segment
                                         (cdr format)))
                      (cons my/eyebrowse-mode-line-segment format))))
    (force-mode-line-update t))

  (advice-add 'eyebrowse-mode :after #'my/eyebrowse-move-mode-line-left)
  (my/eyebrowse-move-mode-line-left)
  (eyebrowse-setup-opinionated-keys)
  (eyebrowse-mode 1))
(use-package fill-column-indicator :commands fci-mode)
(use-package flycheck
  :commands flycheck-mode
  :hook (prog-mode . flycheck-mode))
(use-package flycheck-haskell :after (flycheck haskell-mode))
(use-package flycheck-inline :after flycheck)
(use-package flycheck-rtags :after flycheck)
(use-package fsharp-mode)
(use-package git-link :commands git-link)
(use-package git-timemachine :commands git-timemachine)
(use-package go-mode)
(use-package groovy-mode :mode "\\.jenkinsfile")
(use-package haskell-mode)
(use-package helpful
  :commands (helpful-callable helpful-variable helpful-key helpful-at-point helpful-function helpful-command)
  :bind (("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)
         ("C-c C-d" . helpful-at-point)
         ("C-h F" . helpful-function)
         ("C-h C" . helpful-command)))
(use-package highlight-defined :hook (emacs-lisp-mode . highlight-defined-mode))
(use-package highlight-indent-guides
  :init
  (setq highlight-indent-guides-suppress-auto-error t))
(use-package highlight-thing)
(use-package hindent :after haskell-mode)
(use-package hlint-refactor :after haskell-mode)
(use-package iedit :commands iedit-mode)
(use-package ivy
  :demand t
  :custom
  (ivy-use-virtual-buffers 'recentf)
  :config
  (ivy-mode 1))
(use-package julia-mode)
(use-package julia-repl :after julia-mode)
;; (use-package kubernetes :ensure t)
(use-package logview)
(use-package lsp-haskell :after lsp-mode)
;; (use-package lsp-java :ensure t)
(use-package lsp-metals
  :after lsp-mode
  :custom
  (lsp-metals-enable-semantic-highlighting t)
  :config
  (defconst my/lsp-metals-tramp-command "/home/becich/bin/metals"
    "Absolute path to Metals on remote hosts.")

  (defun my/lsp-metals-tramp-server-command ()
    "Return the remote Metals command for TRAMP buffers."
    `(,my/lsp-metals-tramp-command ,@lsp-metals-server-args))

  (defun my/lsp-metals-tramp-server-present-p ()
    "Return non-nil when remote Metals is executable."
    (if-let* ((remote-prefix (file-remote-p default-directory)))
        (file-executable-p
         (concat remote-prefix my/lsp-metals-tramp-command))
      (executable-find my/lsp-metals-tramp-command)))

  (when-let* ((client (gethash 'metals-tramp lsp-clients)))
    ;; `setf' for `lsp--client' slots is only known after lsp-mode defines the
    ;; struct, but use-package macro-expands this form earlier.
    (aset client 3 (lsp-stdio-connection #'my/lsp-metals-tramp-server-command
                                         #'my/lsp-metals-tramp-server-present-p))))
(use-package lsp-ui :commands (lsp-ui-mode lsp-ui-sideline-mode))
(use-package magit :commands (magit-status magit-dispatch))
(use-package markdown-mode)
(use-package nix-mode
  :hook (nix-mode . lsp-deferred))
(use-package org
  :straight nil)
;; (use-package pdf-tools :ensure t)
(use-package persistent-scratch
  :demand t
  :config
  (persistent-scratch-setup-default))
(use-package protobuf-mode)
(use-package puppet-mode)
(use-package purescript-mode)
(use-package racket-mode)
(use-package rainbow-delimiters :commands rainbow-delimiters-mode)
(use-package repl-toggle :commands repl-toggle)
(use-package restart-emacs :commands restart-emacs)
(use-package restclient)
(use-package slime :commands slime)
(use-package smartparens
  :demand t
  :hook (prog-mode . smartparens-mode)
  :config
  (require 'smartparens-config)
  (show-smartparens-global-mode 1))
(use-package snakemake-mode)
(use-package swift-mode)
(use-package swiper
  :commands (swiper swiper-isearch-thing-at-point)
  :bind (("C-s" . swiper)
         ("M-s" . swiper-isearch-thing-at-point)))
(use-package terraform-mode)
(use-package typescript-mode)
(use-package uuidgen :commands uuidgen)
(use-package vagrant)
(use-package vagrant-tramp :after (vagrant tramp))
(use-package vdiff
  :commands (vdiff-files vdiff-buffers vdiff-current-file)
  :config
  (define-key vdiff-mode-map (kbd "C-.") vdiff-mode-prefix-map))
(use-package visual-fill-column :commands visual-fill-column-mode)
(use-package vterm :commands vterm)
(use-package websocket)
(use-package ws-butler
  :hook ((prog-mode yaml-mode) . ws-butler-mode))
(use-package xterm-color :commands xterm-color-filter)
(use-package yaml-mode)
(use-package rust-mode)
(use-package envrc
  :hook (after-init . envrc-global-mode))

(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :branch "main")
  :commands (copilot-mode copilot-complete copilot-accept-completion))


(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :custom
  (lsp-idle-delay 0.2)
  (lsp-response-timeout 30))

(use-package lsp-nix
  :straight nil
  :after lsp-mode
  :custom
  (lsp-nix-nil-formatter ["nixfmt"]))

(use-package projectile
  :demand t
  :bind
  (("C-c p" . projectile-command-map)
   ("C-c C-p" . projectile-command-map))
  :custom
  (projectile-completion-system 'ivy)
  (projectile-dynamic-mode-line nil)
  (projectile-enable-caching t)
  (projectile-mode-line-function (lambda () ""))
  (projectile-mode-line-prefix " ")
  (projectile-require-project-root t)
  (projectile-sort-order 'recently-active)
  (projectile-use-git-grep t)
  :config
  (projectile-mode +1))



(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)


;; (add-hook 'prog-mode-hook #'lsp-deferred)



(use-package tramp-rpc
  :after tramp
  :straight (:host github :repo "ArthurHeymans/emacs-tramp-rpc" :files ("lisp/*.el"))
  :config
  (defun my/tramp-rpc-disable-undo-in-buffer (buffer)
    "Disable undo in BUFFER when it is live."
    (when (buffer-live-p buffer)
      (with-current-buffer buffer
        (buffer-disable-undo))))

  (defun my/tramp-rpc-disable-buffer-undo (_vec _process buffer &optional stderr-buffer)
    "Disable undo in TRAMP-RPC connection buffers."
    (dolist (buf (list buffer stderr-buffer))
      (my/tramp-rpc-disable-undo-in-buffer buf)))

  (unless (advice-member-p #'my/tramp-rpc-disable-buffer-undo
                           #'tramp-rpc--set-connection)
    (advice-add 'tramp-rpc--set-connection
                :after #'my/tramp-rpc-disable-buffer-undo))

  (dolist (buf (buffer-list))
    (when (string-prefix-p "*tramp/rpc " (buffer-name buf))
      (my/tramp-rpc-disable-undo-in-buffer buf))))

(use-package agent-shell
  :commands agent-shell)

(use-package acp
  :straight (:host github :repo "xenodium/acp.el"))

(use-package agent-shell-tramp
  :straight (:host github :repo "junyi-hou/agent-shell-tramp")
  :after agent-shell
  :config
  (agent-shell-tramp-mode 1))
(agent-shell-tramp-mode 1)

(use-package format-all :commands format-all-buffer)
(use-package git-gutter
  :commands git-gutter:revert-hunk)
(use-package git-commit
  :straight nil
  :demand t
  :config
  (global-git-commit-mode 1))
(use-package hl-todo
  :demand t
  :config
  (global-hl-todo-mode 1))
(use-package mustache-mode)
(use-package rg :commands (rg rg-project rg-dwim))
(use-package pdf-tools :commands pdf-tools-install)
(use-package adoc-mode)
(use-package yasnippet)
(use-package scala-mode)

(use-package eglot
  :straight nil
  :custom
  (eglot-sync-connect nil)
  (eglot-events-buffer-size 0))

(use-package gcmh
  :demand t
  :custom
  (gcmh-idle-delay 5)
  (gcmh-high-cons-threshold (* 256 1024 1024))
  (gcmh-low-cons-threshold (* 32 1024 1024))
  :config
  (gcmh-mode 1))


(use-package crontab-mode)

(use-package gptel
  :commands (gptel gptel-send gptel-menu))

;; Lightweight area configuration formerly loaded from areas/*.el.
(setq magit-last-seen-setup-instructions "1.4.0"
      inferior-lisp-program "/usr/bin/sbcl"
      slime-contribs '(slime-fancy)
      org-directory "~/org"
      eww-search-prefix "https://www.google.com/search?q=")

(add-hook 'java-mode-hook #'smartparens-mode)
(add-hook 'java-mode-hook #'flycheck-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'lsp-mode-hook #'lsp-ui-sideline-mode)
(add-to-list 'completion-ignored-extensions ".hi")

(defun my/truncate-eshell-buffers ()
  "Truncate all eshell buffers."
  (interactive)
  (dolist (buffer (buffer-list t))
    (with-current-buffer buffer
      (when (eq major-mode 'eshell-mode)
        (eshell-truncate-buffer)))))

(defvar my/eshell-truncate-timer nil
  "Idle timer used to truncate eshell buffers.")

(with-eval-after-load 'esh-mode
  (when (timerp my/eshell-truncate-timer)
    (cancel-timer my/eshell-truncate-timer))
  (setq my/eshell-truncate-timer
        (run-with-idle-timer 5 t #'my/truncate-eshell-buffers))
  (add-hook 'eshell-mode-hook
            (lambda ()
              (setq xterm-color-preserve-properties t)
              (setenv "TERM" "xterm-256color")))
  (add-to-list 'eshell-preoutput-filter-functions #'xterm-color-filter)
  (setq eshell-output-filter-functions
        (remove #'eshell-handle-ansi-color eshell-output-filter-functions)))

(with-eval-after-load 'comint
  (add-hook 'compilation-filter-hook #'comint-truncate-buffer)
  (add-hook 'comint-output-filter-functions #'comint-truncate-buffer)
  (setq comint-buffer-maximum-size 40960)
  (setq comint-output-filter-functions
        (remove #'ansi-color-process-output comint-output-filter-functions)))

(add-hook 'shell-mode-hook
          (lambda ()
            (font-lock-mode -1)
            (setq-local font-lock-function (lambda (_) nil))
            (add-hook 'comint-preoutput-filter-functions #'xterm-color-filter nil t)))

(defvar sql-product)
(defvar sql-prompt-regexp)
(defvar sql-prompt-cont-regexp)

(defun my-sql-comint-preoutput-filter (output)
  "Filter prompts out of SQL query output."
  (if (string-match (concat "\\`\\(" sql-prompt-regexp "\\)\\'") output)
      output
    (let ((main-prompt sql-prompt-regexp)
          (any-prompt comint-prompt-regexp)
          (prefix-newline nil))
      (with-temp-buffer
        (insert output)
        (goto-char (point-min))
        (when (looking-at main-prompt)
          (setq prefix-newline t))
        (while (looking-at any-prompt)
          (replace-match ""))
        (when prefix-newline
          (goto-char (point-min))
          (unless (looking-at "\n")
            (insert "\n")))
        (buffer-substring-no-properties (point-min) (point-max))))))

(defun my-sql-interactive-mode-hook ()
  "Custom interactive SQL mode behaviours. See `sql-interactive-mode-hook'."
  (when (eq sql-product 'postgres)
    (setq sql-prompt-regexp "^\\(?:\\sw\\|\\s_\\)*=[#>] "
          sql-prompt-cont-regexp "^\\(?:\\sw\\|\\s_\\)*[-(][#>] "))
  (add-hook 'comint-preoutput-filter-functions
            #'my-sql-comint-preoutput-filter :append :local))

(defun my-prefix-newline-to-sql-string (args)
  "Force all `sql-send-*' commands to include an initial newline."
  (cons (concat "\n" (car args)) (cdr args)))

(defun my-font-lock-everything-in-sql-interactive-mode ()
  (unless (eq 'oracle sql-product)
    (sql-product-font-lock nil nil)))

(with-eval-after-load 'sql
  (add-hook 'sql-interactive-mode-hook #'my-sql-interactive-mode-hook)
  (add-hook 'sql-interactive-mode-hook #'my-font-lock-everything-in-sql-interactive-mode)
  (advice-remove 'sql-send-string #'my-prefix-newline-to-sql-string)
  (advice-add 'sql-send-string :filter-args #'my-prefix-newline-to-sql-string))

(defun xah-rename-eww-hook ()
  "Rename eww browser's buffer so sites open in new page."
  (rename-buffer "eww" t))

(with-eval-after-load 'eww
  (add-hook 'eww-mode-hook #'xah-rename-eww-hook))

(global-set-key "\C-c C-o" #'browse-url-at-point)
(load "~/dotfiles/emacs/init_private.el")

;; (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'auto-revert-mode)

;; (setq request-backend 'url-retrieve)

;; (pdf-tools-install)

(setq dired-listing-switches "-alh")

(use-package auto-package-update
  :commands (auto-package-update-now auto-package-update-maybe)
  :custom
  (auto-package-update-delete-old-versions t))

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

(when (fboundp 'display-battery-mode)
  (display-battery-mode 1))
(display-time-mode 1)
(global-display-line-numbers-mode 1)
(global-auto-revert-mode 1)
(global-so-long-mode 1)
(global-visual-line-mode 1)
(when (fboundp 'global-completion-preview-mode)
  (global-completion-preview-mode 1))

;; (setq ring-bell-function 'ignore)

;; https://www.masteringemacs.org/article/keeping-secrets-in-emacs-gnupg-auth-sources
(setq epg-gpg-program "gpg2")

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(setq-default line-spacing 0)

(global-set-key (kbd "\C-c l") 'git-link)

(global-set-key (kbd "\C-x r h") 'git-gutter:revert-hunk)

(setq-default indent-tabs-mode nil)

(setq global-whitespace-cleanup-mode t)

;; (setq-default gc-cons-threshold (eval-when-compile (* 1024 1024 32)))
;; (setq garbage-collection-messages nil)
;; (run-with-idle-timer 10 t (lambda () (garbage-collect)))

;; (setq garbage-collection-messages nil)

(setq auto-window-vscroll nil)

(global-set-key (kbd "<kp-2>") 'end-of-defun)
(global-set-key (kbd "<kp-8>") 'beginning-of-defun)

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

;; (setq enable-recursive-minibuffers t)
;; ;; enable this if you want `swiper' to use it
(setq search-default-mode #'char-fold-to-regexp)

;; (add-to-list 'auto-mode-alist '("\\.jenkins\\'" . groovy-mode))




(add-to-list 'auto-mode-alist '("\\.avsc\\'" . js-json-mode))
(add-to-list 'auto-mode-alist '("\\.avro\\'" . js-json-mode))
(put 'magit-clean 'disabled nil)

(setq lsp-semgrep-languages nil)

;; (defun my/lsp-clear-session-folders (&rest _args)
;;   "Clear remembered LSP workspace folders before starting LSP."
;;   (setf (lsp-session-server-id->folders (lsp-session)) (ht)))

;; (advice-remove 'lsp #'my/lsp-clear-session-folders)
;; (advice-add 'lsp :before #'my/lsp-clear-session-folders)


(unless (version< emacs-version "27.0")
  (add-function :after after-focus-change-function
                (lambda ()
                  (unless (frame-focus-state)
                    (garbage-collect)))))

;;(rg-enable-menu)

(setq lsp-copilot-enabled nil)

(setq remote-file-name-inhibit-locks t
      remote-file-name-inhibit-auto-save-visited t
      tramp-use-connection-share t
      tramp-use-scp-direct-remote-copying t
      tramp-copy-size-limit (* 1024 1024) ;; 1MB
      tramp-verbose 1)

(connection-local-set-profile-variables
 'remote-direct-async-process
 '((tramp-direct-async-process . t)))


(dolist (method '("ssh" "scp" "rsync"))
  (connection-local-set-profiles
   `(:application tramp :protocol ,method)
   'remote-direct-async-process))


(setq magit-tramp-pipe-stty-settings 'pty)

(with-eval-after-load 'tramp
  (with-eval-after-load 'compile
    (remove-hook 'compilation-mode-hook #'tramp-compile-disable-ssh-controlmaster-options)))

;; don't show the diff by default in the commit buffer. Use `C-c C-d' to display it
(setq magit-commit-show-diff nil)
;; don't show git variables in magit branch
(setq magit-branch-direct-configure nil)
;; don't automatically refresh the status buffer after running a git command
;; (setq magit-refresh-status-buffer nil)


(with-eval-after-load 'gptel
  (setq gptel-backend (gptel-make-gh-copilot "Copilot")))


;; (let ((major-mode 'org-mode))
;;   (org-latex-preview))


;; (defun my/gptel-org-latex-preview (_response)
;;   "Run `org-latex-preview' after a GPTEL response."
;;   (when (derived-mode-p 'org-mode)
;;     (org-latex-preview '(16)))) ; '(16) refreshes all equations for safety

;; (add-hook 'gptel-post-response-functions #'my/gptel-org-latex-preview)

;; (add-hook 'gptel-post-response-functions ('org-latex-preview ()))


(defun my/gptel-org-latex-preview (_beg _end)
  "Preview LaTeX fragments after GPTel response in org-mode."
  (when (derived-mode-p 'org-mode)
    (org-latex-preview 16)))  ;; 16 = preview whole buffer
    ;;(org-latex-preview (list 1 beg end))))  ;; 16 = preview whole buffer

(with-eval-after-load 'gptel
  (add-hook 'gptel-post-response-functions #'my/gptel-org-latex-preview))
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

(with-eval-after-load 'gptel
  (setf (alist-get 'org-mode gptel-prompt-prefix-alist) "@user\n")
  (setf (alist-get 'org-mode gptel-response-prefix-alist) "@assistant\n"))



(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
(setq tramp-backup-directory-alist nil)
(setq tramp-auto-save-directory "~/.emacs.d/tramp-autosave")

(when (file-exists-p custom-file)
  (load custom-file nil 'nomessage))


;; (setq gptel-use-curl "/opt/local/bin/curl")



;; (setq gptel-proxy "")

;; (setq gptel-stream nil)


(setq tramp-rpc-deploy-git-build-policy 'release)


;;(setq agent-shell-github-copilot-environment (agent-shell-make-environment-variables :inherit-env t))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
