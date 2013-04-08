;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (eieio-defclass-autoload) "eieio-core" "eieio-core.el"
;;;;;;  (20813 60452 0 0))
;;; Generated autoloads from eieio-core.el

(autoload 'eieio-defclass-autoload "eieio-core" "\
Create autoload symbols for the EIEIO class CNAME.
SUPERCLASSES are the superclasses that CNAME inherits from.
DOC is the docstring for CNAME.
This function creates a mock-class for CNAME and adds it into
SUPERCLASSES as children.
It creates an autoload function for CNAME's constructor.

\(fn CNAME SUPERCLASSES FILENAME DOC)" nil nil)

;;;***

;;;### (autoloads (customize-object) "eieio-custom" "eieio-custom.el"
;;;;;;  (20778 32961 0 0))
;;; Generated autoloads from eieio-custom.el

(autoload 'customize-object "eieio-custom" "\
Customize OBJ in a custom buffer.
Optional argument GROUP is the sub-group of slots to display.

\(fn OBJ &optional GROUP)" nil nil)

;;;***

;;;### (autoloads (eieio-describe-generic eieio-describe-constructor
;;;;;;  eieio-describe-class eieio-browse) "eieio-opt" "eieio-opt.el"
;;;;;;  (20778 32961 0 0))
;;; Generated autoloads from eieio-opt.el

(autoload 'eieio-browse "eieio-opt" "\
Create an object browser window to show all objects.
If optional ROOT-CLASS, then start with that, otherwise start with
variable `eieio-default-superclass'.

\(fn &optional ROOT-CLASS)" t nil)
(defalias 'describe-class 'eieio-describe-class)

(autoload 'eieio-describe-class "eieio-opt" "\
Describe a CLASS defined by a string or symbol.
If CLASS is actually an object, then also display current values of that object.
Optional HEADERFCN should be called to insert a few bits of info first.

\(fn CLASS &optional HEADERFCN)" t nil)

(autoload 'eieio-describe-constructor "eieio-opt" "\
Describe the constructor function FCN.
Uses `eieio-describe-class' to describe the class being constructed.

\(fn FCN)" t nil)
(defalias 'describe-generic 'eieio-describe-generic)

(autoload 'eieio-describe-generic "eieio-opt" "\
Describe the generic function GENERIC.
Also extracts information about all methods specific to this generic.

\(fn GENERIC)" t nil)

;;;***

;;;### (autoloads (enable-visual-studio-bookmarks) "linemark" "linemark.el"
;;;;;;  (20580 44388 0 0))
;;; Generated autoloads from linemark.el

(autoload 'enable-visual-studio-bookmarks "linemark" "\
Bind the viss bookmark functions to F2 related keys.
\\<global-map>
\\[viss-bookmark-toggle]     - To=ggle a bookmark on this line.
\\[viss-bookmark-next-buffer]   - Move to the next bookmark.
\\[viss-bookmark-prev-buffer]   - Move to the previous bookmark.
\\[viss-bookmark-clear-all-buffer] - Clear all bookmarks.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("chart.el" "eieio-base.el" "eieio-datadebug.el"
;;;;;;  "eieio-speedbar.el" "eieio.el") (20828 17394 488217 925000))

;;;***

(provide 'loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; loaddefs.el ends here
