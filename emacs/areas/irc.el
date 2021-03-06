
(setq erc-join-buffer 'bury)

(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs"
	 "#haskell" "#haskell-beginners" "#xmonad" "#haskell-distributed" "#haskell-lens" "#nicta-course" "#yesod" "#tasty" "#haskell-web"
	 "#postgresql"
         "#kubernetes" "#docker"
         )
	)
      )

;;         "#debian" "#ubuntu" "##Linux"

(setq erc-log-channels-directory "~/.erc/logs/")
(setq erc-save-buffer-on-part t)
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

(setq erc-format-query-as-channel-p t
      erc-track-priority-faces-only 'all
      erc-track-faces-priority-list '(erc-error-face
				      erc-current-nick-face
				      erc-keyword-face
				      erc-nick-msg-face
				      erc-direct-msg-face
				      erc-dangerous-host-face
				      erc-notice-face
				      erc-prompt-face))

(setq erc-current-nick-highlight-type 'nick)
(setq erc-keywords '("\\berc[-a-z]*\\b" "\\bemms[-a-z]*\\b"))

(setq erc-track-exclude-types '("JOIN" "PART" "QUIT" "NICK" "MODE"))
(setq erc-track-use-faces t)
(setq erc-track-faces-priority-list
      '(erc-current-nick-face erc-keyword-face))
(setq erc-track-priority-faces-only 'all)


(setq erc-save-buffer-on-part nil
      erc-save-queries-on-quit nil
      erc-log-write-after-send t
      erc-log-write-after-insert t)
