;;; mari-editing.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(setq electric-pair-pairs '((?\{ . ?\})
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\" . ?\")))
(electric-pair-mode t)

(setq auto-save-default nil)
(setq make-backup-files nil)

(use-package editorconfig
  :config
  (editorconfig-mode 1))

(use-package ace-window)

(provide 'mari-editing)

;;; mari-editing.el ends here
