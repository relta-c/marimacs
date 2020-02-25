;;; init.el --- Main marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:


;; Performance
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

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
(require 'mari-hydra)
(require 'mari-project)
(require 'mari-snippets)
(require 'mari-completion)
(require 'mari-evil)
(require 'mari-ivy)
(require 'mari-lsp)
(require 'mari-git)
(require 'mari-cpp)
(require 'mari-web)
(require 'mari-yaml)
(require 'mari-shell)

;;; init.el ends here
