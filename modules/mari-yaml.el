;;; mari-yaml.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package yaml-mode
  :config
  (add-to-list 'auto-mode-alist '(".clang-format\\'" . yaml-mode))
  (add-to-list 'auto-mode-alist '(".clang-tidy\\'" . yaml-mode)))

(provide 'mari-yaml)

;;; mari-yaml.el ends here
