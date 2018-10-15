
;;; package --- Summary
;;; Commentary:
;;; Code:
(setq debug-on-error t)

(require 'package)

(package-initialize)
(require 'monokai-theme)
(require 'ido)

(setq package-enable-at-startup nil)
(setq auto-save-default nil)
(setq make-backup-files nil)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/setup-all.el")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" default)))
 '(electric-pair-pairs (quote ((34 . 34) (123 . 125) (91 . 93) (60 . 62))))
 '(package-selected-packages
   (quote
    (smart-mode-line-powerline-theme smart-mode-line powerline irony-eldoc sr-speedbar helm-gtags iedit anzu comment-dwim-2 ws-butler dtrt-indent clean-aindent-mode volatile-highlights yasnippet undo-tree flycheck-pos-tip company-c-headers company-quickhelp bash-completion shell-pop company-shell load-dir use-package-chords use-package-el-get req-package helm projectile smartparens smart-tabs-mode org monokai-theme molokai-theme indent-guide flycheck-irony company-irony-c-headers company-irony beacon aggressive-indent)))
 '(safe-local-variable-values
   (quote
    ((flycheck-clang-include-path . "/home/nismirno/linux/include")
     (company-clang-arguments "-I/home/nismirno/linux/include")
     (company-clang-arguments "-I/home/nismirno/work_test/include"))))
 '(sml/theme (quote respectful)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
