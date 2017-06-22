

(require 'js-doc)

(setq js-indent-level 2)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'js2-mode-hook
	  #'(lambda ()
	      (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
	      (define-key js2-mode-map "@" 'js-doc-insert-tag)))


