(defpackage #:inctron/config/routes
  (:use #:cl
        #:utopian
        #:inctron/config/application)
  (:export #:*app*))
(in-package #:inctron/config/routes)

(defvar *app* (make-instance 'application))
(clear-routing-rules *app*)

;;
;; Routing rules

(route :GET "/" "root:index")
