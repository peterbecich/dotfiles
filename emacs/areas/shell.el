(defun my/truncate-eshell-buffers ()
  "Truncates all eshell buffers"
  (interactive)
  (save-current-buffer
    (dolist (buffer (buffer-list t))
      (set-buffer buffer)
      (when (eq major-mode 'eshell-mode)
        (eshell-truncate-buffer)))))

;; After being idle for 5 seconds, truncate all the eshell-buffers if
;; needed. If this needs to be canceled, you can run `(cancel-timer
;; my/eshell-truncate-timer)'
(setq my/eshell-truncate-timer
      (run-with-idle-timer 5 t #'my/truncate-eshell-buffers))


(add-hook 'compilation-filter-hook
          'comint-truncate-buffer)

(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

(setq comint-buffer-maximum-size 8192)

(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq eshell-scroll-to-bottom-on-input t)
(setq eshell-scroll-to-bottom-on-output t)

(setq comint-move-point-for-output t)

(defun clear-shell ()
   (interactive)
   (let ((old-max comint-buffer-maximum-size))
     (setq comint-buffer-maximum-size 0)
     (comint-truncate-buffer)
     (setq comint-buffer-maximum-size old-max))) 


(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))

;; http://stackoverflow.com/questions/704616/something-wrong-with-emacs-shell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'eshell-preoutput-filter-functions
	  'ansi-color-filter-apply)

(add-to-list
         'comint-preoutput-filter-functions
         (lambda (output)
           (replace-regexp-in-string "\\[[0-9]+[GK]" "" output)))
