;; specify path to the 'psc-ide' executable
(require 'psc-ide)

(add-hook 'purescript-mode-hook
  (lambda ()
    (psc-ide-mode)
    (company-mode)
    (flycheck-mode)
    (turn-on-purescript-indentation)))

;; (setq psc-ide-use-npm-bin nil)
;; (setq psc-ide-use-purs t)
;;(setq psc-ide-use-purs nil)


;;(eval-after-load 'flycheck
;;  '(flycheck-purescript-setup))

 ;; '(psc-ide-purs-executable "/home/peterbecich/.npm-global/bin/purs")
 ;; '(psc-ide-use-purs t)
 ;; '(purescript-indent-offset 2)
