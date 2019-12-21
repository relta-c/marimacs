;;; mari-evil.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package evil
  :preface
  (setq evil-want-keybinding nil)
  :config
  (evil-mode))

(use-package evil-collection
  :after evil company
  :defines company-active-map
  :bind (:map company-active-map
	      ("<tab>" . company-complete-selection))
  :config
  (evil-collection-init))


(provide 'mari-evil)

;;; mari-evil.el ends here
