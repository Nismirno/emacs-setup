(require 'req-package)

(req-package flycheck-title
  :ensure t)

(req-package flycheck
  :ensure t
  :init
  (progn
    (global-flycheck-mode t)
    (set-face-attribute 'flycheck-warning nil
                        :inherit 'warning
                        :underline nil))
    (set-face-attribute 'flycheck-error nil
                        :inherit 'error
                        :underline nil)
    (setq flycheck-global-modes '(not emacs-lisp-mode))
    (setq flycheck-display-errors-function nil))

(provide 'setup-flycheck)
