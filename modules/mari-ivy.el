;; mari-ivy.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package ivy
  :custom
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t)
  :config
  (ivy-mode 1))

(use-package counsel
  :after ivy
  :custom
  (counsel-mode 1))

(use-package counsel-projectile
  :after counsel)

(provide 'mari-ivy)

;;; mari-ivy.el ends here
