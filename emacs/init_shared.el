(load "~/dotfiles/emacs/custom_commands.el")
(load "~/dotfiles/emacs/auctex_related.el")
(load "~/dotfiles/emacs/package_list.el")


(setq dired-listing-switches "-alh")

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


(require 'package)
(setq package-enable-at-startup nil) ; To avoid initializing twice
(package-initialize)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("org-mode" . "http://orgmode.org/elpa/")
			 )
      )


;; (auto-package-update-maybe)
;; (setq auto-package-update-interval 3)
;; (add-hook 'auto-package-update-before-hook
;;           (lambda () (message "I will update packages now")))



(require 'org)
(require 'sbt-mode)
(require 'ensime)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/organization/personal.org"
			     "~/organization/work.org"
			     "~/organization/tasks.org"
			     )
      )


(defadvice load-theme (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))

(setq org-list-allow-alphabetical "false")

;; http://stackoverflow.com/questions/2580650/how-can-i-reload-emacs-after-changing-it

(eval-after-load "org"
  '(require 'ox-md nil t))

(setq emerge-diff-options "--ignore-all-space")

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

(add-hook 'haskell-mode-hook 'haskell-indent-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)


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

;;(global-auto-complete-mode t)
(require 'auto-complete)
(define-global-minor-mode my-global-auto-complete-mode auto-complete-mode
  (lambda ()
    (when (not (memq major-mode
		     (list 'scala-mode 'sbt-mode 'shell)))
      (auto-complete-mode))))
(my-global-auto-complete-mode 1)



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
(setq comint-buffer-maximum-size 1000)


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
(setq comint-move-point-for-output t)

(yas-global-mode 1)

;; define function to shutdown emacs server instance
;; (defun server-shutdown ()
;;   "Save buffers, Quit, and Shutdown (kill) server"
;;   (interactive)
;;   (save-some-buffers)
;;   (kill-emacs)
;;   )



(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
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

;;(setq resize-mini-windows nil)
(setq max-mini-window-height 2)

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


