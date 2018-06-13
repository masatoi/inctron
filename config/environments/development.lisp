(defpackage #:inctron/config/environments/development
  (:use #:cl
        #:utopian))
(in-package #:inctron/config/environments/development)

`(:databases
  ((:maindb . (:postgres :database-name "inctron"
                         ,@(with-open-file (f (project-path #P".dbconfig-secret"))
                             (read f))
               :microsecond-precision t)))
  :error-log ,(project-path #P"log/error.log"))
