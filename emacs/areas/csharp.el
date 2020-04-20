
(add-hook 'csharp-mode-hook 'omnisharp-mode)


(eval-after-load
 'company
 '(add-to-list 'company-backends 'company-omnisharp))

(add-hook 'csharp-mode-hook #'company-mode)

(add-hook 'csharp-mode-hook #'flycheck-mode)
