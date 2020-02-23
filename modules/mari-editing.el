;;; mari-editing.el --- Marimacs configuration file -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(setq electric-pair-pairs '((?\{ . ?\})
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\" . ?\")))
(electric-pair-mode t)

(provide 'mari-editing)

;;; mari-editing.el ends here
