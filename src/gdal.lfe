(defmodule gdal
  (export all))

;;; Convenience Aliases

(defun open (filename)
  (gdal.dataset:open filename))

(defun open (filename access)
  (gdal.dataset:open filename access))

;;; Version Info

(defun version ()
  "Returns the GDAL_RELEASE_NAME."
  (case (lgeo_gdal:get_version_info "RELEASE_NAME")
    (`#(ok ,version)
      version)
    (err err)))

(defun version-str ()
  "Returns one line version message suitable for use in response to
  --version requests."
  (case (lgeo_gdal:get_version_info "--version")
    (`#(ok ,version)
      version)
    (err err)))

(defun license ()
  "Returns the content of the LICENSE.TXT file from the GDAL_DATA directory."
  (case (lgeo_gdal:get_version_info "LICENSE")
    (`#(ok ,license)
      license)
    (err err)))

(defun release-number ()
  "Returns GDAL_VERSION_NUM formatted as a string."
  (case (lgeo_gdal:get_version_info "VERSION_NUM")
    (`#(ok ,name)
      name)
    (err err)))

(defun release-name ()
  "Returns the GDAL_RELEASE_NAME."
  (case (lgeo_gdal:get_version_info "RELEASE_NAME")
    (`#(ok ,name)
      name)
    (err err)))

(defun release-date ()
  "Returns GDAL_RELEASE_DATE formatted as a string."
  (case (lgeo_gdal:get_version_info "RELEASE_DATE")
    (`#(ok ,date)
      date)
    (err err)))

(defun build-info ()
  "List of NAME=VALUE pairs separated by newlines with information on build
  time options."
  (case (lgeo_gdal:get_version_info "BUILD_INFO")
    (`#(ok ,info)
      info)
    (err err)))

(defun format-license ()
  "Prints output of license()."
  (lfe_io:format "~s" `(,(license))))

(defun format-build-info ()
  "Prints output of build-info()."
  (lfe_io:format "~s" `(,(build-info))))
