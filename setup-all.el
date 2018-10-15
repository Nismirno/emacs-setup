;;; setup-all.el --- Set up everything from this file
;;; Commentary:
;;; Code:
(require 'server)
(unless (server-running-p)
  (server-start))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))

(defconst custom-setup-dir "~/.emacs.d/custom")

(eval-when-compile (package-initialize))

(defun require-package (package)
"Refresh PACKAGE archives, check PACKAGE presence and install if it's not installed."
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
                                  (progn (package-refresh-contents)
                                         package-archive-contents)
                                package-archive-contents))
                    (AVAIL (assoc package ARCHIVES)))
               (if AVAIL
                   (package-install package)))
             (require package))))

(require-package 'use-package)
(require 'use-package)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require-package 'el-get)
(require 'el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
(el-get 'sync)

(use-package use-package-el-get
  :ensure t
  :config (use-package-el-get-setup))

(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1))

(use-package req-package
  :ensure t
  :config (req-package--log-set-level 'debug))

(req-package load-dir
  :ensure t
  :force true
  :init
  (setq force-load-messages nil)
  (setq load-dir-debug nil)
  (setq load-dir-recursive t)
  :config
  (load-dir-one custom-setup-dir)
  (req-package-finish))
;;; setup-all.el ends here
