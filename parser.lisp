(in-package #:flow-lisp.parser)

(defun open-paren () 
  (=char #\())

(defun close-paren () 
  (=char #\)))

(defun def ()
  (=let* ((_ (=string "def")))
    (result 'def)))

(defun add ()
  (=let* ((_ (=string "+")))
    (result '+)))

(defun reserved ()
  (=or (def) (add)))

(defun non-constituent ()
  (=or (whitespace)
       (open-paren)
       (close-paren)))

(defun constituent ()
  (=and (=not (non-constituent))
	(item)))

(defun <symbol> ()
  (=let* ((exp (one-or-more (constituent))))
    (result (coerce exp 'string))))

(defun <atom> ()
  (=or (reserved)
       (<symbol>)))

(defun sexp ()
  (skip-whitespace 
   (=or (<atom>) 
	(=let* ((_ (open-paren))
		(exp (zero-or-more (sexp)))
		(_ (close-paren)))
	  (result exp)))))

;; (first (first (funcall (sexp) "(def (b))")))
