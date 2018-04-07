
(add-hook 'haskell-mode-hook 'intero-mode)


;; (setq haskell-process-args-stack-ghci '("--ghci-options=-ferror-spans"))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

;; Ignore compiled Haskell files in filename completions
(add-to-list 'completion-ignored-extensions ".hi")


(define-key haskell-mode-map "\C-ch" 'haskell-hoogle)

(require 'shm)

(add-hook 'haskell-mode-hook 'structured-haskell-mode)
