;;; early-init.el --- Early startup settings -*- lexical-binding: t; -*-

;; Let init.el initialize package.el explicitly after package archives are set.
(setq package-enable-at-startup nil)

;; Keep startup work off the interactive path where possible.  Emacs Lisp is
;; mostly single-threaded, but native compilation and subprocess IO can run in
;; parallel with the UI.
(defconst my/processor-count
  (max 1 (or (ignore-errors (num-processors)) 1)))

(defconst my/runtime-gc-cons-threshold (* 64 1024 1024))

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6
      native-comp-async-jobs-number my/processor-count
      native-comp-async-query-on-exit nil
      native-comp-async-report-warnings-errors 'silent
      native-comp-deferred-compilation t
      native-comp-jit-compilation t
      native-comp-speed 2)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold my/runtime-gc-cons-threshold
                  gc-cons-percentage 0.1)))

;;; early-init.el ends here
