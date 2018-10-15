(require 'req-package)

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
    (setq flycheck-global-modes '(not emacs-lisp-mode)))

(req-package flycheck-pos-tip
  :ensure t
  :commands flycheck-pos-tip-error-messages
  :require flycheck
  :init (setq flycheck-display-errors #'flycheck-pos-tip-error-messages))

(provide 'setup-flycheck)
