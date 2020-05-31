(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode t)
;;(global-semantic-idle-scheduler-mode t)
(global-semantic-stickyfunc-mode t)

(defun custom-cedet-hook ()
  (local-set-key (kbd "C-c C-j") 'semantic-ia-fast-jump)
  (local-set-key (kbd "C-c C-s") 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'custom-cedet-hook)
(add-hook 'c-mode-hook 'custom-cedet-hook)
(add-hook 'c++-mode-hook 'custom-cedet-hook)

;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode t)

(provide 'setup-cedet)
