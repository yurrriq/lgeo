(defmodule lgeo-util
  (export all))

(defun get-so-file (so-name)
  (case (code:priv_dir so-name)
    (#(error bad_name)
      (case (filelib:is_dir (filename:join '(".." "priv")))
        ('true (filename:join `(".." "priv" ,so-name)))
        ('false (filename:join `("priv" ,so-name)))))
    (dir
      (case (os:getenv "ESCRIPT")
        ("1" (filename:join `(,(filename:dirname (escript:script_name))
                              ".."
                              "lib"
                              ,so-name)))
        (_ (filename:join dir so-name))))))
