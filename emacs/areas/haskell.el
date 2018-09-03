
(add-hook 'haskell-mode-hook 'hlint-refactor-mode)
(add-hook 'haskell-mode-hook #'smartparens-mode)
(setq haskell-process-args-stack-ghci '("--ghci-options=-ferror-spans"))
(add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)

;; (eval-after-load 'flycheck
;;   '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

;;(add-hook 'haskell-mode-hook #'flycheck-haskell-setup)

;; (add-to-list 'load-path "<path to lsp-haskell>")
;; (add-to-list 'load-path "<path to lsp-mode>")
;; (add-to-list 'load-path "<path to lsp-ui")

;; (require 'lsp-ui)
;; (require 'lsp-haskell)
;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;; (add-hook 'haskell-mode-hook #'lsp-haskell-enable)

(add-hook 'haskell-mode-hook 'flycheck-mode)


;; (add-hook 'haskell-mode-hook 'flyspell-prog-mode)

;; Ignore compiled Haskell files in filename completions
(add-to-list 'completion-ignored-extensions ".hi")

(define-key haskell-mode-map (kbd "\C-cb") 'hasky-stack-build)

(define-key haskell-mode-map "\C-ch" 'helm-hoogle)

(global-set-key (kbd "\C-ch") 'helm-hoogle)


;; (require 'shm)

(add-hook 'haskell-mode-hook 'structured-haskell-mode)
;; https://github.com/haskell/haskell-mode/issues/90

(remove-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(remove-hook 'haskell-mode-hook 'haskell-indentation-mode)
(remove-hook 'haskell-mode-hook 'haskell-indent-mode)

(add-hook 'haskell-mode-hook (lambda ()
            (haskell-indentation-mode 0)))

(require 'hindent)
(add-hook 'haskell-mode-hook #'hindent-mode)
(setq haskell-tags-on-save t)

(setq tags-revert-without-query 1)

(require 'hasky-stack)

(global-set-key (kbd "\C-c H e") #'hasky-stack-execute)
(global-set-key (kbd "\C-c H h") #'hasky-stack-package-action)
(global-set-key (kbd "\C-c H i") #'hasky-stack-new)


(setq haskell-stylish-on-save nil)







;;  (defun intero-repl-buffer (prompt-options &optional store-previous)
;;    "Start the REPL buffer.
;;  If PROMPT-OPTIONS is non-nil, prompt with an options list.  When
;;  STORE-PREVIOUS is non-nil, note the caller's buffer in
;;  `intero-repl-previous-buffer'."
;;    (let* ((root (intero-project-root))
;;           (package-name (intero-package-name))
;;           (name (format "*intero:%s:%s:repl*"
;;                         (file-name-nondirectory root)
;;                         package-name))
;;          (initial-buffer (current-buffer))
;;          (backend-buffer (intero-buffer 'backend)))
;;     (with-current-buffer
;;         (or (get-buffer name)
;;             (with-current-buffer
;;                 (get-buffer-create name)
;;               ;; The new buffer doesn't know if the initial buffer was hosted
;;                ;; remotely or not, so we need to extend by the host of the
;;                ;; initial buffer to cd. We could also achieve this by setting the
;;                ;; buffer's intero-buffer-host, but intero-repl-mode wipes this, so
;;                ;; we defer setting that until after.
;;                (cd (intero-extend-path-by-buffer-host root initial-buffer))
;;                (intero-repl-mode) ; wipes buffer-local variables
;;                (intero-inherit-local-variables initial-buffer)
;;                (setq intero-buffer-host (intero-buffer-host initial-buffer))
;;                (intero-repl-mode-start backend-buffer
;;                                        (buffer-local-value 'intero-targets backend-buffer)
;;                                        prompt-options
;;                                        (buffer-local-value 'intero-stack-yaml backend-buffer))
;;                (current-buffer)))
;;        (progn
;;          (when store-previous
;;            (setq intero-repl-previous-buffer initial-buffer))
;; (current-buffer)))))


(add-hook 'haskell-mode-hook 'fci-mode)
