;;; mari-dashboard.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package dashboard
  :after all-the-icons projectile
  :custom
  ;; (initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (dashboard-banner-logo-title "M A R I M A C S")
  (dashboard-items '())
  (dashboard-set-navigator t)
  (dashboard-navigator-buttons
      `(((,""
          "Open Project"
          ""
         (lambda (&rest _) (helm-projectile))))
        ((,""
          "Browes"
          ""
          (lambda (&rest _) (dired "~/data/development"))))))
  (dashboard-show-shortcuts nil)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-center-content t)
  (dashboard-set-footer nil)
  :config
  (dashboard-setup-startup-hook))

(provide 'mari-dashboard)

;;; mari-dashboard.el ends here
