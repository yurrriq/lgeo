(defmodule lgeo
  (on_load #(init 0))
  (export all))

;;; Version Info

(defun version ()
  (case (lgeo_gdal:get_version_info "RELEASE_NAME")
    (`#(ok ,version)
      (++ (lutil:get-versions)
          `(#(gdal/ogr ,version)
            #(lgeo ,(lcfg-proj:get-version)))))
    (err err)))

(defun gdal-version ()
  (case (lgeo_gdal:get_version_info "--version")
    (`#(ok ,version)
      version)
    (err err)))

(defun license ()
  (case (lgeo_gdal:get_version_info "LICENSE")
    (`#(ok ,license)
      (++ "\nGDAL/OGR\n--------\n" license "\n\n"
          "lgeo\n----\n"
          ;; XXX submit a ticket to the lcfg project to add support for
          ;;     lcfg-proj:get-license function ...
          (lcfg:get-in (lcfg-proj:get-project-config) '(meta license name))
          "\n\n"))
    (err err)))

(defun release-name ()
  (case (lgeo_gdal:get_version_info "RELEASE_NAME")
    (`#(ok ,name)
      name)
    (err err)))

(defun release-date ()
  (case (lgeo_gdal:get_version_info "RELEASE_DATE")
    (`#(ok ,date)
      date)
    (err err)))

(defun build-info ()
  (case (lgeo_gdal:get_version_info "BUILD_INFO")
    (`#(ok ,info)
      info)
    (err err)))

(defun format-license ()
  (lfe_io:format "~s" `(,(license))))

(defun format-build-info ()
  (lfe_io:format "~s" `(,(build-info))))

