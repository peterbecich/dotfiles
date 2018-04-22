

;; (require 'js-doc)

(setq js-indent-level 2)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; (add-hook 'js2-mode-hook
;; 	  #'(lambda ()
;; 	      (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
;; 	      (define-key js2-mode-map "@" 'js-doc-insert-tag)))


;; (require 'js2-refactor)
;; (add-hook 'js2-mode-hook #'js2-refactor-mode)
;; (js2r-add-keybindings-with-modifier "C-s-")
;; eg. extract function with `C-s-e C-s-f`.
(eval-after-load 'js2-mode
  (add-hook 'js2-mode-hook
            (lambda()
              (js-format-setup "jsb"))))

(js-format-setup "jsb")

(global-set-key (kbd "M-,") 'js-format-mark-statement)
(global-set-key (kbd "C-x j j") 'js-format-region)
(global-set-key (kbd "C-x j b") 'js-format-buffer)
