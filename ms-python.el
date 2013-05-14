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

(require 'jedi)
(setq jedi:complete-on-dot t)
(setq jedi:server-command (list "python" jedi:server-script))

(defun ms-python-hook ()
  (setq python-indent-offset 4)
  (setq python-smart-indentation nil)
  (setq indent-tabs-mode nil)
  ;;(highlight-beyond-fill-column)
  (abbrev-mode)
  ;;(yas/advise-indent-function 'indent-for-tab-command)
  ;;(semantic-mode 1)

  (jedi:setup)
  (setq ac-sources '(ac-source-yasnippet
                     ac-source-jedi-direct
                     ac-source-dictionary
                     ac-source-features
                     ac-source-abbrev
                     ac-source-words-in-same-mode-buffers
                     ))

  (local-set-key (kbd "\C-c?") 'jedi:show-doc)
;  (local-set-key (kbd "\C-cp") 'semantic-analyze-proto-impl-toggle)
;  (local-set-key (kbd "\C-c \C-r") 'semantic-symref)
  (local-set-key (kbd "\C-xj") 'jedi:goto-definition)
  ;(add-to-list 'ac-sources 'ac-source-gtags)
  ;(add-to-list 'ac-sources 'ac-source-semantic)
)

(add-hook 'python-mode-hook 'ms-python-hook)
