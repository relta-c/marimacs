;;; mari-paths.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package no-littering
  :demand
  :init
  (progn
    (setq no-littering-etc-directory mari:data-directory)
    (setq no-littering-var-directory mari:runtime-directory))
  :config
  (progn
    (setq auto-save-file-name-transforms
          `((".*" ,(expand-file-name "auto-save" mari:runtime-directory) t)))
    (setq custom-file (no-littering-expand-etc-file-name "custom.el"))

     (eval-when-compile
       (require 'recentf))

     (with-eval-after-load 'recentf
       (add-to-list 'recentf-exclude no-littering-etc-directory)
       (add-to-list 'recentf-exclude no-littering-var-directory))))

(provide 'mari-paths)

;;; mari-paths.el ends here
