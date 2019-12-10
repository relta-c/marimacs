;;; mari-lsp.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package clang-format+
  :custom
  (clang-format+-always-enable t)
  :hook ((c-mode c++-mode) . clang-format+-mode))

(use-package modern-cpp-font-lock
  :hook ((c-mode c++-mode) . modern-c++-font-lock-mode))

(use-package ccls
  :after projectile lsp-mode
  :custom
  (ccls-sem-highlight-method 'overlay)
  (ccls-executable (executable-find "ccls"))
  (ccls-initialization-options '(:index (:comments 2 :onChange t)
					:completion (:detailedLabel t)
					:clang (:extraArgs ["-Wall"
							    "-Wextra"
							    "-Wconversion"
							    "-Wsign-conversion"
							    "-pedantic"])))
  :config (push ".ccls-cache" projectile-globally-ignored-directories)
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))

(provide 'mari-cpp)

;;; mari-cpp.el ends here
