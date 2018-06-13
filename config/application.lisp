(defpackage #:inctron/config/application
  (:use #:cl
        #:utopian)
  (:export #:application))
(in-package #:inctron/config/application)

(defclass application (base-app) ())


;;
;; Error pages

(defmethod on-exception ((app application) (code (eql 404)))
  (render nil :template #P"errors/404.html"))
