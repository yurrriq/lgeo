(defmodule lgeo
  (on_load #(init 0))
  (export all))

;;; Version Info

(defun version ()
  "Get the version information for all major components of the lgeo project."
  (++ (lutil:get-versions)
      `(#(gdal/ogr ,(gdal:version))
        #(lgeo ,(lcfg-proj:get-version)))))


(defun license ()
  "Get the combined licenses of the GIS components."
  (++ "\nGDAL/OGR\n--------\n" (gdal:license) "\n\n"
      "lgeo\n----\n"
      ;; XXX submit a ticket to the lcfg project to add support for
      ;;     lcfg-proj:get-license function ...
      (lcfg:get-in (lcfg-proj:get-project-config) '(meta license name))
      "\n\n"))
