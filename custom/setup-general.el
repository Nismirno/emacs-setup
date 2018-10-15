(require 'req-package)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode t)
(electric-pair-mode t)
(global-subword-mode t)
(show-paren-mode t)
(column-number-mode -1)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; set custom variables
(setq-default auto-save-default nil
              powerline-default-separator 'contour
              cursor-type 'box
              monokai-comments "#999999"
              tab-always-indent t
              undo-limit 200000
              visible-bell t
              word-wrap t
              gdb-many-windows t
              gdb-show-main t)
(set-face-attribute 'default nil :height 105 :family "Incosolata")
(set-face-attribute 'hl-line nil :background "#3a2c65")
(set-face-attribute 'font-lock-comment-face nil :foreground "gray50")
(set-face-attribute 'warning nil :foreground "gold1")
(set-face-attribute 'show-paren-match nil :foreground "dark green" :background "sky blue")
;; (set-face-attribute 'powerline-active0 t :inherit mode-line)
;; (set-face-attribute 'powerline-active1 t :background "yellow4")
;; (set-face-attribute 'powerline-inactive t :background "yellow4")
(setq show-paren-delay 0.05
      electric-pair-pairs '((?\" . ?\") (?\{ . ?\}) (?\[ . ?\]))
      electric-pair-text-pairs '((?\" . ?\") (?\' . ?\')))

(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

(req-package projectile
  :ensure t
  :init
  (progn
    (projectile-mode t)
    (setq projectile-enable-caching t)
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
    (add-to-list 'projectile-globally-ignored-directories "build")))

(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

(provide 'setup-general)
