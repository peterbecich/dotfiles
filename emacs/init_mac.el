
(require 'package)
(setq package-enable-at-startup nil) ; To avoid initializing twice
(package-initialize)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))


(load "~/dotfiles/emacs/init_shared.el")


(load-file "~/.emacs.d/ProofGeneral-4.2/generic/proof-site.el")
;;(setenv “PATH” (shell-command-to-string “bash -i -c ‘echo -n $PATH’”))

;; (set-face-attribute 'default nil :font "Menlo-13")


;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ansi-color-faces-vector
;;    [default bold shadow italic underline bold bold-italic bold])
;;  '(ansi-color-names-vector
;;    (vector "#cccccc" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#2d2d2d"))
;;  '(column-number-mode t)
;;  '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
;;  '(custom-safe-themes
;;    (quote
;;     ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
;;  '(fci-rule-color "#515151")
;;  '(fringe-mode 0 nil (fringe))
;;  '(scroll-bar-mode nil)
;;  '(show-paren-mode t)
;;  '(tool-bar-mode nil)
;;  '(vc-annotate-background nil)
;;  '(vc-annotate-color-map
;;    (quote
;;     ((20 . "#f2777a")
;;      (40 . "#f99157")
;;      (60 . "#ffcc66")
;;      (80 . "#99cc99")
;;      (100 . "#66cccc")
;;      (120 . "#6699cc")
;;      (140 . "#cc99cc")
;;      (160 . "#f2777a")
;;      (180 . "#f99157")
;;      (200 . "#ffcc66")
;;      (220 . "#99cc99")
;;      (240 . "#66cccc")
;;      (260 . "#6699cc")
;;      (280 . "#cc99cc")
;;      (300 . "#f2777a")
;;      (320 . "#f99157")
;;      (340 . "#ffcc66")
;;      (360 . "#99cc99"))))
;;  '(vc-annotate-very-old-color nil))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#2d2d2d" :foreground "#cccccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Menlo")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango)))
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(doc-view-pdf->png-converter-function (quote doc-view-pdf->png-converter-mupdf))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(erc-email-userid "peterbecich@gmail.com")
 '(erc-public-away-p t)
 '(erc-rename-buffers t)
 '(fci-rule-color "#eee8d5")
 '(fringe-mode 0 nil (fringe))
 '(package-selected-packages
   (quote
    (scala-mode web-mode w3m twittering-mode sx restclient powerline pdf-tools org multi-web-mode maker-mode magit-gh-pulls latex-preview-pane latex-extra idris-mode hide-comnt haskell-mode git geiser fold-this flx-ido ess-R-data-view ensime elpy dockerfile-mode company-coq color-theme-tango color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme-railscasts color-theme-monokai color-theme-molokai color-theme-library color-theme-ir-black color-theme-heroku color-theme-gruber-darker color-theme-github color-theme-emacs-revert-theme color-theme-eclipse color-theme-dpaste color-theme-dg color-theme-complexity color-theme-cobalt color-theme-buffer-local color-theme-approximate color-theme-actress auto-package-update auto-complete)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
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
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(set-face-background hl-line-face "#dbdbdb"); Same color as greyness in gtk


(let ((gls "/opt/local/bin/gls"))
  (if (file-exists-p gls) (setq insert-directory-program gls)))
(put 'erase-buffer 'disabled nil)
