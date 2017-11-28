
(setq ensime-eldoc-hints 'all)

;;(setq ess-use-auto-complete t)
;; (require 'ensime)
;;(require 'scala-mode)
;; This step causes the ensime-mode to be started whenever
;; scala-mode2 is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; (add-hook 'scala-mode-hook #'yas-minor-mode)

;; (require 'ensime nil
;; 	 (lambda()
;; 	   (setq ensime-goto-test-config-defaults
;; 		 (plist-put (plist-put ;; TODO: clean up double plist-put
;; 			     ensime-goto-test-config-defaults
;; 			     :test-class-suffixes '("Spec" "Test" "Check"))
;; 			    :test-template-fn 'ensime-template-wordspec))))


;; https://gist.github.com/Scorpil/3821118

;; (setq exec-path (append exec-path (list "/opt/local/bin/" )))
;; (require 'scala-mode-auto) 

;; (add-hook 'scala-mode-hook
;;          '(lambda ()
;;        (scala-mode-feature-electric-mode)
;;           ))

(setq ensime-startup-notification nil)
(setq ensime-startup-snapshot-notification nil)

;; (require 'sbt-mode)

;; (use-package ensime
;; 	     :ensure t
;; 	     :pin melpa-stable)
