(defmodule ogr.driver
  (export all))

(defun open (filename)
  "Attempt to open the given file."
  (lgeo:open filename))

(defun open
  "Attempt to open the given file.

  The second parameter is a boolean indicated whether update access is needed
  or not.

  This function is the same as the C++ method OGRSFDriver::Open().
  "
  ((filename 'false)
    (lgeo_ogr:open filename 0))
  ((filename 'true)
    (lgeo_ogr:open filename 1)))

(defun get
  ((idx) (when (is_integer idx))
    (get-by-index idx))
  ((name) (when (is_list name))
    (get-by-name name)))

(defun get-by-index (idx)
  (lgeo_ogr:get_driver idx))

(defun get-by-name (name)
  (lgeo_ogr:get_driver_by_name name))

(defun get-name (driver)
  (lgeo_ogr:get_driver_name driver))
