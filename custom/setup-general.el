(require 'req-package)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode t)
(electric-pair-mode t)
(global-subword-mode t)
(show-paren-mode t)
(column-number-mode -1)
(global-display-line-numbers-mode t)

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
              gdb-show-main t
              split-width-threshold 300)
(set-face-attribute 'default nil :height 105 :family "Inconsolata")
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

(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(prefer-coding-system 'cp866)
(prefer-coding-system 'koi8-r-unix)
(prefer-coding-system 'windows-1251-dos)
(prefer-coding-system 'utf-8)

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
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(provide 'setup-general)
