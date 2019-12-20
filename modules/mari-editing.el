;;; mari-editing.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package cc-mode
  :straight nil
  :custom
  (c++-tab-always-indent t)
  (c-basic-offset 4)
  (c-indent-level 4)
  (tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76))
  (tab-width 4)
  (indent-tabs-mode nil)
  :config
  (c-set-offset 'substatement-open 0))

(setq electric-pair-pairs '((?\{ . ?\})
                       (?\( . ?\))
                       (?\[ . ?\])
                       (?\" . ?\")))
(electric-pair-mode t)

(provide 'mari-editing)

;;; mari-editing.el ends here
