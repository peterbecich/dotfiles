;;; early-init.el --- Early startup settings -*- lexical-binding: t; -*-

;; Let init.el initialize package.el explicitly after package archives are set.
(setq package-enable-at-startup nil)

;; (defun my-append-env-var (var-name value)
;;   "Append VALUE to the beginning of current value of env variable VAR-NAME."
;;   (setenv var-name (if (getenv var-name)
;;                        (format "%s:%s" value (getenv var-name))
;;                      value)))

;; (let ((gccjitpath "/opt/homebrew/lib/gcc/11:/opt/homebrew/lib"))
;;   (mapc (lambda (var-name) (my-append-env-var var-name gccjitpath))
;;         '("LIBRARY_PATH" "LD_LIBRARY_PATH" "PATH")))

(defconst my/runtime-gc-cons-threshold (* 64 1024 1024))

;; Disable native compilation before package managers can queue async comp jobs.
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6
      native-comp-jit-compilation nil
      package-native-compile nil
      straight-disable-native-compile t)
(with-suppressed-warnings ((obsolete native-comp-deferred-compilation))
  (setq native-comp-deferred-compilation nil))

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold my/runtime-gc-cons-threshold
                  gc-cons-percentage 0.1)))

;;; early-init.el ends here
