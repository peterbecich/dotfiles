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

(setq comint-buffer-maximum-size 2048)

(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq eshell-scroll-to-bottom-on-input t)
(setq eshell-scroll-to-bottom-on-output t)

(setq comint-move-point-for-output t)

;; (defun clear-shell ()
;;    (interactive)
;;    (let ((old-max comint-buffer-maximum-size))
;;      (setq comint-buffer-maximum-size 0)
;;      (comint-truncate-buffer)
;;      (setq comint-buffer-maximum-size old-max)))

;; (setenv "TERM" "xterm-256color")

;; (add-hook
;;  'eshell-mode-hook
;;  (lambda ()
;;    (setq pcomplete-cycle-completions nil)))

;; http://stackoverflow.com/questions/704616/something-wrong-with-emacs-shell
;; (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)

;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; (add-hook 'eshell-preoutput-filter-functions
;; 	  'ansi-color-filter-apply)

;; (add-to-list
;;          'comint-preoutput-filter-functions
;;          (lambda (output)
;;            (replace-regexp-in-string "\\[[0-9]+[GK]" "" output)))


;; (setq comint-output-filter-functions
;;       (remove 'ansi-color-process-output comint-output-filter-functions))

;; (add-hook 'shell-mode-hook
;;           (lambda ()
;;             ;; Disable font-locking in this buffer to improve performance
;;             (font-lock-mode -1)
;;             ;; Prevent font-locking from being re-enabled in this buffer
;;             (make-local-variable 'font-lock-function)
;;             (setq font-lock-function (lambda (_) nil))
;;             (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter nil t)))

;; Also set TERM accordingly (xterm-256color)

;; You can also use it with eshell (and thus get color output from system ls):

(require 'eshell)

;; (add-hook 'eshell-before-prompt-hook
;;           (lambda ()
;;             (setq xterm-color-preserve-properties t)))

;; (add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
;; (setq eshell-output-filter-functions (remove 'eshell-handle-ansi-color eshell-output-filter-functions))

;; (setenv "TERM" "xterm-256color")

;; (setq compilation-environment '("TERM=xterm-256color"))

;; (add-hook 'compilation-start-hook
;;           (lambda (proc)
;;             ;; We need to differentiate between compilation-mode buffers
;;             ;; and running as part of comint (which at this point we assume
;;             ;; has been configured separately for xterm-color)
;;             (when (eq (process-filter proc) 'compilation-filter)
;;               ;; This is a process associated with a compilation-mode buffer.
;;               ;; We may call `xterm-color-filter' before its own filter function.
;;               (set-process-filter
;;                proc
;;                (lambda (proc string)
;;                  (funcall 'compilation-filter proc
;;                           (xterm-color-filter string)))))))


;; ;; https://github.com/syl20bnr/spacemacs/issues/6854
(add-hook 'compilation-mode-hook (lambda() (font-lock-mode -1)))
