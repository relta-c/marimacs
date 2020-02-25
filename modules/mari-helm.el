;;; mari-helm.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package helm
  :disabled
  :bind
  (("M-x" . helm-M-x))
  :config
  (helm-mode))

(use-package helm-projectile
  :disabled
  :after helm
  :config
  (helm-projectile-on))

(provide 'mari-helm)

;;; mari-helm.el ends here
