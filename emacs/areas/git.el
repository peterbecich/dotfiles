(setq magit-last-seen-setup-instructions "1.4.0")
;; (setq magit-auto-revert-mode 1)
;; (setq magit-refresh-status-buffer nil)


;; (setq magit-diff-highlight-indentation nil)
;; (setq magit-diff-highlight-trailing nil)
;; (setq magit-diff-paint-whitespace nil)
;; (setq magit-diff-highlight-hunk-body nil)
;; (setq magit-diff-refine-hunk nil)

;; (setq magit-revision-insert-related-refs nil)
;; magit-diff-highlight-indentation, magit-diff-highlight-trailing, magit-diff-paint-whitespace, magit-diff-highlight-hunk-body, and magit-diff-refine-hunk.

;; (setq magit-status-headers-hook nil)
;; (setq magit-diff-sections-hook nil)

;; (require 'magit-todos)

;; (global-set-key (kbd "C-c g g") 'browse-at-remote)

;;(remove-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
;; (remove-hook 'find-file-hooks 'vc-find-file-hook)
;; https://www.reddit.com/r/emacs/comments/4c0mi3/the_biggest_performance_improvement_to_emacs_ive/
;; (add-hook 'magit-mode-hook 'magit-todos-mode)
;; (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;; (add-hook 'dired-after-readin-hook 'dired-git-info-auto-enable)
;; (setq dgi-auto-hide-details-p t)


;; (setq vc-handled-backends nil)

;; (remove-hook 'server-switch-hook 'magit-commit-diff)


;; (defun run-projectile-invalidate-cache (&rest _args)
;;   ;; We ignore the args to `magit-checkout'.
;;   (projectile-invalidate-cache nil))
;; (advice-add 'magit-checkout
;;             :after #'run-projectile-invalidate-cache)
;; (advice-add 'magit-branch-and-checkout ; This is `b c'.
;;             :after #'run-projectile-invalidate-cache)
