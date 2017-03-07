(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line



(eval-when-compile
  (require 'use-package))

(add-hook 'haskell-mode-hook 'intero-mode)

(load "~/dotfiles/emacs/init_shared.el")

(load "~/dotfiles/emacs/init_private.el")
(load "~/dotfiles/emacs/init_private_debian.el")

(global-wakatime-mode)

;;(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(put 'erase-buffer 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(ansi-term-color-vector
   [unspecified "#1F1611" "#660000" "#144212" "#EFC232" "#5798AE" "#BE73FD" "#93C1BC" "#E6E1DC"] t)
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "c4e6fe8f5728a5d5fd0e92538f68c3b4e8b218bcfb5e07d8afff8731cc5f3df0" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9824f5d6169b1e98c79e4a6f596b6a3f94cbefc0b2458fd2bfcbadee8b5687ec" default)))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(erc-notifications-mode t)
 '(erc-track-position-in-mode-line t)
 '(fci-rule-character-color "#452E2E")
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ".ensime_cache")))
 '(package-selected-packages
   (quote
    (yaml-mode intero markdown-mode magit js2-mode dockerfile-mode zenburn-theme wakatime-mode flycheck-haskell ensime use-package solarized-theme wanderlust w3m twittering-mode sx sublime-themes restclient pdf-tools paradox org-caldav multi-web-mode maker-mode magit-gh-pulls ipython hide-comnt haskell-mode gist fold-this ess-R-object-popup company-coq color-theme-zenburn color-theme-wombat color-theme-vim-insert-mode color-theme-twilight color-theme-tangotango color-theme-tango color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme-railscasts color-theme-monokai color-theme-molokai color-theme-library color-theme-ir-black color-theme-heroku color-theme-gruber-darker color-theme-github color-theme-emacs-revert-theme color-theme-eclipse color-theme-dpaste color-theme-dg color-theme-complexity color-theme-cobalt color-theme-buffer-local color-theme-approximate color-theme-actress boron-theme birds-of-paradise-plus-theme auto-package-update auto-complete auctex-latexmk)))
 '(pdf-cache-image-limit 16)
 '(pdf-view-midnight-colors (quote ("gainsboro" . "gray15")))
 '(slack-buffer-create-on-notify (quote true))
 '(slack-buffer-emojify (quote true))
 '(slack-prefer-current-team (quote true)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(mode-line ((t (:background "#8b4500" :foreground "#8FB28F" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:background "#383838" :foreground "#5F7F5F" :box (:line-width -1 :style released-button)))))
 '(query-replace ((t (:inherit isearch :background "DeepSkyBlue4"))))
 '(region ((t (:background "DeepSkyBlue4")))))
