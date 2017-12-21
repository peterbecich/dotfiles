(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)



;; (require 'rtags)

(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)
(add-hook 'objc-mode-hook 'rtags-start-process-unless-running)

;; (require 'company-rtags)

;; (setq rtags-completions-enabled t)
;; (eval-after-load 'company
;;   '(add-to-list
;;     'company-backends 'company-rtags))
;; (setq rtags-autostart-diagnostics t)
;; (rtags-enable-standard-keybindings)

;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; (add-hook 'irony-mode-hook 'company-mode)

;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)

;; (add-hook 'c++-mode-hook 'flycheck-mode)
;; (add-hook 'c-mode-hook 'flycheck-mode)

;; (defun my-irony-mode-hook ()
;;   (define-key irony-mode-map [remap completion-at-point]
;;     'irony-completion-at-point-async)
;;   (define-key irony-mode-map [remap complete-symbol]
;;     'irony-completion-at-point-async))

;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
;; (setq company-backends (delete 'company-semantic company-backends))

;; (require 'company-irony-c-headers)
;; (eval-after-load 'company
;;   '(add-to-list
;;     'company-backends '(company-irony-c-headers company-irony)))


;; ;; (require 'flycheck-rtags)

;; (defun my-flycheck-rtags-setup ()
;;   (flycheck-select-checker 'rtags)
;;   (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
;;   (setq-local flycheck-check-syntax-automatically nil))
;; ;; c-mode-common-hook is also called by c++-mode
;; (add-hook 'c-mode-common-hook #'my-flycheck-rtags-setup)

;; (eval-after-load 'flycheck
;;   '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))


;; (eval-after-load 'cc-mode
;;   '(progn
;;      (require 'rtags)
;;      (mapc (lambda (x)
;;              (define-key c-mode-base-map
;;                (kbd (concat "C-c r " (car x))) (cdr x)))
;;            '(("." . rtags-find-symbol-at-point)
;;              ("," . rtags-find-references-at-point)
;;              ("v" . rtags-find-virtuals-at-point)
;;              ("V" . rtags-print-enum-value-at-point)
;;              ("/" . rtags-find-all-references-at-point)
;;              ("Y" . rtags-cycle-overlays-on-screen)
;;              (">" . rtags-find-symbol)
;;              ("<" . rtags-find-references)
;;              ("-" . rtags-location-stack-back)
;;              ("+" . rtags-location-stack-forward)
;;              ("D" . rtags-diagnostics)
;;              ("G" . rtags-guess-function-at-point)
;;              ("p" . rtags-set-current-project)
;;              ("P" . rtags-print-dependencies)
;;              ("e" . rtags-reparse-file)
;;              ("E" . rtags-preprocess-file)
;;              ("R" . rtags-rename-symbol)
;;              ("M" . rtags-symbol-info)
;;              ("S" . rtags-display-summary)
;;              ("O" . rtags-goto-offset)
;;              (";" . rtags-find-file)
;;              ("F" . rtags-fixit)
;;              ("X" . rtags-fix-fixit-at-point)
;;              ("B" . rtags-show-rtags-buffer)
;;              ("I" . rtags-imenu)
;;              ("T" . rtags-taglist)))))
