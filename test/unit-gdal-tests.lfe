(defmodule unit-gdal-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

;;; Test Data


;;; Test Version Info

(deftest version
  (is-equal (gdal:version)
            "1.11.2"))

(deftest version-str
  (is-equal (gdal:version-str)
            "GDAL 1.11.2, released 2015/02/10"))

(deftest license
  (is-equal (gdal:license)
            "GDAL/OGR is released under the MIT/X license.\nThe LICENSE.TXT distributed with GDAL/OGR should\ncontain additional details.\n"))

(deftest release-name
  (is-equal (gdal:release-name)
            "1.11.2"))

(deftest release-date
  (is-equal (gdal:release-date)
            "20150210"))

(deftest build-info
  (is-equal (gdal:build-info)
            "PAM_ENABLED=YES\nOGR_ENABLED=YES\n"))
