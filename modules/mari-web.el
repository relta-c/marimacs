;;; mari-web.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package typescript-mode)

(use-package ng2-mode
  :custom
  (sgml-quick-keys 'close)
  :hook
  (ng2-html-mode . html-mode))

(provide 'mari-web)

;;; mari-web.el ends here
