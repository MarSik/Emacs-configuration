;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python mode customizations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'python)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-ctable/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-deferred/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-epc/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-jedi/"))

;(setq 'jedi:complete-on-dot t)
(autoload 'jedi:setup "jedi" nil t)

(defun ms-python-hook ()
  (setq python-indent-offset 4)
  (setq python-smart-indentation nil)
  (setq indent-tabs-mode nil)
  ;;(highlight-beyond-fill-column)
  (abbrev-mode)
  ;;(yas/advise-indent-function 'indent-for-tab-command)

  (local-set-key (kbd "\C-c?") 'jedi:show-doc)
  (local-set-key (kbd "\C-cp") 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "\C-c \C-r") 'semantic-symref)
  (local-set-key (kbd "\C-xj") 'jedi:goto-definition)
  ;(add-to-list 'ac-sources 'ac-source-gtags)
  ;(add-to-list 'ac-sources 'ac-source-semantic)
  (local-set-key [(control return)] 'jedi:complete)

)

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'ms-python-hook)

;; pymacs
;(require 'pymacs)
;(pymacs-load "ropemacs" "rope-")
;(setq ropemacs-enable-autoimport t)
