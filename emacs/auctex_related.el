;; ;; ;; AucTeX
;; ;; (setq TeX-auto-save t)
;; ;; (setq TeX-parse-self t)
;; ;; (setq-default TeX-master nil)
;; ;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; ;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; ;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; ;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; ;; (setq reftex-plug-into-AUCTeX t)
;; ;; (setq TeX-PDF-mode t)

;; ;; Use Skim as viewer, enable source <-> PDF sync
;; ;; make latexmk available via C-c C-c
;; ;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
;; (add-hook 'LaTeX-mode-hook (lambda ()
;; 			     (push
;; 			      '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
;; 				:help "Run latexmk on file")
;; 			      TeX-command-list)))
;; (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))


;; ;;; AUCTeX
;; ;; Customary Customization, p. 1 and 16 in the manual, and http://www.emacswiki.org/emacs/AUCTeX#toc2
;; (setq TeX-parse-self t); Enable parse on load.
;; (setq TeX-auto-save t); Enable parse on save.
;; (setq-default TeX-master nil)

;; (setq TeX-PDF-mode t); PDF mode (rather than DVI-mode)

;; (add-hook 'TeX-mode-hook 'flyspell-mode); Enable Flyspell mode for TeX modes such as AUCTeX. Highlights all misspelled words.
;; (add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode); Enable Flyspell program mode for emacs lisp mode, which highlights all misspelled words in comments and strings.
;; (setq ispell-dictionary "english"); Default dictionary. To change do M-x ispell-change-dictionary RET.
;; (add-hook 'TeX-mode-hook
;;           (lambda () (TeX-fold-mode 1))); Automatically activate TeX-fold-mode.
;; (setq LaTeX-babel-hyphen nil); Disable language-specific hyphen insertion.

;; ;; " expands into csquotes macros (for this to work babel must be loaded after csquotes).
;; (setq LaTeX-csquotes-close-quote "}"
;;       LaTeX-csquotes-open-quote "\\enquote{")

;; ;; LaTeX-math-mode http://www.gnu.org/s/auctex/manual/auctex/Mathematics.html
;; (add-hook 'TeX-mode-hook 'LaTeX-math-mode)

;; ;;; RefTeX
;; ;; Turn on RefTeX for AUCTeX http://www.gnu.org/s/auctex/manual/reftex/reftex_5.html
;; (add-hook 'TeX-mode-hook 'turn-on-reftex)
