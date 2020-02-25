;;; mari-cmake.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package cmake-mode
  :disabled
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))

(use-package cmake-font-lock
  :disabled
  :after (cmake-mode)
  :hook (cmake-mode . cmake-font-lock-activate))

(provide 'mari-cmake)

;;; mari-cmake.el ends here
