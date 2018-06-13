(defpackage #:inctron/config/environments/test
  (:use #:cl
        #:utopian))
(in-package #:inctron/config/environments/test)

`(:databases
  ((:maindb . (:postgres :database-name "inctron_test"
                         ;; :username "inctron"
                         ;; :password ""
                         :microsecond-precision t))))
