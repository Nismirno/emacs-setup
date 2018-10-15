(require 'req-package)

(req-package company
  :ensure t
  :config
  (global-company-mode 1)
  (setq company-idle-delay 0.1)
  (setq company-show-numbers t)
  (setq company-minimum-prefix-length 2)
  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-other-buffers t)
  (setq company-auto-complete nil)
  (setq company-dabbrev-code-other-buffers 'all)
  (setq company-dabbrev-code-everywhere t)
  (setq company-dabbrev-code-ignore-case t))

(req-package company-quickhelp
  :ensure t
  :require company
  :config (company-quickhelp-mode 1))

(req-package company-c-headers
  :ensure t
  :require company
  :init
  (add-to-list 'company-backends 'company-c-headers))

(provide 'setup-company)
