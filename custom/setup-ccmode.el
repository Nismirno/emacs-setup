;; smart tabs
(require 'req-package)

(req-package auto-complete-c-headers
  :ensure t)

(req-package aggressive-indent
  :ensure t)

(req-package cc-mode
  :ensure t
  :require auto-complete-c-headers
  :config
  (smart-tabs-insinuate 'c 'c++)
  (load-library "hideshow")

  ;; open some c files in c++ mode
  (setq auto-mode-alist
        (append
         '(("\\.cpp$" . c++-mode)
           ("\\.hin$" . c++-mode)
           ("\\.cin$" . c++-mode)
           ("\\.inl$" . c++-mode)
           ("\\.c$" . c++-mode)
           ("\\.cc$" . c++-mode)
           ("\\.c8$" . c++-mode)
           ("\\.h$" . c++-mode))
         auto-mode-alist))

  ;; set up own c style
  (defconst my-c-style
    '((c-offsets-alist . ((label . -)
                          (access-label . -)
                          (case-label . +)
                          (arglist-cont . 0)
                          (arglist-close . 0)
                          (substatement-open . 0)
                          (inline-open . +)
                          (inextern-lang . 0)
                          (topmost-intro-cont . 0)))))
  (c-add-style "PERSONAL" my-c-style)

  (defun my-c-setup ()
    "This is a small function to set up my C mode."
    (setq c-basic-offset tab-width
          indent-tabs-mode t)

    (c-set-style "PERSONAL")
    (c-toggle-auto-hungry-state -1)
    (c-toggle-auto-newline -1)

    (setq dabbrev-case-distinction nil)
    (setq dabbrev-case-fold-search t)
    (setq dabbrev-case-replace t)
    (setq dabbrev-upcase-means-case-search t)
    (setq eldoc-echo-area-use-multiline-p t)

    (abbrev-mode t)
    (semantic-mode t)
    (hs-minor-mode t)
    (semantic-idle-summary-mode -1)
    (flycheck-select-checker 'c/c++-clang)

    (define-key c++-mode-map (kbd "M-c") 'ff-find-other-file)
    (define-key c++-mode-map (kbd "M-C") '(ff-find-other-file 1))

    (define-key c++-mode-map (kbd "<f9>") 'first-error)
    (define-key c++-mode-map (kbd "<f10>") 'previous-error)
    (define-key c++-mode-map (kbd "<f11>") 'next-error)

    (define-key c-mode-map (kbd "<tab>") 'company-complete)
    (define-key c++-mode-map (kbd "<tab>") 'company-complete)

    (define-key global-map (kbd "C-;") 'hs-hide-block)
    (define-key global-map (kbd "C-'") 'hs-show-block)
    (define-key global-map (kbd "<f5>") 'compile)
    (define-key c++-mode-map (kbd "C-c l") 'company-clang)
    (add-hook 'find-file-hook 'auto-insert))

  (defun my-company-setup ()
    (require 'auto-complete-c-headers)
    (setq company-backends '(;company-clang
                             company-dabbrev-code
                             company-keywords
                             company-yasnippet
                             company-files
                             company-dabbrev))
    (auto-complete-mode 0)
    (company-mode 1)
    (global-set-key [C-return] 'company-complete-common))

  (add-hook 'c++-mode-hook 'eldoc-mode)
  (add-hook 'c++-mode-hook 'my-c-setup)
  (add-hook 'c++-mode-hook 'my-company-setup))

(provide 'setup-ccmode.el)
