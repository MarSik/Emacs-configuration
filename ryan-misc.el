;; Use "y or n" answers instead of full words "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;Reload .emacs on the fly
(defun reload-dot-emacs()
  (interactive)
  (if(bufferp (get-file-buffer ".emacs"))
      (save-buffer(get-buffer ".emacs")))
  (load-file "~/.emacs")
  (message ".emacs reloaded successfully"))

;;Place all backup copies of files in a common location
(defconst use-backup-dir t)   
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backup/")))
      version-control t                ; Use version numbers for backups
      kept-new-versions 16             ; Number of newest versions to keep
      kept-old-versions 2              ; Number of oldest versions to keep
      delete-old-versions t            ; Ask to delete excess backup versions?
      backup-by-copying-when-linked t) ; Copy linked files, don't rename.

;;Place autosave files in a common location
(defvar autosave-dir
 (concat "~" (user-login-name) "/.emacs.d/autosave/"))

(setq auto-save-file-name-transforms
      `(("\\(?:[^/]*/\\)*\\(.*\\)", (concat autosave-dir "\\1") t))
)

;Never put tabs in files, use spaces instead
;Note: Use C-q C-i to put a real tab should the need ever arise.
(setq-default indent-tabs-mode nil)

;;Allow fetching files from HTTP servers
(url-handler-mode)

;;TRAMP should default to ssh
(setq tramp-default-method "ssh")
