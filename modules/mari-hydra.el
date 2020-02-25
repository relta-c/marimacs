;;; mari-hydra.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(setq mari:window-resize-amount 5)

(use-package windresize
  :bind
  (:map windresize-map
        ("k" . windresize-up)
        ("j" . windresize-down)
        ("h" . windresize-left)
        ("l". windresize-right)))

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

(use-package hydra
  :after projectile counsel-projectile
  :config
  (defhydra mari:hydra-index (:color blue :hint nil)
    "
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    I N D E X
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    _s_ search          _w_ window          _p_ project         _q_ quit            ^
    "
    ("w" mari:hydra-window/body)
    ("s" mari:hydra-search/body)
    ("p" mari:hydra-project/body)
    ("q" nil))

  (defhydra mari:hydra-search (:color blue :hint nil)
    "
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    S E A R C H
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    _f_ file            _d_ directory       _b_ buffer          _q_ quit            ^
    "
    ("f" counsel-projectile-find-file)
    ("d" counsel-projectile-find-dir)
    ("b" counsel-projectile-find-buffer)
    ("q" nil))

  (defhydra mari:hydra-project (:color blue :hint nil)
    "
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    P R O J E C T
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    _a_ add              _d_ remove         _s_ switch          _q_ quit            ^
    "
    ("a" projectile-add-known-project)
    ("d" projectile-remove-known-project)
    ("s" counsel-projectile-switch-project)
    ("q" nil))

  (defhydra mari:hydra-window (:color blue :hint nil)
    "
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    W I N D O W
    ^^^^^^^^^^^^^^^^^^^^-------------------------------------------------------------
    _l_ new right        _j_ new below      _w_ jump            _r_ resize          ^
    ^ ^                  ^ ^                ^ ^                 _q_ quit            ^
    "
    ("l" (mari:split-window-horizontally))
    ("j" (mari:split-window-vertically))
    ("r" mari:hydra-window-resize/body)
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
