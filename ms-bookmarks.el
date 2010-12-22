;; Make sure the repository is loaded as early as possible
(setq bm-restore-repository-on-load t)
(setq-default bm-buffer-persistence t)

(require 'bm)

(global-set-key (kbd "<f2>") 'bm-toggle)
(global-set-key (kbd "ESC <f3>") 'bm-next)
(global-set-key (kbd "ESC <f2>") 'bm-previous)

(setq bm-marker 'bm-marker-right)
(setq bm-repository-file "~/.emacs.d/bm-repository.txt")

;; Loading the repository from file when on start up.
(add-hook' after-init-hook 'bm-repository-load)

;; Restoring bookmarks when on file find.
(add-hook 'find-file-hooks 'bm-buffer-restore)

;; Saving bookmark data on killing a buffer
(add-hook 'kill-buffer-hook 'bm-buffer-save)

;; Saving the repository to file when on exit.
;; kill-buffer-hook is not called when Emacs is killed, so we
;; must save all bookmarks first.
(add-hook 'kill-emacs-hook '(lambda nil
           (bm-buffer-save-all)
           (bm-repository-save)))

;; Update bookmark repository when saving the file.
(add-hook 'after-save-hook 'bm-buffer-save)

;; Restore bookmarks when buffer is reverted.
(add-hook 'after-revert-hook 'bm-buffer-restore)

;; make sure bookmarks is saved before check-in (and revert-buffer)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
