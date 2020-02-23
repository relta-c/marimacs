;;; mari-hydra.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(defun mari:do-in-project(func &optional unopened)
  "Execute helm-projectile and then FUNC if project is not opened.

  If Project is already opened then only execute FUNC.
  If UNOPENED not nil then only execute FUNC when project is not opened"
  (interactive)
  (if (not (projectile-project-p))
      (progn
        (helm-projectile)
        (when (not unopened)
          (funcall func)))
    (funcall func)))

(use-package hydra
  :after projectile
  :config
  (defhydra mari:hydra-index (:color blue :hint nil)
    "
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    I N D E X
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    _f_ find            _w_ window          _p_ project         _q_ cancel          ^
    "
    ("w" mari:hydra-window/body)
    ("f" mari:hydra-find/body)
    ("p" mari:hydra-project/body)
    ("q" nil))

  (defhydra mari:hydra-find (:color blue :hint nil)
    "
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    F I N D
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    _f_ file            _d_ directory       _b_ buffer          _q_ cancel          ^
    "
    ("f" (mari:do-in-project 'helm-projectile-find-file t))
    ("d" (mari:do-in-project 'helm-projectile-find-dir))
    ("b" (mari:do-in-project 'helm-projectile-switch-to-buffer))
    ("q" nil))

  (defhydra mari:hydra-project (:color blue :hint nil)
    "
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    P R O J E C T
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    _p_ project          _s_ switch         ^ ^                 _q_ cancel          ^
    "
    ("p" (mari:do-in-project 'helm-projectile t))
    ("s" (mari:do-in-project 'helm-projectile-switch-project t))
    ("q" nil))

  (defhydra mari:hydra-window (:color blue :hint nil)
    "
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    W I N D O W
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    ^ ^                  ^ ^                ^ ^                 _q_ cancel          ^
    "
    ("q" nil))

  (global-set-key (kbd "<muhenkan>") 'mari:hydra-index/body))

(provide 'mari-hydra)

;;; mari-hydra.el ends here
