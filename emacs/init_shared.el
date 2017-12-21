(load "~/dotfiles/emacs/custom_commands.el")
(load "~/dotfiles/emacs/auctex_related.el")
(load "~/dotfiles/emacs/package_list.el")

(setq use-package-always-ensure t)

(require 'helm-config)

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

;;(newsticker-start)

;;(twit)

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
         auto-package-update-interval 1)
   (auto-package-update-maybe))

(defadvice load-theme (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))


;; http://stackoverflow.com/questions/2580650/how-can-i-reload-emacs-after-changing-it

;; https://noahfrederick.com/log/restclient-for-emacs
;; (use-package restclient
;;   :mode ("\\.http\\'" . restclient-mode))

(setq dired-dwim-target t)

(setq emerge-diff-options "--ignore-all-space")

(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

(setq column-number-mode t)

(global-auto-complete-mode nil)
;; (require 'auto-complete)
;; (define-global-minor-mode my-global-auto-complete-mode auto-complete-mode
;;   (lambda ()
;;     (when (not (memq major-mode
;; 		     (list 'scala-mode 'sbt-mode 'shell)))
;;       (auto-complete-mode))))
;; (my-global-auto-complete-mode 0)

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

(defun kill-emacs-safe ()
  "Only exit Emacs if this is a small session, otherwise prompt."
  (interactive)
  (if (daemonp)
      (delete-frame)
    (let ((count-buffers (length (buffer-list))))
      (if (< count-buffers 10)
          (save-buffers-kill-emacs)
        (message-box "use 'M-x exit'")))))

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


(load "~/dotfiles/emacs/areas/c.el")
(load "~/dotfiles/emacs/areas/git.el")
(load "~/dotfiles/emacs/areas/haskell.el")
(load "~/dotfiles/emacs/areas/irc.el")
(load "~/dotfiles/emacs/areas/javascript.el")
(load "~/dotfiles/emacs/areas/lisp.el")
(load "~/dotfiles/emacs/areas/markdown.el")
(load "~/dotfiles/emacs/areas/org.el")
(load "~/dotfiles/emacs/areas/purescript.el")
(load "~/dotfiles/emacs/areas/proof-general.el")
(load "~/dotfiles/emacs/areas/python.el")
(load "~/dotfiles/emacs/areas/scala.el")
(load "~/dotfiles/emacs/areas/shell.el")
(load "~/dotfiles/emacs/areas/web.el")
(load "~/dotfiles/emacs/areas/twitter.el")
(load "~/dotfiles/emacs/areas/epub.el")
(load "~/dotfiles/emacs/areas/java.el")

(setq newsticker-url-list
      (quote
       (
	("Reuters top news" "http://feeds.reuters.com/reuters/topNews" nil 1800 nil)
	("Reuters US news" "http://feeds.reuters.com/Reuters/domesticNews" nil 1800 nil)
	("Reuters World news" "http://feeds.reuters.com/Reuters/worldNews" nil 1800 nil)
	("Google News Top Stories" "https://news.google.com/news?cf=all&hl=en&pz=1&ned=us&authuser=1&output=rss" nil 1800 nil)
	("Google News Los Angeles" "https://news.google.com/news?cf=all&hl=en&pz=1&ned=us&authuser=1&geo=Los+Angeles,+CA,+United+States&output=rss" nil 1800 nil)
	("Google News nearby" "https://news.google.com/news?cf=all&hl=en&pz=1&ned=us&authuser=1&geo=detect_metro_area&output=rss" nil 1800 nil)
	("Hacker News" "https://news.ycombinator.com/rss" nil 1800 nil)
	("Slashdot" "http://rss.slashdot.org/Slashdot/slashdotMain" nil 1800 nil)
	("The Hill most popular" "http://www.thehill.com/rss/syndicator/19110" nil 1800 nil)
	("The Hill all news" "http://www.thehill.com/rss/syndicator/19109" nil 1800 nil)
	("NYT" "http://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml" nil 1800 nil)
	)
       ))

;; (use-package zenburn-theme)
;; (use-package espresso-theme)
;; (use-package leuven-theme)
;; (use-package moe-theme)
;; (use-package solarized-theme)

