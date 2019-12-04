;;; mari-lsp.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package modern-cpp-font-lock
  :hook ((c-mode c++-mode) . modern-c++-font-lock-mode))

(use-package ccls
  :after projectile lsp-mode
  :custom
  (ccls-sem-highlight-method 'overlay)
  (ccls-executable (executable-find "ccls"))
  :config (push ".ccls-cache" projectile-globally-ignored-directories))

(provide 'mari-cpp)

;;; mari-cpp.el ends here
