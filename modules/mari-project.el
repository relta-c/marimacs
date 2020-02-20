;;; mari-project.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

 (defun split-and-follow-horizontally ()
	(interactive)
	(split-window-below)
	(balance-windows)
	(other-window 1))
 (global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

 (defun split-and-follow-vertically ()
	(interactive)
	(split-window-right)
	(balance-windows)
	(other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(use-package projectile
  :config
  (projectile-mode t))

(provide 'mari-project)


;;; mari-project.el ends here
