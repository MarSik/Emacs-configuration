;;; Complete symbols at point using Pymacs.

;; Copyright (C) 2007  Skip Montanaro

;; Author:     Skip Montanaro
;; Maintainer: skip@pobox.com
;; Created:    Oct 2004
;; Keywords:   python pymacs emacs

;; This software is provided as-is, without express or implied warranty.
;; Permission to use, copy, modify, distribute or sell this software,
;; without fee, for any purpose and by any individual or organization, is
;; hereby granted, provided that the above copyright notice and this
;; paragraph appear in all copies.

;; Along with pycomplete.py this file allows programmers to complete Python
;; symbols within the current buffer.  See pycomplete.py for the Python side
;; of things and a short description of what to expect.

(require 'pymacs)
(require 'python-mode)

(pymacs-load "pycomplete")

(defun py-complete ()
  (interactive)
  (let ((pymacs-forget-mutability t)) 
    (insert (pycomplete-pycomplete (py-symbol-near-point)
				   (py-find-global-imports)))))

(defun py-find-global-imports ()
  (save-excursion
    (let (first-class-or-def imports)
      (goto-char (point-min))
      (setq first-class-or-def
	    (re-search-forward "^ *\\(def\\|class\\) " nil t))
      (goto-char (point-min))
      (setq imports nil)
      (while (re-search-forward
	      "^\\(import \\|from \\([A-Za-z_][A-Za-z_0-9]*\\) import \\).*"
	      nil t)
	(setq imports (append imports
			      (list (buffer-substring
				     (match-beginning 0)
				     (match-end 0))))))
      imports)))

(define-key python-mode-map "\M-\C-i"  'py-complete)

(provide 'pycomplete)
