;; smart tabs
(require 'req-package)

(req-package cc-mode
  :ensure t
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
                          (topmost-intro-cont . 0)))))
  (c-add-style "PERSONAL" my-c-style)

  (defun my-c-setup ()
    "This is a small function to set up my C mode."
    (setq c-basic-offset tab-width
          indent-tabs-mode t)

    (c-set-style "PERSONAL")
    (c-toggle-hungry-state t)
    (c-toggle-auto-newline -1)

    (setq dabbrev-case-distinction nil)
    (setq dabbrev-case-fold-search t)
    (setq dabbrev-case-replace t)
    (setq dabbrev-upcase-means-case-search t)

    (abbrev-mode t)
    (semantic-mode t)
    (hs-minor-mode t)

    (define-key c++-mode-map (kbd "M-c") 'ff-find-other-file)
    (define-key c++-mode-map (kbd "M-C") '(ff-find-other-file 1))

    (define-key c-mode-map (kbd "<tab>") 'company-complete)
    (define-key c++-mode-map (kbd "<tab>") 'company-complete)

    (define-key global-map (kbd "C-;") 'hs-hide-block)
    (define-key global-map (kbd "C-'") 'hs-show-block)
    (define-key global-map (kbd "<f5>") 'compile))

  (add-hook 'c++-mode-hook 'my-c-setup))

(provide 'setup-ccmode.el)
