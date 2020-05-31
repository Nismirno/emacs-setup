(require 'req-package)

(req-package irony
  :ensure t
  :config
  (progn
    (unless (irony--find-server-executable)
      (call-interactively #'irony-install-server))

    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)

    (when (boundp 'w32-pipe-read-delay)
      (setq w32-pipe-read-delay 0))
    (when (boundp 'w32-pipe-buffer-size)
      (setq irony-server-w32-pipe-buffer-size (* 64 1024)))

    (setq-default irony-cdb-compilation-databases '(irony-cdb-libclang
                                                    irony-cdb-clang-complete
                                                    irony-cdb-json))
    (setq-default irony-cdb-search-directory-list '("." "build" "bin"))

    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)))

(req-package company-irony
  :ensure t
  :require company irony
  :config
  (eval-after-load 'company '(add-to-list 'company-backends 'company-irony)))

(req-package flycheck-irony
  :ensure t
  :require flycheck irony
  :config
  (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))

(req-package irony-eldoc
  :ensure t
  :require eldoc irony
  :config
  (add-hook 'irony-mode-hook #'irony-eldoc))
