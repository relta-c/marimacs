;;; init.el --- Main marimacs configuration file -*- lexical-binding: t -*-

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
(require 'mari-project)
(require 'mari-completion)

;;; init.el ends here
