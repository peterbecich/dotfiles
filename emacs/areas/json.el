(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 4)))

;; https://stackoverflow.com/questions/17901900/how-can-i-set-a-tab-width-for-json-files
