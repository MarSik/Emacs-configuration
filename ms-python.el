;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python mode customizations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'python)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(defun ms-python-hook ()
  (setq python-indent-offset 4)
  (setq python-smart-indentation nil)
  (setq indent-tabs-mode nil)
  ;;(highlight-beyond-fill-column)
  (abbrev-mode)
  ;;(yas/advise-indent-function 'indent-for-tab-command)
)

(add-hook 'python-mode-hook 'ms-python-hook)


;; pymacs
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)
