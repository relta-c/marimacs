;;; mari-project.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(defun mari:forget-project ()
  "Remove current project from project list."
  (setq inhibit-message t)
  (projectile-remove-current-project-from-known-projects)
  (setq inhibit-message nil))

(use-package projectile
  :custom
  (projectile-project-search-path '("~/data/development"))
  :config
  (projectile-mode t))

(add-hook 'projectile-after-switch-project-hook #'mari:forget-project)

(provide 'mari-project)


;;; mari-project.el ends here
