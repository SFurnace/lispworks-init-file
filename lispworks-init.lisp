;;; -*- mode: lisp; -*-
(in-package :cl-user)
(load-all-patches)

;;; packages
(load "~/Documents/Runable/lib/quicklisp/setup.lisp")
(ql:quickload '(:alexandria :cl-ppcre :cl-interpol) :silent t)
(system::enter-new-nicknames :alexandria '(:al))

;;; change default
(setf *read-default-float-format* 'double-float)
(mp:schedule-timer (mp:make-timer #'(lambda () (cl-interpol:enable-interpol-syntax))) 1)

;;; IDE
(setq *inspect-through-gui* t)
(setf (editor:variable-value 'editor:backups-wanted) nil)
(flet ((mac-bind-key (command key &rest specific)
         (if specific
             (apply 'editor:bind-key command key specific)
           (editor:bind-key command key :global :mac))))
  (mac-bind-key "Backward Word" "Meta-b")
  (mac-bind-key "Forward Word" "Meta-f")
  (mac-bind-key "Scroll Window Up Preserving Point" "Meta-v")
  (mac-bind-key "Kill Previous Word" "Meta-Backspace")
  (mac-bind-key "Kill Next Word" "Meta-d")
  (mac-bind-key "Query Replace Regexp" "Meta-%")
  (mac-bind-key "ISearch Forward Regexp" "Ctrl-s")
  (mac-bind-key "ISearch Backward Regexp" "Ctrl-r")
  (mac-bind-key "Find File" #("Ctrl-x" #\f))
  (mac-bind-key "Set Fill Column" #("Ctrl-x" "Ctrl-f"))
  
  (mac-bind-key "Comment Region" "Meta-;")
  (mac-bind-key "Indent Region" "Hyper-Meta-l")
  (mac-bind-key "Function Argument List" "Meta-=")
  (mac-bind-key "Function Arglist Displayer" "Meta--")
  (mac-bind-key "Delete Horizontal Space" "Meta-\\")
  
  (mac-bind-key "Describe Symbol" #("Ctrl-d" #\s))
  (mac-bind-key "Describe Class" #("Ctrl-d" #\c))
  (mac-bind-key "Describe System" #("Ctrl-d" #\S))
  (mac-bind-key "Disassemble Definition" #("Ctrl-d" #\d))
  
  (mac-bind-key "Set Buffer Package" #("Ctrl-c" #\p))
  (mac-bind-key "Load File" #("Ctrl-c" #\l))
  (mac-bind-key "Show Documentation" "F1")
  (mac-bind-key "Compile Buffer" "F7")
  (mac-bind-key "Clear Listener" #("Ctrl-c" "Meta-o") :mode "Pc Execute")
  (mac-bind-key "History Previous" "Meta-p" :mode "Pc Execute")
  (mac-bind-key "History Next" "Meta-n" :mode "Pc Execute"))
