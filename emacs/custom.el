;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agent-shell-preferred-agent-config 'codex)
 '(ansi-color-names-vector
   ["#32302F" "#FB4934" "#B8BB26" "#FABD2F" "#83A598" "#D3869B" "#17CCD5" "#EBDBB2"])
 '(auth-sources '("~/.authinfo.gpg" "~/.authinfo" "~/.netrc"))
 '(auto-package-update-hide-results t)
 '(auto-revert-avoid-polling t)
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
 '(custom-file "~/dotfiles/emacs/custom.el")
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
 '(display-time-day-and-date t)
 '(display-time-default-load-average nil)
 '(display-time-format nil)
 '(display-time-mode t)
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
 '(enable-remote-dir-locals t)
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
 '(groovy-highlight-assignments t)
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
 '(lsp-disabled-clients '(rubocop-ls-tramp vue-semantic-server-tramp))
 '(lsp-enable-file-watchers nil)
 '(lsp-keep-workspace-alive nil)
 '(lsp-log-io nil)
 '(lsp-metals-ammonite-jvm-properties ["-Xmx12g" "-Xms1g"])
 '(lsp-metals-bloop-sbt-already-installed t)
 '(lsp-metals-enable-semantic-highlighting t)
 '(lsp-metals-install-scala-version "2.12")
 '(lsp-metals-show-inferred-type t)
 '(lsp-restart 'auto-restart)
 '(lsp-rubocop-use-bundler nil)
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
 '(mouse-wheel-progressive-speed nil)
 '(network-security-level 'high)
 '(ns-antialias-text t)
 '(ns-confirm-quit t)
 '(org-format-latex-options
   '(:foreground default :background default :scale 2.0 :html-foreground "Black" :html-background "Transparent" :html-scale
                 1.0 :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-hide-emphasis-markers nil)
 '(org-imenu-depth 6)
 '(package-native-compile t)
 '(package-selected-packages
   '(adoc-mode ag agent-shell alect-themes ansible async auto-compile auto-package-update auto-virtualenv browse-at-remote
               company-terraform counsel crontab-mode csv-mode darktooth-theme dhall-mode diff-hl diminish
               dired-git-info diredfl docker docker-compose-mode dockerfile-mode emacsql espresso-theme
               exec-path-from-shell eyebrowse fill-column-indicator flycheck format-all gcmh git-gutter git-link
               git-timemachine go-mode gptel groovy-mode haskell-mode helpful hlint-refactor logview lsp-metals lsp-ui
               magit mustache-mode persistent-scratch projectile protobuf-mode restart-emacs restclient rg rust-mode
               smartparens typescript-mode vdiff vterm web-mode websocket ws-butler xterm-color yasnippet))
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
   '(symon-darwin-memory-monitor symon-darwin-cpu-monitor symon-darwin-network-rx-monitor symon-darwin-network-tx-monitor
                                 symon-darwin-battery-monitor))
 '(symon-sparkline-type 'boxed)
 '(tags-revert-without-query t)
 '(term-scroll-to-bottom-on-output t)
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(tramp-remote-path
   '("/home/becich/.gem/ruby/3.3.10/bin/" "/home/becich/npm-global/bin/" "/home/becich/.gem/bin/" "/usr/local/bin/"
     "/home/becich/bin/" "/home/becich/.local/share/coursier/bin/" tramp-default-remote-path "/bin" "/usr/bin" "/sbin"
     "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin"
     "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin" "/opt/homebrew/bin"
     "/opt/homebrew/sbin"))
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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-hl-change ((t (:inherit diff-changed :background "#EBDBB2"))))
 '(diff-hl-delete ((t (:inherit diff-removed :background "#FB4934"))))
 '(diff-hl-insert ((t (:inherit diff-added :background "#B8BB26"))))
 '(eyebrowse-mode-line-active ((t (:inverse-video t :weight bold)))))
