(setq org-directory "~/org")

(require 'org-protocol)

(setq org-default-notes-file (concat org-directory "/peter.org"))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-capture-templates
      (quote
       (("w"
         "Default template"
         entry
         (file+headline "~/org/peter.org" "Links")
         "* %^{Title}\n\n  Source: %u, %c\n\n  %i"
         :empty-lines 1)
        ;; ... more templates here ...
        )))

(require 'org)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/organization/personal.org"
			     "~/organization/work.org"
			     "~/organization/tasks.org"
			     )
      )

(setq org-list-allow-alphabetical "false")

(eval-after-load "org"
  '(require 'ox-md nil t))


(plist-put org-format-latex-options :scale 1.5)


(defun kdm/org-save-and-export ()
  (interactive)
  (if (eq major-mode 'org-mode)
    (org-latex-export-to-latex)))

(add-hook 'after-save-hook 'kdm/org-save-and-export nil)
