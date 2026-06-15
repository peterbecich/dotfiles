;;; csharp.el --- C# settings -*- lexical-binding: t; -*-


(add-hook 'csharp-mode-hook #'company-mode)

(add-hook 'csharp-mode-hook #'flycheck-mode)
