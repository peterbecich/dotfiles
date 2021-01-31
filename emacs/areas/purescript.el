;; specify path to the 'psc-ide' executable
(require 'psc-ide)

;; (add-hook 'purescript-mode-hook
;;   (lambda ()
;;     (psc-ide-mode)
;;     (company-mode)
;;     (flycheck-mode)
;;     (turn-on-purescript-indentation)))

;; (setq psc-ide-use-npm-bin nil)
;; (setq psc-ide-use-purs t)
;;(setq psc-ide-use-purs nil)


;;(eval-after-load 'flycheck
;;  '(flycheck-purescript-setup))

 ;; '(psc-ide-purs-executable "/home/peterbecich/.npm-global/bin/purs")
 ;; '(psc-ide-use-purs t)
 ;; '(purescript-indent-offset 2)

;; (add-hook 'purescript-mode-hook 'inferior-psci-mode)
;; (require 'repl-toggle)
;; (require 'psci)
;;(add-to-list 'rtog/mode-repl-alist '(purescript-mode . psci))


;; (add-hook 'purescript-mode-hook 'purescript-decl-scan-mode)

(eval-after-load 'js-mode
  '(add-hook 'js-mode-hook #'add-node-modules-path))

;; (eval-after-load 'purescript-mode
;;   '(add-hook 'purescript-mode-hook #'add-node-modules-path))

(add-hook 'purescript-mode-hook #'add-node-modules-path)
