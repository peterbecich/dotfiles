
;; (add-hook 'haskell-mode-hook 'hlint-refactor-mode)
;; (add-hook 'haskell-mode-hook #'smartparens-mode)
;; (setq haskell-process-args-stack-ghci '("--ghci-options=-ferror-spans"))
(add-hook 'haskell-mode-hook 'intero-mode)
;; (add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)

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

;; (define-key haskell-mode-map "\M-p" 'flycheck-previous-error)
;; (define-key haskell-mode-map "\M-n" 'flycheck-next-error)


;; (require 'shm)

;; (add-hook 'haskell-mode-hook 'structured-haskell-mode)
;; https://github.com/haskell/haskell-mode/issues/90

;; (remove-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (remove-hook 'haskell-mode-hook 'haskell-indentation-mode)
;; (remove-hook 'haskell-mode-hook 'haskell-indent-mode)

;; (add-hook 'haskell-mode-hook (lambda ()
;;             (haskell-indentation-mode 0)))

;; (require 'hindent)
;; (add-hook 'haskell-mode-hook #'hindent-mode)

(setq haskell-tags-on-save t)

(setq tags-revert-without-query 1)

(require 'hasky-stack)

(global-set-key (kbd "\C-c H e") #'hasky-stack-execute)
(global-set-key (kbd "\C-c H h") #'hasky-stack-package-action)
(global-set-key (kbd "\C-c H i") #'hasky-stack-new)


(setq haskell-stylish-on-save nil)


;; (add-hook 'haskell-mode-hook 'fci-mode)

(add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'haskell-mode-hook 'intero-mode-whitelist)
