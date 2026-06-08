
(add-hook 'lsp-mode 'lsp-ui-sideline-mode)

(add-hook 'haskell-mode-hook 'flycheck-mode)


;; Ignore compiled Haskell files in filename completions
(add-to-list 'completion-ignored-extensions ".hi")


