;;; mari-evil.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :custom
  (evil-collection-setup-minibuffer t)
  (evil-collection-company-use-tng nil)
  :config
  (evil-collection-init))

(use-package evil-magit
  :after evil magit)

(provide 'mari-evil)

;;; mari-evil.el ends here
