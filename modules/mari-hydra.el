;;; mari-hydra.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(defun mari:split-window-horizontally ()
  "Split window horizontally then shift focus to new windows."
  (interactive)
  (split-window-right)
  (other-window 1))

(defun mari:split-window-vertically ()
  "Split window vertically then shift focus to new windows."
  (interactive)
  (split-window-below)
  (other-window 1))

(defun mari:rename-current-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let* ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let* ((dir (file-name-directory filename))
             (new-name (read-file-name "New name: " dir)))
        (cond ((get-buffer new-name)
               (error "A buffer named '%s' already exists!" new-name))
              (t
               (let ((dir (file-name-directory new-name)))
                 (when (and (not (file-exists-p dir)) (yes-or-no-p (format "Create directory '%s'?" dir)))
                   (make-directory dir t)))
               (rename-file filename new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (save-buffer)
               (message "File '%s' successfully renamed to '%s'" name (file-name-nondirectory new-name))))))))

(defun mari:delete-current-file ()
  "Delete current file and buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
        (when (yes-or-no-p "Are you sure you want to delete this file? ")
          (delete-file filename t)
          (kill-buffer buffer)))))

(use-package avy)

(use-package windresize
  :custom
  (mari:window-resize-amount 5))

(use-package hydra
  :after projectile counsel-projectile
  :config
  (defhydra mari:hydra-index (:color blue :hint nil)
    "
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    I N D E X
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    _f_ file             _d_ directory      _w_ window          _p_ project         ^
    _j_ jump             _g_ git            _l_ lsp             _s_ search          ^
    _t_ terminal         ^ ^                _<muhenkan>_        _q_ quit            ^
    "
    ("f" mari:hydra-file/body)
    ("w" mari:hydra-window/body)
    ("s" mari:hydra-search/body)
    ("p" mari:hydra-project/body)
    ("l" mari:hydra-lsp/body)
    ("g" magit-status)
    ("s" swiper)
    ("j" avy-goto-char-2)
    ("d" (dired nil))
    ("t" eshell)
    ("<muhenkan>" counsel-projectile-find-file)
    ("q" nil))

  (defhydra mari:hydra-file (:color blue :hint nil)
    "
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    F I L E
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    _w_ write            _r_ rename         _d_ delete          _q_ quit            ^
    "
    ("w" save-buffer)
    ("r" (mari:rename-current-file))
    ("d" (mari:delete-current-file))
    ("q" nil))

  (defhydra mari:hydra-lsp (:color blue :hint nil)
    "
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    L S P
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    _n_ rename           _d_ definitions    _r_ references      _i_ implementation  ^
    _a_ action           _f_ format         ^ ^                 _q_ quit            ^
    "
    ("n" lsp-rename)
    ("d" lsp-find-definition)
    ("r" lsp-find-references)
    ("i" lsp-find-implementation)
    ("a" lsp-execute-code-action)
    ("f" lsp-format-buffer)
    ("q" nil))

  (defhydra mari:hydra-jump (:color blue :hint nil)
    "
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    J U M P
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    _j_  point           _l_ line         ^ ^                   _q_ quit            ^
    "
    ("j" avy-goto-char)
    ("l" avy-goto-line)
    ("q" nil))

  (defhydra mari:hydra-project (:color blue :hint nil)
    "
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    P R O J E C T
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    _f_ file             _d_ directory      _b_ buffer          _g_ grep            ^
    _a_ add              _r_ remove         _s_ switch          _q_ quit            ^
    "
    ("f" counsel-projectile-find-file)
    ("d" counsel-projectile-find-dir)
    ("b" counsel-projectile-switch-to-buffer)
    ("g" counsel-projectile-grep)
    ("a" projectile-add-known-project)
    ("r" projectile-remove-known-project)
    ("s" counsel-projectile-switch-project)
    ("q" nil))

  (defhydra mari:hydra-window (:color blue :hint nil)
    "
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    W I N D O W
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    _l_ new right        _j_ new below      _w_ jump            _r_ resize          ^
    _d_ close            _D_ close other    ^ ^                 _q_ quit            ^
    "
    ("l" (mari:split-window-horizontally))
    ("j" (mari:split-window-vertically))
    ("r" mari:hydra-window-resize/body)
    ("d" delete-window)
    ("D" delete-other-windows)
    ("w" ace-window)
    ("q" nil))

  (defhydra mari:hydra-window-resize (:color amaranth :hint nil)
    "
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    W I N D O W   R E S I Z E
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    _k_ up               _j_ down           _h_ left            _l_ right           ^
    ^ ^                  ^ ^                ^ ^                 _q_ quit            ^
    "
    ("k" (windresize-up mari:window-resize-amount))
    ("j" (windresize-up (* -1 mari:window-resize-amount)))
    ("h" (windresize-left mari:window-resize-amount))
    ("l" (windresize-left (* -1 mari:window-resize-amount)))
    ("q" nil))

  (global-set-key (kbd "<muhenkan>") 'mari:hydra-index/body))

(provide 'mari-hydra)

;;; mari-hydra.el ends here
