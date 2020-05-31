(require 'req-package)

(setq global-mark-ring-max 5000
      mark-ring-max 5000
      mode-require-final-newline t
      kill-ring-max 5000
      kill-whole-line t)

(setq-default tab-width 4
              indent-tabs-mode nil)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(delete-selection-mode)

(add-hook 'diff-mode-hook (lambda ()
                            (setq-local whitespace-style
                                        '(face
                                          tabs
                                          tab-mark
                                          spaces
                                          space-mark
                                          trailing
                                          indentation::space
                                          indentation::tab
                                          newline
                                          newline-mark))
                            (whitespace-mode 1)))

(req-package volatile-highlights
  :ensure t
  :init
  (volatile-highlights-mode t))

(req-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode 1))

(req-package yasnippet
  :ensure t
  :defer t
  :init
  (add-hook 'prog-mode-hook 'yas-minor-mode))

(req-package yasnippet-snippets
  :ensure t
  :defer t
  :init)

(req-package clean-aindent-mode
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'clean-aindent-mode))

(req-package dtrt-indent
  :ensure t
  :init
  (dtrt-indent-mode 1)
  (setq dtrt-indent-verbosity 0))

(req-package ws-butler
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'ws-butler-mode)
  (add-hook 'text-mode 'ws-butler-mode)
  (add-hook 'fundamental-mode 'ws-butler-mode))

(req-package comment-dwim-2
  :ensure t
  :bind (("M-;" . comment-dwim-2)))

(req-package anzu
  :ensure t
  :init
  (global-anzu-mode)
  (global-set-key (kbd "M-%") 'anzu-query-replace)
  (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp))

(req-package iedit
  :ensure t
  :bind (("C-;" . iedit-mode))
  :init
  (setq iedit-toggle-key-default nil))

;; Customized functions
(defun prelude-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.
If ARG is not nil or 1, move forward ARG - 1 lines first. If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key (kbd "C-a") 'prelude-move-beginning-of-line)
(global-set-key (kbd "M-r") 'query-replace)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'setup-editing)
