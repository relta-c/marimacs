;;; mari-cpp.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package cc-mode
  :straight nil
  :custom
  (c++-tab-always-indent t)
  (c-basic-offset 4)
  (c-indent-level 4)
  (tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76))
  (tab-width 4)
  (indent-tabs-mode nil)
  :config
  (c-set-offset 'substatement-open 0))

(use-package clang-format+
  :custom
  (clang-format+-always-enable t)
  :hook ((c-mode c++-mode) . clang-format+-mode))

(use-package modern-cpp-font-lock
  :hook ((c-mode c++-mode) . modern-c++-font-lock-mode))

(use-package flycheck-clang-tidy
  :after flycheck lsp-ui
  :custom
  (flycheck-clang-tidy-extra-options (concat "-checks= -config=" (expand-file-name ".clang-tidy" (projectile-project-root))))
  :config
  (flycheck-add-next-checker 'lsp-ui '(info . c/c++-clang-tidy))
  :hook
  (flycheck-mode . flycheck-clang-tidy-setup))

(use-package ccls
  :after projectile lsp-mode
  :custom
  (ccls-sem-highlight-method 'overlay)
  (ccls-executable (executable-find "ccls"))
  (ccls-initialization-options '(:index (:comments 2 :onChange t)
                                        :completion (:detailedLabel t)
                                        :cache (:directory "")))
  :config (push ".ccls-cache" projectile-globally-ignored-directories)
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))

(provide 'mari-cpp)

;;; mari-cpp.el ends here
