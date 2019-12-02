;;; mari-appearance.el --- Marimacs configuration file -*- lexical-binding: t -*-

;; Disable most GUI elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Quiet startup
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)
(defalias 'display-startup-echo-area-message 'ignore)

;; Disable ring-bell
(setq ring-bell-function 'ignore)

;; Line number
(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Doom one theme
(use-package doom-themes
  :config
  (load-theme 'doom-one t)
  (doom-themes-org-config))

(use-package doom-modeline
  :hook
  (after-init . doom-modeline-mode))

;; Show git changes
(use-package git-gutter
  :config
  (global-git-gutter-mode +1))

(provide 'mari-appearance)

;;; mari-appearance.el ends here
