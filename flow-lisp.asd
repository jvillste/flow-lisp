;;;; flow-lisp.asd

(asdf:defsystem #:flow-lisp
  :serial t
  :description "Describe flow-lisp here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :depends-on (#:smug)
  :components ((:file "package")
	       (:file "parser")))

