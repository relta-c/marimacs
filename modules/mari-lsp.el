;;; mari-lsp.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package flycheck
  :custom
  (flycheck-emacs-lisp-load-path 'inherit)
  (flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc emacs-lisp))
  :hook
  (after-init . global-flycheck-mode))

(use-package lsp-mode
  :hook ((c-mode c++-mode) . lsp)
  :custom
  (lsp-file-watch-threshold 1000000)
  (lsp-enable-flycheck nil))

(use-package company-lsp
  :after company lsp-mode)

(use-package lsp-ui
  :after lsp-mode)

(use-package lsp-treemacs
  :after lsp-mode treemacs)

(provide 'mari-lsp)

;;; mari-lsp.el ends here
