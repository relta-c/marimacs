;;; mari-evil.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package evil
  :preface
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :defines company-active-map
  :config
  (evil-collection-init)
  :bind (:map company-active-map
              ("<tab>" . company-complete-selection)))

(add-hook 'dired-mode-hook (lambda () (evil-emacs-state)))

(provide 'mari-evil)

;;; mari-evil.el ends here
