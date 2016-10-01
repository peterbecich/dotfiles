
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/dotfiles/emacs/init_shared.el")

;; (load "server")
;; (unless (server-running-p) (server-start))

;;(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-term-color-vector
   [unspecified "#1F1611" "#660000" "#144212" "#EFC232" "#5798AE" "#BE73FD" "#93C1BC" "#E6E1DC"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("456ac8176c7c01680384356cbdc568a7683d1bada9c83ae3d7294809ddda4014" "c4e6fe8f5728a5d5fd0e92538f68c3b4e8b218bcfb5e07d8afff8731cc5f3df0" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "31a01668c84d03862a970c471edbd377b2430868eccf5e8a9aec6831f1a0908d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" default)))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(fci-rule-character-color "#452E2E")
 '(fringe-mode 0 nil (fringe))
 '(package-selected-packages
   (quote
    (wanderlust w3m twittering-mode sx sublime-themes scala-outline-popup restclient pdf-tools org-caldav multi-web-mode maker-mode magit-gh-pulls ipython hide-comnt haskell-mode gist fold-this ess-R-object-popup ensime company-coq color-theme-zenburn color-theme-wombat color-theme-vim-insert-mode color-theme-twilight color-theme-tangotango color-theme-tango color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme-railscasts color-theme-monokai color-theme-molokai color-theme-library color-theme-ir-black color-theme-heroku color-theme-gruber-darker color-theme-github color-theme-emacs-revert-theme color-theme-eclipse color-theme-dpaste color-theme-dg color-theme-complexity color-theme-cobalt color-theme-buffer-local color-theme-approximate color-theme-actress boron-theme birds-of-paradise-plus-theme auto-package-update auto-complete auctex-latexmk)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2d2d2d" :foreground "#cccccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "Ubuntu Mono")))))


(require 'pdf-tools)
(pdf-tools-install)


(set-face-background hl-line-face "#303030"); 

(put 'erase-buffer 'disabled nil)
