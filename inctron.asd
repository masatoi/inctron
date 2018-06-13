(defsystem "inctron"
  :class :package-inferred-system
  :version "0.1.0"
  :author ""
  :license ""
  :description ""
  :depends-on ("inctron/boot"
               "cl-syntax-annot")
  :in-order-to ((test-op (test-op "inctron/tests"))))

(register-system-packages "inctron/boot" '(#:inctron))
