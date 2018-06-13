(push (uiop:pathname-directory-pathname *load-pathname*)
      asdf:*central-registry*)
(ql:quickload :inctron :silent t)

(defpackage #:inctron/app
  (:use #:cl
        #:inctron
        #:utopian)
  (:import-from #:lack
                #:builder)
  (:import-from #:mito))
(in-package #:inctron/app)

(apply #'mito:connect-toplevel (connection-settings :maindb))

(builder
 (:static
  :path "/public/"
  :root (project-path #P"public/"))
 :accesslog
 (unless (productionp)
   :clack-errors)
 (when (config :error-log)
   `(:backtrace :output ,(config :error-log)))
 :session
 :csrf
 *app*)
