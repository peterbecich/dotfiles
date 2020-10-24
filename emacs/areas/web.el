;; (setq browse-url-browser-function 'browse-url-firefox)
;; (setq browse-url-browser-function 'eww-browse-url)

;; (setq browse-url-browser-function 'browse-url-generic)
;; (setq browse-url-generic-program "firefox")
;; (setq browse-url-generic-program "open -a /Applications/Firefox\ Developer\ Edition.app/")

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


