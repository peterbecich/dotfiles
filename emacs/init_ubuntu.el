(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


(setenv "PATH" (concat (getenv "PATH") ":/home/peterbecich/node/bin"))
(setq exec-path (append exec-path '("/home/peterbecich/node/bin")))



(eval-when-compile
  (require 'use-package))

(load "~/dotfiles/emacs/init_shared.el")
(load "~/dotfiles/emacs/init_private.el")
(load "~/dotfiles/emacs/init_private_debian.el")

(add-hook 'after-init-hook 'global-company-mode)

;;https://www.emacswiki.org/emacs/CompanyMode#toc6
(global-set-key (kbd "C-;") 'company-complete)

;; (global-wakatime-mode 1)

;;(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(put 'erase-buffer 'disabled nil)

(keychain-refresh-environment)

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:background nil))))
;;  '(mode-line ((t (:background "#8b4500" :foreground "#8FB28F" :box (:line-width -1 :style released-button)))))
;;  '(mode-line-inactive ((t (:background "#383838" :foreground "#5F7F5F" :box (:line-width -1 :style released-button)))))
;;  '(query-replace ((t (:inherit isearch :background "DeepSkyBlue4"))))
;;  '(region ((t (:background "DeepSkyBlue4")))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments
   (quote
    ("--smart-case" "--stats" "-p '~/dotfiles/.agignore'")))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(auto-virtualenv-dir "/home/peterbecich/virtualenv")
 '(comment-multi-line nil)
 '(company-clang-executable "clang")
 '(coq-compile-before-require t)
 '(coq-compile-parallel-in-background t)
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
   (quote
    ("6de7c03d614033c0403657409313d5f01202361e35490a3404e33e46663c2596" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "c72a772c104710300103307264c00a04210c00f6cc419a79b8af7890478f380e" "b9cbfb43711effa2e0a7fbc99d5e7522d8d8c1c151a3194a4b176ec17c9a8215" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "a0dc0c1805398db495ecda1994c744ad1a91a9455f2a17b59b716f72d3585dde" "093b2a26030dcd576cad4e59b5d804bc0496e56f4e2659e8900b4814279c3402" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "c4e6fe8f5728a5d5fd0e92538f68c3b4e8b218bcfb5e07d8afff8731cc5f3df0" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9824f5d6169b1e98c79e4a6f596b6a3f94cbefc0b2458fd2bfcbadee8b5687ec" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(elpy-rpc-python-command "python3")
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(ensime-sbt-perform-on-save "compile")
 '(erc-autojoin-channels-alist
   (quote
    (("verne.freenode.net" "#freenode" "#apache-spark" "#hackerrank" "#purescript" "#yesod" "#nicta-course" "#erlang" "#clojure" "#postgresql" "#web" "#hackernews" "##math" "#git" "#debian" "#wikipedia-en" "#lesswrong" "#scalaz" "#scala" "#haskell-lens" "#xmonad" "#haskell-beginners" "#haskell" "#emacs"))))
 '(erc-autojoin-domain-only nil)
 '(erc-autojoin-timing (quote ident))
 '(erc-dcc-chat-request (quote ignore))
 '(erc-dcc-send-request (quote ignore))
 '(erc-email-userid "peterbecich@gmail.com")
 '(erc-join-buffer (quote bury))
 '(erc-log-insert-log-on-open nil)
 '(erc-log-write-after-insert t)
 '(erc-log-write-after-send t)
 '(erc-modules
   (quote
    (autojoin button completion fill irccontrols list log match menu move-to-prompt netsplit networks noncommands readonly ring stamp spelling)))
 '(erc-nick "peterbecich")
 '(erc-notifications-mode t)
 '(erc-notify-list (quote ("peterbecich")))
 '(erc-notify-mode t)
 '(erc-public-away-p t)
 '(erc-rename-buffers t)
 '(erc-reuse-frames nil)
 '(erc-server-reconnect-attempts 6)
 '(erc-server-reconnect-timeout 15)
 '(erc-track-minor-mode nil)
 '(erc-track-mode nil)
 '(erc-track-position-in-mode-line t)
 '(erc-truncate-mode t)
 '(erc-try-new-nick-p nil)
 '(erc-user-mode "+RZgi")
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")))
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ".ensime_cache")))
 '(hl-sexp-background-color "#efebe9")
 '(menu-bar-mode nil)
 '(newsticker-url-list
   (quote
    (("Google News Top Stories" "https://news.google.com/news?cf=all&hl=en&pz=1&ned=us&authuser=1&output=rss" nil 3600 nil)
     ("Google News Los Angeles" "https://news.google.com/news?cf=all&hl=en&pz=1&ned=us&authuser=1&geo=Los+Angeles,+CA,+United+States&output=rss" nil 3600 nil)
     ("Google News nearby" "https://news.google.com/news?cf=all&hl=en&pz=1&ned=us&authuser=1&geo=detect_metro_area&output=rss" nil 3600 nil)
     ("Hacker News" "https://news.ycombinator.com/rss" nil nil nil)
     ("Slashdot" "http://rss.slashdot.org/Slashdot/slashdotMain" nil nil nil)
     ("The Hill most popular" "http://thehill.com/rss/syndicator/19110" nil nil nil)
     ("The Hill all news" "http://thehill.com/rss/syndicator/19109" nil nil nil)
     ("Politico congress" "http://www.politico.com/rss/congress.xml" nil nil nil)
     ("Politico defense" "http://www.politico.com/rss/defense.xml" nil nil nil)
     ("Politico economy" "http://www.politico.com/rss/economy.xml" nil nil nil)
     ("Politico energy" "http://www.politico.com/rss/energy.xml" nil nil nil))))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-protocol org-w3m)))
 '(package-selected-packages
   (quote
    (afternoon-theme alect-themes ample-theme cyberpunk-theme monokai-theme espresso-theme leuven-theme moe-theme solarized-theme ag keychain-environment helm flycheck-ocaml sml-mode ess latex-math-preview company-c-headers company-shell irony-eldoc flycheck-rtags flycheck-irony company-irony-c-headers company-irony company-rtags rtags auto-virtualenv auto-virtualenvwrapper buffer-move ereader org org-pomodoro orgit smartparens paredit cider clojure-mode build-status irony psc-ide glsl-mode flycheck-scala-sbt flycheck-purescript purescript-mode hamlet-mode helm-dash twittering-mode yaml-mode intero markdown-mode magit js2-mode dockerfile-mode zenburn-theme flycheck-haskell ensime use-package w3m sx sublime-themes restclient pdf-tools paradox org-caldav multi-web-mode maker-mode magit-gh-pulls ipython hide-comnt haskell-mode gist fold-this ess-R-object-popup company-coq color-theme-zenburn color-theme-wombat color-theme-vim-insert-mode color-theme-twilight color-theme-tangotango color-theme-tango color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme-railscasts color-theme-monokai color-theme-molokai color-theme-library color-theme-ir-black color-theme-heroku color-theme-gruber-darker color-theme-github color-theme-emacs-revert-theme color-theme-eclipse color-theme-dpaste color-theme-dg color-theme-complexity color-theme-cobalt color-theme-buffer-local color-theme-approximate color-theme-actress boron-theme birds-of-paradise-plus-theme auto-package-update auto-complete auctex-latexmk)))
 '(pdf-cache-image-limit 16)
 '(proof-auto-raise-buffers nil)
 '(proof-follow-mode (quote locked))
 '(proof-three-window-enable t)
 '(proof-three-window-mode-policy (quote hybrid))
 '(proof-toolbar-enable t)
 '(psc-ide-purs-executable "/home/peterbecich/node/bin/purs")
 '(purescript-indent-offset 2)
 '(python-shell-exec-path (quote ("~/virtualenv/ENV/bin/")))
 '(python-shell-interpreter "/home/peterbecich/virtualenv/ENV/bin/python3.6")
 '(safe-local-variable-values
   (quote
    ((hamlet/basic-offset . 4)
     (haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4))))
 '(sbt:scroll-to-bottom-on-output t)
 '(slack-buffer-create-on-notify (quote true))
 '(slack-buffer-emojify (quote true))
 '(slack-prefer-current-team (quote true))
 '(wakatime-python-bin nil t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
