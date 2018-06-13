(defpackage #:inctron/controllers/root
  (:use #:cl
        #:utopian)
  (:export #:index))
(in-package #:inctron/controllers/root)

(defun index (params)
  (declare (ignore params))
  (render nil :template :index))
