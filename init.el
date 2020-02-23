;;; init.el --- Main marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

;; Set paths
(defconst mari:modules-directory
  (concat user-emacs-directory "modules"))

(defconst mari:runtime-directory
  (concat user-emacs-directory "runtime"))

(defconst mari:data-directory
  (concat user-emacs-directory "data"))

(add-to-list 'load-path mari:modules-directory)

;; Load modules

(require 'mari-packages)
(require 'mari-paths)
(require 'mari-appearance)
(require 'mari-dashboard)
(require 'mari-editing)
(require 'mari-evil)
(require 'mari-project)
(require 'mari-snippets)
(require 'mari-completion)
(require 'mari-lsp)
(require 'mari-cpp)
(require 'mari-cmake)
(require 'mari-yaml)
(require 'mari-hydra)
(require 'mari-helm)

;;; init.el ends here
