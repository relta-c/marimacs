;;; mari-lsp.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package flycheck
  :custom
  (flycheck-emacs-lisp-load-path 'inherit)
  (flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc emacs-lisp))
  :hook
  (after-init . global-flycheck-mode))

(use-package lsp-mode
  :commands lsp
  :custom
  (lsp-enable-snippet t)
  (lsp-prefer-flymake nil)
  (lsp-auto-guess-root t)
  (lsp-signature-render-all t)
  (lsp-eldoc-enable-hover nil)
  (lsp-eldoc-enable-sinature-help nil)
  (lsp-enable-file-watchers t)
  (lsp-file-watch-threshold 1000000)
  (lsp-signature-auto-activate t)
  (lsp-ui-doc-use-webkit nil)
  (lsp-signature-render-documentation t)
  (lsp-enable-semantic-highlighting t)
  (lsp-enable-imenu t)
  (lsp-enable-on-type-formatting t)
  (lsp-enable-text-document-color t)

  :config
  (defun mari:save-after-change (newname)
    (save-some-buffers t)
    (if (or (equal major-mode 'c-mode)
            (equal major-mode 'c++-mode))
        (ccls-reload)))
  (advice-add 'lsp-rename :after 'mari:save-after-change)

  :hook ((c-mode c++-mode) . lsp))

(use-package company-lsp
  :commands company-lsp
  :after lsp company
  :custom
  (company-transformers nil
                        company-lsp-async t
                        company-lsp-cache-candidates nil)
  :config
  (push 'company-lsp company-backends))

(use-package lsp-ui
  :after lsp
  :straight (el-patch :type git :host github :repo "emacs-lsp/lsp-ui"
                      :fork (:host github :repo "relta-c/lsp-ui"))
  :commands lsp-ui-mode
  :custom
  (lsp-ui-sideline-delay 0)
  (lsp-ui-sideline-show-hover t))

(use-package lsp-treemacs
  :after lsp treemacs)

(provide 'mari-lsp)

;;; mari-lsp.el ends here
