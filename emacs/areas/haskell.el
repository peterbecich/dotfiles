
;; (setq lsp-haskell-process-path-hie "hie-wrapper")
(require 'lsp)
(require 'lsp-haskell)

;; (add-hook 'haskell-mode-hook #'lsp)

(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(add-hook 'haskell-mode-hook 'flycheck-mode)


;; Ignore compiled Haskell files in filename completions
(add-to-list 'completion-ignored-extensions ".hi")

(define-key haskell-mode-map (kbd "\C-cb") 'hasky-stack-build)

;; (define-key haskell-mode-map "\C-ch" 'helm-hoogle)

;; (global-set-key (kbd "\C-ch") 'helm-hoogle)


(setq haskell-tags-on-save nil)

(setq tags-revert-without-query 1)

(require 'hasky-stack)

(global-set-key (kbd "\C-c H e") #'hasky-stack-execute)
(global-set-key (kbd "\C-c H h") #'hasky-stack-package-action)
(global-set-key (kbd "\C-c H i") #'hasky-stack-new)


(setq haskell-stylish-on-save nil)
;; (setq lsp-haskell-process-path-hie "hie-wrapper")
