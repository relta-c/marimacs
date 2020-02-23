;;; mari-helm.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package helm
  :bind
  (("M-x" . helm-M-x))
  :config
  (helm-mode))

(use-package helm-projectile
  :after helm)

(provide 'mari-helm)

;;; mari-helm.el ends here
