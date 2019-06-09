;; (require 'eclim)

;; (require 'company-emacs-eclim)
;; (company-emacs-eclim-setup)
;;(global-company-mode t)

;; (require 'eclim)
;; (setq eclimd-autostart t)

;; (defun my-java-mode-hook ()
;;     (eclim-mode t))

;; (add-hook 'java-mode-hook 'my-java-mode-hook)

;; (require 'company)
;; (require 'company-emacs-eclim)
;; (company-emacs-eclim-setup)

;; (setq auto-mode-alist
;;       (append '(("\\.java\\'" . jdee-mode)) auto-mode-alist))
 

(add-hook 'java-mode-hook #'smartparens-mode)
(add-hook 'java-mode-hook 'flycheck-mode)


;; (require 'eclim)
;; (setq eclimd-autostart t)

;; (defun my-java-mode-hook ()
;;    (eclim-mode t))

;; (add-hook 'java-mode-hook 'my-java-mode-hook)

(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
