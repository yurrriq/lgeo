(defmodule gdal
  (export all))

;;; Version Info

(defun version ()
  (case (lgeo_gdal:get_version_info "RELEASE_NAME")
    (`#(ok ,version)
      version)
    (err err)))

(defun version-str ()
  (case (lgeo_gdal:get_version_info "--version")
    (`#(ok ,version)
      version)
    (err err)))

(defun license ()
  (case (lgeo_gdal:get_version_info "LICENSE")
    (`#(ok ,license)
      license)
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
