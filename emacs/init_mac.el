(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(setenv "PATH" (concat (getenv "PATH") ":/Users/peterbecich/.cabal/bin"))
(setq exec-path (append exec-path '("/Users/peterbecich/.cabal/bin")))

(setenv "PATH" (concat "/Users/peterbecich/.local/bin:" (getenv "PATH")))
(setq exec-path (append '("/Users/peterbecich/.local/bin") exec-path ))

(setenv "PATH" (concat "/opt/local/lib/postgresql96/bin:" (getenv "PATH")))
(setq exec-path (append '("/opt/local/lib/postgresql96/bin") exec-path ))

(setenv "PATH" (concat "/Applications/Firefox Developer Edition.app/Contents/MacOS:" (getenv "PATH")))
(setq exec-path (append '("/Applications/Firefox Developer Edition.app/Contents/MacOS") exec-path ))


(setenv "PATH" (concat "/opt/local/libexec/gnubin/:" (getenv "PATH")))
(setq exec-path (append '("/opt/local/libexec/gnubin") exec-path ))

(setq use-package-always-ensure t)


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
 '(async-bytecomp-allowed-packages (quote (quote (all))))
 '(auth-sources (quote ("~/.authinfo.gpg" "~/.authinfo" "~/.netrc")))
 '(byte-compile-warnings nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
   (quote
    ("9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" "ba7917b02812fee8da4827fdf7867d3f6f282694f679b5d73f9965f45590843a" "c72a772c104710300103307264c00a04210c00f6cc419a79b8af7890478f380e" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "a0dc0c1805398db495ecda1994c744ad1a91a9455f2a17b59b716f72d3585dde" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(desktop-save-mode t)
 '(doc-view-pdf->png-converter-function (quote doc-view-pdf->png-converter-mupdf))
 '(doc-view-resolution 200)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(elfeed-feeds
   (quote
    ("http://feeds.reuters.com/reuters/topNews" "http://feeds.reuters.com/Reuters/domesticNews" "http://feeds.reuters.com/Reuters/worldNews" "https://news.google.com/news/rss/headlines?ned=us&gl=US&hl=en" "https://news.ycombinator.com/rss" "http://www.thehill.com/rss/syndicator/19110" "http://www.thehill.com/rss/syndicator/19109" "http://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml" "http://rss.slashdot.org/Slashdot/slashdotMain")))
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
 '(gnutls-trustfiles
   (quote
    ("/etc/ssl/certs/ca-certificates.crt" "/etc/pki/tls/certs/ca-bundle.crt" "/etc/ssl/ca-bundle.pem" "/usr/ssl/certs/ca-bundle.crt" "/usr/local/share/certs/ca-root-nss.crt" "/opt/local/share/curl/curl-ca-bundle.crt")))
 '(helm-locate-command "glocate %s %s")
 '(helm-locate-create-db-command "gupdatedb --output='%s' --localpaths='%s'")
 '(intero-debug nil)
 '(intero-extra-ghc-options nil)
 '(intero-extra-ghci-options nil)
 '(intero-stack-executable "stack")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (rainbow-delimiters hlint-refactor helm-company jdee ess company-terraform auto-virtualenv helm-projectile color-identifiers-mode xterm-color colormaps ghc helm-ghc helm-hoogle hindent shm helm helm-ag browse-at-remote ghub magithub docker docker-compose-mode elfeed flycheck-haskell intero ag auctex-latexmk paredit company-irony company-irony-c-headers company-rtags flycheck-rtags irony irony-eldoc rtags wakatime-mode slack anti-zenburn-theme js2-refactor js2-mode go-mode yaml-mode ctags ctags-update company-ghc zenburn-theme exec-path-from-shell redprl psci purescript-mode paradox ensime scala-mode web-mode w3m twittering-mode sx restclient powerline pdf-tools org multi-web-mode maker-mode magit-gh-pulls latex-preview-pane latex-extra idris-mode hide-comnt git geiser fold-this flx-ido ess-R-data-view elpy dockerfile-mode company-coq color-theme-tango color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme-railscasts color-theme-monokai color-theme-molokai color-theme-library color-theme-ir-black color-theme-heroku color-theme-gruber-darker color-theme-github color-theme-emacs-revert-theme color-theme-eclipse color-theme-dpaste color-theme-dg color-theme-complexity color-theme-cobalt color-theme-buffer-local color-theme-approximate color-theme-actress auto-package-update)))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(safe-local-variable-values
   (quote
    ((haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4))))
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
 '(wakatime-cli-path "/Users/peterbecich/.virtualenv/ENV/bin/wakatime" t)
 '(wakatime-python-bin nil t))
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

;; (load-file "~/.emacs.d/ProofGeneral-4.2/generic/proof-site.el")

(set-face-background hl-line-face "#dbdbdb"); Same color as greyness in gtk


(let ((gls "/opt/local/bin/gls"))
  (if (file-exists-p gls) (setq insert-directory-program gls)))
(put 'erase-buffer 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#FFFFFF" :foreground "#333333" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 140 :width normal :foundry "nil" :family "Menlo"))))
 '(shm-current-face ((t (:background "#c7fbea"))))
 '(shm-quarantine-face ((t (:background "#ffd8e1")))))
(put 'magit-clean 'disabled nil)
