(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


(setq use-package-always-ensure t)

(use-package magit)
(use-package auctex-latexmk)
(use-package auto-complete)
(use-package auto-virtualenv)
(use-package company-irony)
(use-package company-irony-c-headers)
(use-package company-rtags)
(use-package dockerfile-mode)
(use-package ensime)
(use-package ess)
(use-package flycheck-rtags)
(use-package haskell-mode)
(use-package intero)
(use-package irony)
(use-package irony-eldoc)
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
(use-package sx)
(use-package twittering-mode)
(use-package w3m)
(use-package yaml-mode)
(use-package sml-mode)

(setenv "WORKON_HOME" "/Users/peterbecich/.virtualenv/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#657b83" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"))
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "a0dc0c1805398db495ecda1994c744ad1a91a9455f2a17b59b716f72d3585dde" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(doc-view-pdf->png-converter-function (quote doc-view-pdf->png-converter-mupdf))
 '(doc-view-resolution 200)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(epg-gpg-program "/opt/local/bin/gpg2")
 '(erc-email-userid "peterbecich@gmail.com")
 '(erc-nick "peterbecich")
 '(erc-notifications-mode nil)
 '(erc-public-away-p t)
 '(erc-rename-buffers t)
 '(erc-track-mode nil)
 '(erc-track-position-in-mode-line t)
 '(fci-rule-color "#eee8d5")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(fringe-mode 0 nil (fringe))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (paredit company-irony company-irony-c-headers company-rtags flycheck-rtags irony irony-eldoc rtags wakatime-mode slack anti-zenburn-theme js2-refactor js2-mode go-mode yaml-mode ctags ctags-update flycheck-haskell company-ghc zenburn-theme exec-path-from-shell intero redprl psci purescript-mode js-doc paradox ensime scala-mode web-mode w3m twittering-mode sx restclient powerline pdf-tools org multi-web-mode maker-mode magit-gh-pulls latex-preview-pane latex-extra idris-mode hide-comnt haskell-mode git geiser fold-this flx-ido ess-R-data-view elpy dockerfile-mode company-coq color-theme-tango color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme-railscasts color-theme-monokai color-theme-molokai color-theme-library color-theme-ir-black color-theme-heroku color-theme-gruber-darker color-theme-github color-theme-emacs-revert-theme color-theme-eclipse color-theme-dpaste color-theme-dg color-theme-complexity color-theme-cobalt color-theme-buffer-local color-theme-approximate color-theme-actress auto-package-update auto-complete)))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(slack-buffer-create-on-notify (quote true))
 '(slack-buffer-emojify (quote true))
 '(slack-prefer-current-team (quote true))
 '(slack-room-subscription nil)
 '(slack-typing-visibility (quote never))
 '(term-scroll-to-bottom-on-output t)
 '(tool-bar-mode nil)
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
 '(wakatime-cli-path "/Users/peterbecich/.virtualenv/ENV/bin/wakatime")
 '(wakatime-python-bin nil))
;; (epa-file-enable)


(eval-when-compile
  (require 'use-package))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setenv "PATH" (concat (getenv "PATH") ":/opt/local/bin"))
(setq exec-path (append exec-path '("/opt/local/bin")))

(setenv "PATH" (concat (getenv "PATH") ":/Users/peterbecich/bin/spark-2.1.1-bin-hadoop2.7/bin"))
(setq exec-path (append exec-path '("/Users/peterbecich/bin/spark-2.1.1-bin-hadoop2.7/bin")))

(setenv "PATH" (concat (getenv "PATH") ":/Users/peterbecich/.local/bin/"))
(setq exec-path (append exec-path '("/Users/peterbecich/.local/bin/")))

(load "~/dotfiles/emacs/init_shared.el")

(load "~/dotfiles/emacs/init_private.el")
(load "~/dotfiles/emacs/init_private_mac.el")

(global-wakatime-mode)

(load-file "~/.emacs.d/ProofGeneral-4.2/generic/proof-site.el")

(set-face-background hl-line-face "#dbdbdb"); Same color as greyness in gtk


(let ((gls "/opt/local/bin/gls"))
  (if (file-exists-p gls) (setq insert-directory-program gls)))
(put 'erase-buffer 'disabled nil)
(put 'magit-clean 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
