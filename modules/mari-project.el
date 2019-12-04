;;; mari-project.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package projectile
  :config
  (projectile-mode t))

(use-package treemacs
  :after all-the-icons
  :hook (after-init . treemacs-select-window)
  :config
  (treemacs-modify-theme "Default"
    :config
    (progn
      (treemacs-create-icon :icon (all-the-icons-octicon "file-text")
			    :extensions (fallback))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file "license")
			    :extensions ("license" "copying"))
      (treemacs-create-icon :icon (all-the-icons-fileicon "gnu")
			    :extensions ("makefile"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".png")
			    :extensions ("png"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".svg")
			    :extensions ("svg"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".html")
			    :extensions ("html"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".css")
			    :extensions ("css"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".js")
			    :extensions ("js"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".zip")
			    :extensions ("zip"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".org")
			    :extensions ("org"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".toml")
			    :extensions ("toml"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".lisp")
			    :extensions ("lisp"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".md")
			    :extensions ("md"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".py")
			    :extensions ("py"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".pyc")
			    :extensions ("pyc"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".sh")
			    :extensions ("sh" "zsh" "fish"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".pdf")
			    :extensions ("pdf"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".c")
			    :extensions ("c"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".h")
			    :extensions ("h"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".cpp")
			    :extensions ("cpp" "cxx" "cc"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".hpp")
			    :extensions ("hh" "hpp"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".s")
			    :extensions ("s" "asm"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".ini")
			    :extensions ("ini"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".xml")
			    :extensions ("xml"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".cfg")
			    :extensions ("cfg"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".json")
			    :extensions ("json"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".log")
			    :extensions ("log"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".hs")
			    :extensions ("hs" "lhs"))
      (treemacs-create-icon :icon(all-the-icons-fileicon "emacs"
							 :face 'all-the-icons-lred
							 :height 0.9)
			    :extensions ("elc"))
      (treemacs-create-icon :icon(all-the-icons-fileicon "emacs"
							 :face 'all-the-icons-purple
							 :height 0.9)
			    :extensions ("el"))
      (treemacs-create-icon :icon(all-the-icons-fileicon "emacs"
							 :face 'all-the-icons-blue
							 :height 0.9)
			    :extensions ("cask"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".yml")
			    :extensions ("yml" "yaml"))
      (treemacs-create-icon :icon (all-the-icons-icon-for-file ".gitignore")
			    :extensions ("gitignore"))
      (treemacs-create-icon :icon (all-the-icons-octicon "file-directory")
			    :extensions (dir-closed))
      (treemacs-create-icon :icon (all-the-icons-octicon "file-directory")
			    :extensions (dir-open))
      (treemacs-create-icon :icon (all-the-icons-octicon "book")
			    :extensions (root))))
  :bind (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-projectile
  :after treemacs projectile)

(provide 'mari-project)

;;; mari-project.el ends here
