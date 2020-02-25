;;; mari-appearance.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

;; Disable most GUI elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Quiet startup
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)
(defalias 'display-startup-echo-area-message 'ignore)

;; Set titlebar
(setq frame-title-format (concat "marimacs@"(system-name)))

;; Disable line wrapping
(set-default 'truncate-lines t)

;; Disable ring-bell
(setq ring-bell-function 'ignore)

;; Line number
(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Show parens
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode t)

;; Turn yes-or-no to y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)

(use-package whitespace
  :disabled
  :straight nil
  :custom
  (whitespace-line-column 120)
  (whitespace-style (quote (face tabs newline space-mark  spaces
                                 tab-mark newline-mark trailing)))
  (whitespace-display-mappings '((space-mark 32 [183] [46])
                                 (newline-mark 10 [8991 10])
                                 (tab-mark 9 [9655 9] [92 9])))
  :hook (prog-mode . whitespace-mode))

;; Highlight cusor when switching window
(use-package beacon
  :config
  (beacon-mode 1))

(use-package rainbow-delimiters
  :hook
  (emacs-lisp-mode . rainbow-delimiters-mode))

;; Doom one theme
(use-package doom-themes
  :custom
  (doom-themes-treemacs-theme "doom-colors")
  :config
  (load-theme 'doom-one t)
  (doom-themes-org-config)
  (set-face-attribute 'link nil :foreground "#98be65"))

(use-package doom-modeline
  :hook
  (after-init . doom-modeline-mode))

;; Show git changes
(use-package git-gutter
  :config
  (global-git-gutter-mode t))

;; Highlight numbers
(use-package highlight-numbers
  :config
  (set-face-attribute 'highlight-numbers-number nil
                      :foreground (face-attribute font-lock-constant-face :foreground)
                      :inherit nil)
  :hook
  (prog-mode . highlight-numbers-mode))

(use-package hl-todo
  :hook
  (after-init . global-hl-todo-mode))

(use-package all-the-icons-dired
  :after all-the-icons
  :hook
  (dired-mode . all-the-icons-dired-mode))

(provide 'mari-appearance)

;;; mari-appearance.el ends here
