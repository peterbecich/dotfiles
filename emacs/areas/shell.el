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

;; (define-key vterm-mode-map (kbd "<C-backspace>")
;;   (lambda () (interactive) (vterm-send-key (kbd "C-w"))))

;; (defun vterm-counsel-yank-pop-action (orig-fun &rest args)
;;   (if (equal major-mode 'vterm-mode)
;;       (let ((inhibit-read-only t)
;;             (yank-undo-function (lambda (_start _end) (vterm-undo))))
;;         (cl-letf (((symbol-function 'insert-for-yank)
;;                (lambda (str) (vterm-send-string str t))))
;;             (apply orig-fun args)))
;;     (apply orig-fun args)))

;; (advice-add 'counsel-yank-pop-action :around #'vterm-counsel-yank-pop-action)


(setq comint-output-filter-functions
      (remove 'ansi-color-process-output comint-output-filter-functions))

(add-hook 'shell-mode-hook
          (lambda ()
            ;; Disable font-locking in this buffer to improve performance
            (font-lock-mode -1)
            ;; Prevent font-locking from being re-enabled in this buffer
            (make-local-variable 'font-lock-function)
            (setq font-lock-function (lambda (_) nil))
            (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter nil t)))

(with-eval-after-load 'esh-mode
  (add-hook 'eshell-mode-hook
          (lambda () (progn
            (setq xterm-color-preserve-properties t)
            (setenv "TERM" "xterm-256color"))))

  (add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)

  (setq eshell-output-filter-functions
  (remove 'eshell-handle-ansi-color eshell-output-filter-functions))
)



;; (add-hook 'vterm-mode-hook
;;           (lambda ()
;;             ;; Disable font-locking in this buffer to improve performance
;;             (font-lock-mode -1)
;;             ;; Prevent font-locking from being re-enabled in this buffer
;;             (make-local-variable 'font-lock-function)
;;             (setq font-lock-function (lambda (_) nil))
;;             (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter nil t)))
