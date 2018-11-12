
(add-hook 'emacs-lisp-mode-hook 'highlight-defined-mode)


;; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;; (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
;; (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
;; (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
;; (add-hook 'clojure-mode-hook           #'enable-paredit-mode)

(require 'smartparens-config)
(add-hook 'clojure-mode-hook  #'smartparens-strict-mode)


(define-key smartparens-mode-map (kbd "C-M-<right>") 'sp-forward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-M-<left>") 'sp-forward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-S-M-<left>") 'sp-backward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-S-M-<right>") 'sp-backward-barf-sexp)

(add-hook 'prog-mode-hook #'smartparens-mode)
