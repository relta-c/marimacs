;;; init.el --- Main mariemacs configuration files -*- lexical-binding: t -*-

;; Set paths
(defconst mari:modules-directory
  (concat user-emacs-directory "mod"))

(defconst mari:runtime-directory
  (concat user-emacs-directory "run"))

(defconst mari:data-directory
  (concat user-emacs-directory "data"))

(add-to-list 'load-path mari:modules-directory)

;; Load modules

(require 'mari-packages)
(require 'mari-paths)
(require 'mari-appearance)
(require 'mari-project)

;;; init.el ends here
