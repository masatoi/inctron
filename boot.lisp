(uiop:define-package #:inctron
  (:use #:cl
        #:utopian)
  (:import-from #:clack)
  (:import-from #:clack-errors)
  (:use-reexport #:inctron/config/application
                 #:inctron/config/routes)
  (:export #:start
           #:stop))
(in-package #:inctron)

(defvar *handler*)

(defun start (&rest args &key server port debug &allow-other-keys)
  (declare (ignore server port debug))
  (when (boundp '*handler*)
    (restart-case (error "Server is already running")
      (restart-server ()
        :report "Restart the server"
        (stop))))
  (setf *handler*
        (apply #'clack:clackup (project-path #P"app.lisp") args)))

(defun stop ()
  (prog1
      (when (boundp '*handler*)
        (clack:stop *handler*))
    (makunbound '*handler*)))
