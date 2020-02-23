;;; mari-dashboard.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package dashboard
  :custom
  (dashboard-banner-logo-title "M A R I M A C S")
  (dashboard-items '((recents  . 5) (projects . 5)))
  (dashboard-show-shortcuts nil)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-center-content t)
  (dashboard-set-footer nil)
  :config
  (dashboard-setup-startup-hook))

(provide 'mari-dashboard)

;;; mari-dashboard.el ends here
