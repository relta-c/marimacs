;;; mari-snippets.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package yasnippet-snippets)

(use-package yasnippet
  :after yasnippet-snippets
  :custom
  (yas-verbosity 0)
  :config
  (yas-global-mode))

(provide 'mari-snippets)

;;; mari-snippets.el ends here
