(defpackage #:inctron/tests/main
  (:use #:cl
        #:rove))
(in-package #:inctron/tests/main)

(deftest test-something
  (ok (= 1 1)))
