
;; (add-hook 'haskell-mode-hook 'hlint-refactor-mode)
(add-hook 'haskell-mode-hook #'smartparens-mode)
;; (setq haskell-process-args-stack-ghci '("--ghci-options=-ferror-spans"))
(add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

(add-hook 'haskell-mode-hook 'flycheck-mode)

(add-hook 'haskell-mode-hook 'flyspell-prog-mode)

;; Ignore compiled Haskell files in filename completions
(add-to-list 'completion-ignored-extensions ".hi")


(define-key haskell-mode-map "\C-ch" 'haskell-hoogle)

(require 'shm)

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
