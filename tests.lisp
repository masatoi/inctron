#.`(uiop:define-package #:inctron/tests
     (:use #:cl)
     (:import-from #:rove)
     (:import-from #:utopian)
     (:import-from #:mito)
     (:import-from #:inctron)
     ,@(labels ((directory-models (dir)
                  (append
                   (uiop:directory-files dir "*.lisp")
                   (mapcan #'directory-models (uiop:subdirectories dir)))))
         (mapcar (lambda (file)
                   `(:import-from
                     ,(second
                       (asdf/package-inferred-system::file-defpackage-form file))))
                 (directory-models (asdf:system-relative-pathname '#:inctron #P"tests/")))))
(in-package #:inctron/tests)

(defun run (system-name)
  (let ((system (asdf:find-system system-name)))
    (rove:with-local-envs '(("APP_ENV" . "test"))
      (apply #'mito:connect-toplevel (utopian:connection-settings :maindb))
      (unwind-protect
           (progn
             (mito:migrate (utopian:project-path "db/"))
             (rove:run system))
        (dbi:disconnect mito:*connection*)))))

(defmethod asdf:perform :after ((op asdf:test-op) (system (eql (asdf:find-system '#:inctron/tests))))
  (run system))
