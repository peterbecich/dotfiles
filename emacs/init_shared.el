(load "~/dotfiles/emacs/custom_commands.el")
(load "~/dotfiles/emacs/auctex_related.el")
(load "~/dotfiles/emacs/package_list.el")

(setq use-package-always-ensure t)

(use-package ag)
(use-package auctex-latexmk)
(use-package auto-virtualenv)
(use-package browse-at-remote)
(use-package company-irony)
(use-package company-irony-c-headers)
(use-package company-rtags)
(use-package company-terraform)
(use-package docker)
(use-package docker-compose-mode)
(use-package dockerfile-mode)
(use-package ensime)
(use-package ess)
(use-package flycheck-rtags)
(use-package ghc)
(use-package haskell-mode)
(use-package helm)
(use-package helm-ag)
(use-package helm-ghc)
(use-package helm-hoogle)
(use-package helm-projectile)
(use-package intero)
(use-package irony)
(use-package irony-eldoc)
(use-package jdee)
(use-package js2-mode)
(use-package magit)
(use-package markdown-mode)
(use-package multi-web-mode)
(use-package org)
(use-package paredit)
(use-package pdf-tools)
(use-package psc-ide)
(use-package purescript-mode)
(use-package restclient)
(use-package rtags)
(use-package smartparens)
(use-package sml-mode)
(use-package sx)
(use-package terraform-mode)
(use-package twittering-mode)
(use-package w3m)
(use-package yaml-mode)
(use-package elscreen)
(use-package helm-elscreen)
;; (use-package auto-virtualenv)
;; (use-package company-emacs-eclim)
;; (use-package eclim)
;; (use-package flycheck-rtags)
(use-package rainbow-delimiters)

;;(use-package ensime)
;;(use-package ess)


(elscreen-start)
(require 'helm-config)

(add-hook 'after-init-hook 'global-company-mode)

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
(global-hl-line-mode 0); Highlight current row
(show-paren-mode 1); Matches parentheses and such in every mode

;; (setq visible-bell t); Flashes on error

(add-to-list 'default-frame-alist '(height . 59)); Default frame height.

(add-hook 'prog-mode-hook 'linum-mode)
(setq linum-format "%d ")

(yas-global-mode 0)

;; http://www.emacswiki.org/emacs/WinnerMode
(when (fboundp 'winner-mode)
  (winner-mode 1))

(setq resize-mini-windows t)
;; (setq max-mini-window-height 2)

;; http://stackoverflow.com/questions/3447531/emacs-ess-version-of-clear-console

(custom-set-variables
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
)

(setq ring-bell-function 'ignore)

;; https://www.masteringemacs.org/article/keeping-secrets-in-emacs-gnupg-auth-sources
(setq epg-gpg-program "gpg2")

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))


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

