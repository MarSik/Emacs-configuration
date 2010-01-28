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

;;; Copy thing-at-point intelligently
(defun sdl-kill-ring-save-thing-at-point (&optional n)
  "Save THING at point to kill-ring."
  (interactive "p")
  (let ((things '((?l . list) (?f . filename) (?w . word) (?s . sexp)))
        (message-log-max)               ; don't write to *Message*
        beg t-a-p thing event)
    (flet ((get-thing ()
                      (save-excursion
                        (beginning-of-thing thing)
                        (setq beg (point))
                        (if (= n 1)
                            (end-of-thing thing)
                          (forward-thing thing n))
                        (buffer-substring beg (point)))))
      ;; try detecting url email and fall back to 'line'
      (dolist (thing '(url email line))
        (when (bounds-of-thing-at-point thing)
          (setq t-a-p (get-thing))
          ;; remove the last newline character
          (when (and (eq thing 'line)
                     (>= (length t-a-p) 1)
                     (equal (substring t-a-p -1) "\n"))
            (setq t-a-p (substring t-a-p 0 -1)))
          (kill-new t-a-p)
          (message "%s" t-a-p)
          (return nil)))
      (setq event (read-event nil))
      (when (setq thing (cdr (assoc event things)))
        (clear-this-command-keys t)
        (if (not (bounds-of-thing-at-point thing))
            (message "No %s at point" thing)
          (setq t-a-p (get-thing))
          (kill-new t-a-p 'replace)
          (message "%s" t-a-p))
        (setq last-input-event nil))
      (when last-input-event
        (clear-this-command-keys t)
        (setq unread-command-events (list last-input-event))))))

(defun sdl-kill-ring-save-dwim ()
  "This command dwim on saving text.

If region is active, call `kill-ring-save'. Else, call
`sdl-kill-ring-save-thing-at-point'.

This command is to be used interactively."
  (interactive)
  (if (use-region-p)
      (call-interactively 'kill-ring-save)
    (call-interactively 'sdl-kill-ring-save-thing-at-point)))

(global-set-key (kbd "M-w") 'sdl-kill-ring-save-dwim)

;;
;; C-x k in server mode kills the buffer using the "server way" (C-x #)
;;

(add-hook 'server-switch-hook 
          (lambda ()
            (when (current-local-map)
              (use-local-map (copy-keymap (current-local-map))))
            (local-set-key (kbd "C-x k") 'server-edit)))
