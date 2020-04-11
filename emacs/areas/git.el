(setq magit-last-seen-setup-instructions "1.4.0")
(setq magit-auto-revert-mode 1)
(setq magit-refresh-status-buffer 1)

;; (require 'magit-todos)

(global-set-key (kbd "C-c g g") 'browse-at-remote)

;;(remove-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(remove-hook 'find-file-hooks 'vc-find-file-hook)
;; https://www.reddit.com/r/emacs/comments/4c0mi3/the_biggest_performance_improvement_to_emacs_ive/
;; (add-hook 'magit-mode-hook 'magit-todos-mode)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

(add-hook 'dired-after-readin-hook 'dired-git-info-auto-enable)
(setq dgi-auto-hide-details-p t)
