(require 'req-package)

(req-package company
  :ensure t
  :config
  (global-company-mode 1)
  (setq company-idle-delay 0.5)
  (setq company-show-numbers t)
  (setq company-minimum-prefix-length 2)
  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-other-buffers t)
  (setq company-auto-complete nil)
  (setq company-dabbrev-code-other-buffers 'all)
  (setq company-dabbrev-code-everywhere t)
  (setq company-dabbrev-code-ignore-case t)
  (setq company-clang-arguments
        (quote
         ("-IC:\\Program Files (x86)\\Windows Kits\\10\\Include"
          "-IE:\\HandmadeProject\\handmade\\src"
          "-IE:\\openssl-1.1.1.g\\include"
          "-IC:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\MSVC\\14.25.28610\\include")))
  (defun my-elisp-company-setup ()
    (require 'auto-complete-c-headers)
    (setq company-backends '(company-elisp
                             company-dabbrev-code
                             company-keywords
                             company-yasnippet
                             company-files
                             company-dabbrev))
    (auto-complete-mode 0)
    (company-mode 1))

  (add-hook 'emacs-lisp-mode-hook 'my-elisp-company-setup)
  )

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
