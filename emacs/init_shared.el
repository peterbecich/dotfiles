(load "~/dotfiles/emacs/custom_commands.el")
(load "~/dotfiles/emacs/auctex_related.el")
(load "~/dotfiles/emacs/package_list.el")

(setq themes '(zenburn sanityinc-solarized-light sanityinc-tomorrow-eighties sanityinc-tomorrow-day))
(setq themes-index 0)

(defun cycle-theme ()
  (interactive)
  (setq themes-index (% (1+ themes-index) (length themes)))
  (load-indexed-theme))

(defun load-indexed-theme ()
  (try-load-theme (nth themes-index themes)))

(defun try-load-theme (theme)
  (if (ignore-errors (load-theme theme :no-confirm))
      (mapcar #'disable-theme (remove theme custom-enabled-themes))
    (message "Unable to find theme file for ‘%s’" theme)))


(require 'tls)

(setq tramp-default-method "ssh")
;; (newsticker-start)

(setq request-backend 'url-retrieve)

(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "#haskell" "#haskell-beginners" "#xmonad" "#haskell-lens" "#scala" "#scalaz" "#lesswrong" "#wikipedia-en" "#debian" "#git" "##math" "#hackernews" "#web" "#postgresql" "#clojure" "#erlang" "#nicta-course" "#yesod" "#purescript" "#hackerrank")
	;; ("gitter.im"  "#fs2" "#http4s/http4s" "#tpolecat/doobie" "#shapeless" "#magit/magit" "#fpinscala/fpinscala" "#typelevel/cats" "#matryoshka")
	)
      )

(setq global-auto-revert-mode 1)

(setq ensime-eldoc-hints 'all)

(setq erc-log-channels-directory "~/.erc/logs/")
(setq erc-save-buffer-on-part t)
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

;; (setq erc-format-query-as-channel-p t
;;       erc-track-priority-faces-only 'all
;;       erc-track-faces-priority-list '(erc-error-face
;; 				      erc-current-nick-face
;; 				      erc-keyword-face
;; 				      erc-nick-msg-face
;; 				      erc-direct-msg-face
;; 				      erc-dangerous-host-face
;; 				      erc-notice-face
;; 				      erc-prompt-face))

;; (setq erc-current-nick-highlight-type 'nick)
;; (setq erc-keywords '("\\berc[-a-z]*\\b" "\\bemms[-a-z]*\\b"))

;; (setq erc-track-exclude-types '("JOIN" "PART" "QUIT" "NICK" "MODE"))
;; (setq erc-track-use-faces t)
;; (setq erc-track-faces-priority-list
;;       '(erc-current-nick-face erc-keyword-face))
;; (setq erc-track-priority-faces-only 'all)


(setq erc-join-buffer 'bury)


(setq org-directory "~/org")

(require 'org-protocol)

(setq org-default-notes-file (concat org-directory "/peter.org"))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-capture-templates
      (quote
       (("w"
         "Default template"
         entry
         (file+headline "~/org/peter.org" "Links")
         "* %^{Title}\n\n  Source: %u, %c\n\n  %i"
         :empty-lines 1)
        ;; ... more templates here ...
        )))


(defun my/truncate-eshell-buffers ()
  "Truncates all eshell buffers"
  (interactive)
  (save-current-buffer
    (dolist (buffer (buffer-list t))
      (set-buffer buffer)
      (when (eq major-mode 'eshell-mode)
        (eshell-truncate-buffer)))))

(elpy-enable)

;; After being idle for 5 seconds, truncate all the eshell-buffers if
;; needed. If this needs to be canceled, you can run `(cancel-timer
;; my/eshell-truncate-timer)'
(setq my/eshell-truncate-timer
      (run-with-idle-timer 5 t #'my/truncate-eshell-buffers))

(desktop-save-mode 0)

;; (pdf-tools-install)

(setq dired-listing-switches "-alh")
(add-hook 'dired-mode-hook 'auto-revert-mode)

;;(global-flycheck-mode)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;;(eval-after-load 'flycheck
;;  '(flycheck-purescript-setup))


;; (auto-package-update-maybe)
;; (auto-package-update-at-time "08:00")
;; (setq auto-package-update-interval 1)
;; (setq auto-package-update-delete-old-versions t)

;; (add-hook 'auto-package-update-before-hook
;;           (lambda () (message "I will update packages now")))

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-live-preview-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))
(require 'js-doc)

(setq haskell-process-args-stack-ghci '("--ghci-options=-ferror-spans"))

(setq ensime-startup-notification nil)
(setq ensime-startup-snapshot-notification nil)

;; (use-package ensime
;; 	     :ensure t
;; 	     :pin melpa-stable)

(require 'org)
(require 'sbt-mode)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/organization/personal.org"
			     "~/organization/work.org"
			     "~/organization/tasks.org"
			     )
      )

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'haskell-mode-hook 'intero-mode)

;; specify path to the 'psc-ide' executable
(require 'psc-ide)

(add-hook 'purescript-mode-hook
  (lambda ()
    (psc-ide-mode)
    (company-mode)
    (flycheck-mode)
    (turn-on-purescript-indentation)))

(setq psc-ide-use-npm-bin t)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

(add-hook 'js2-mode-hook
	  #'(lambda ()
	      (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
	      (define-key js2-mode-map "@" 'js-doc-insert-tag)))

(defadvice load-theme (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))

(setq org-list-allow-alphabetical "false")

;; http://stackoverflow.com/questions/2580650/how-can-i-reload-emacs-after-changing-it

(eval-after-load "org"
  '(require 'ox-md nil t))


;; https://noahfrederick.com/log/restclient-for-emacs
;; (use-package restclient
;;   :mode ("\\.http\\'" . restclient-mode))


(setq emerge-diff-options "--ignore-all-space")


;; Ignore compiled Haskell files in filename completions
(add-to-list 'completion-ignored-extensions ".hi")

(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

(setq column-number-mode t)

(global-auto-complete-mode 0)
;; (require 'auto-complete)
;; (define-global-minor-mode my-global-auto-complete-mode auto-complete-mode
;;   (lambda ()
;;     (when (not (memq major-mode
;; 		     (list 'scala-mode 'sbt-mode 'shell)))
;;       (auto-complete-mode))))
;; (my-global-auto-complete-mode 0)



;;(setq ess-use-auto-complete t)
(require 'ensime)
(require 'scala-mode)
;; This step causes the ensime-mode to be started whenever
;; scala-mode2 is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; (add-hook 'scala-mode-hook #'yas-minor-mode)

;; (require 'ensime nil
;; 	 (lambda()
;; 	   (setq ensime-goto-test-config-defaults
;; 		 (plist-put (plist-put ;; TODO: clean up double plist-put
;; 			     ensime-goto-test-config-defaults
;; 			     :test-class-suffixes '("Spec" "Test" "Check"))
;; 			    :test-template-fn 'ensime-template-wordspec))))


;; https://gist.github.com/Scorpil/3821118

;; (setq exec-path (append exec-path (list "/opt/local/bin/" )))
;; (require 'scala-mode-auto) 

;; (add-hook 'scala-mode-hook
;;          '(lambda ()
;;        (scala-mode-feature-electric-mode)
;;           ))

(add-hook 'compilation-filter-hook
          'comint-truncate-buffer)

(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

(setq comint-buffer-maximum-size 4096)


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



(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq eshell-scroll-to-bottom-on-input t)
(setq eshell-scroll-to-bottom-on-output t)

(setq comint-move-point-for-output t)

(yas-global-mode 1)

;; define function to shutdown emacs server instance
;; (defun server-shutdown ()
;;   "Save buffers, Quit, and Shutdown (kill) server"
;;   (interactive)
;;   (save-some-buffers)
;;   (kill-emacs)
;;   )



(setq browse-url-browser-function 'eww-browse-url)

(setq eww-search-prefix "https://www.google.com/search?q=")

;; http://emacs.stackexchange.com/questions/24472/simple-method-for-creating-multiple-eww-buffers
;; Auto-rename new eww buffers
(defun xah-rename-eww-hook ()
  "Rename eww browser's buffer so sites open in new page."
  (rename-buffer "eww" t))
(add-hook 'eww-mode-hook #'xah-rename-eww-hook)

;; (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
;;(global-set-key "\C-xm" 'browse-url-at-point)
(global-set-key "\C-c C-o" 'browse-url-at-point)

(setq w3m-use-cookies t)

(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)

(defun w3m-new-buffer nil
  "Opens a new, empty w3m buffer."
  "As opposed to `w3m-copy-buffer', which opens a non-empty buffer.
 This ought to be snappier, as the old buffer needs not to be rendered.
 To be quite honest, this new function doesn't open a buffer completely
 empty, but visits the about: pseudo-URI that is going to have to
 suffice for now."
  (interactive)
  (w3m-goto-url-new-session "https://www.google.com"))


(defun w3m-yt-view ()
  "View a YouTube link with youtube-dl and mplayer."
  (interactive)
  (let ((url (or (w3m-anchor) (w3m-image))))
    (string-match "[^v]*v.\\([^&]*\\)" url)
    (let* ((vid (match-string 1 url))
           (out (format "%s/%s.mp4" w3m-default-save-directory vid)))
      (call-process "youtube-dl" nil nil nil "-U" "-q" "-c" "-o" out url)
      (start-process "mplayer" nil "mplayer" "-quiet" out))))



(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
;; (add-hook 'clojure-mode-hook           #'enable-paredit-mode)

(require 'smartparens-config)
(add-hook 'clojure-mode-hook  #'smartparens-strict-mode)

;; http://www.emacswiki.org/emacs/WinnerMode
(when (fboundp 'winner-mode)
  (winner-mode 1))

(defun kill-emacs-safe ()
  "Only exit Emacs if this is a small session, otherwise prompt."
  (interactive)
  (if (daemonp)
      (delete-frame)
    (let ((count-buffers (length (buffer-list))))
      (if (< count-buffers 10)
          (save-buffers-kill-emacs)
        (message-box "use 'M-x exit'")))))



(setq magit-last-seen-setup-instructions "1.4.0")
(setq magit-auto-revert-mode 1)

(setq resize-mini-windows nil)
;; (setq max-mini-window-height 2)

;; http://stackoverflow.com/questions/3447531/emacs-ess-version-of-clear-console
(defun clear-shell ()
   (interactive)
   (let ((old-max comint-buffer-maximum-size))
     (setq comint-buffer-maximum-size 0)
     (comint-truncate-buffer)
     (setq comint-buffer-maximum-size old-max))) 

(custom-set-variables
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
)

(setq js-indent-level 2)

;; http://stackoverflow.com/questions/704616/something-wrong-with-emacs-shell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
 (add-hook 'eshell-preoutput-filter-functions
           'ansi-color-filter-apply)
(setq ring-bell-function 'ignore)
(setq twittering-use-master-password t)
(setq twittering-icon-mode t)
(setq twittering-convert-fix-size "24")

;; https://www.masteringemacs.org/article/keeping-secrets-in-emacs-gnupg-auth-sources
(setq epg-gpg-program "gpg2")



(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))


(plist-put org-format-latex-options :scale 1.5)

(defun kdm/org-save-and-export ()
  (interactive)
  (if (eq major-mode 'org-mode)
    (org-latex-export-to-latex)))

(add-hook 'after-save-hook 'kdm/org-save-and-export nil)
