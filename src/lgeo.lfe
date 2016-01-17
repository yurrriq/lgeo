(defmodule lgeo
  (on_load #(init 0))
  (export all))

;;; Version Info

(defun version ()
  (++ (lutil:get-versions)
      `(#(gdal/ogr ,(gdal:version))
        #(lgeo ,(lcfg-proj:get-version)))))


(defun license ()
  (++ "\nGDAL/OGR\n--------\n" (gdal:license) "\n\n"
      "lgeo\n----\n"
      ;; XXX submit a ticket to the lcfg project to add support for
      ;;     lcfg-proj:get-license function ...
      (lcfg:get-in (lcfg-proj:get-project-config) '(meta license name))
      "\n\n"))
