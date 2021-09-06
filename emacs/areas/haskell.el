
;; (setq lsp-haskell-process-path-hie "hie-wrapper")
(require 'lsp)
(require 'lsp-haskell)

;; (add-hook 'haskell-mode-hook #'lsp)

;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)

(add-hook 'lsp-mode 'lsp-ui-sideline-mode)

(add-hook 'haskell-mode-hook 'flycheck-mode)


;; Ignore compiled Haskell files in filename completions
(add-to-list 'completion-ignored-extensions ".hi")

(define-key haskell-mode-map (kbd "\C-cb") 'hasky-stack-build)


(setq haskell-tags-on-save nil)

(setq tags-revert-without-query 1)

(setq haskell-stylish-on-save nil)

(defun haskell-mode-format-imports ()
  "Format the imports by aligning and sorting them."
  (interactive)
  (haskell-mode-stylish-buffer)
)

(setq haskell-font-lock-quasi-quote-modes nil)

;; https://gist.github.com/unhammer/edd926fff70af71d1c77ed73461d55a9#file-init-haskell-el-L112-L133
;; Smartparens:
(add-hook 'smartparens-mode-hook
          (lambda ()
            (add-to-list 'sp-no-reindent-after-kill-modes #'haskell-mode)
            (require 'smartparens-haskell) ; should add {-# #-}
            (sp-local-pair 'haskell-mode "'" nil :actions nil)
            (sp-local-pair 'haskell-mode "\\(" nil :actions nil)
            (sp-local-pair 'interactive-haskell-mode "\\(" nil :actions nil)
            (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)))
(defun no-indent-line-function-in-haskell (orig-fun &rest args)
  (let ((indent-region-function (if (eq major-mode 'haskell-mode)
                                    (lambda (_ __))
                                  indent-region-function))
        (indent-line-function (if (eq major-mode 'haskell-mode)
                                  (lambda ())
                                indent-line-function)))
    (apply orig-fun args)))
(advice-add #'evil-sp-change :around #'no-indent-line-function-in-haskell)
(advice-add #'evil-sp-delete :around #'no-indent-line-function-in-haskell)
(advice-add #'evil-sp-delete-line :around #'no-indent-line-function-in-haskell)
(advice-add #'sp-kill-word :around #'no-indent-line-function-in-haskell)
(advice-add #'sp-forward-slurp-sexp :around #'no-indent-line-function-in-haskell)
(advice-add #'sp--indent-region :around #'no-indent-line-function-in-haskell)
