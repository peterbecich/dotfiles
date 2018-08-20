

;; (require 'js-doc)

(setq js-indent-level 2)

(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
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


(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
;; (setq company-tooltip-align-annotations t)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; (use-package tide
;;   :ensure t
;;   :after (typescript-mode company flycheck)
;;   :hook ((typescript-mode . tide-setup)
;;          (typescript-mode . tide-hl-identifier-mode)
;;          (before-save . tide-format-before-save)))


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (tide-setup))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)
