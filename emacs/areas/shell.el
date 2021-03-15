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

(setq comint-buffer-maximum-size 40960)

(define-key vterm-mode-map (kbd "<C-backspace>")
  (lambda () (interactive) (vterm-send-key (kbd "C-w"))))

(defun vterm-counsel-yank-pop-action (orig-fun &rest args)
  (if (equal major-mode 'vterm-mode)
      (let ((inhibit-read-only t)
            (yank-undo-function (lambda (_start _end) (vterm-undo))))
        (cl-letf (((symbol-function 'insert-for-yank)
               (lambda (str) (vterm-send-string str t))))
            (apply orig-fun args)))
    (apply orig-fun args)))

(advice-add 'counsel-yank-pop-action :around #'vterm-counsel-yank-pop-action)
