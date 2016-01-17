(defmodule unit-lgeo-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

;;; Test Data


;;; Test Version Info

(deftest version
  (is-equal (lgeo:version)
            '(#(erlang "18")
              #(emulator "7.1")
              #(driver-version "3.2")
              #(lfe "0.10.1")
              #(lutil "0.7.0")
              #(gdal/ogr "1.11.2")
              #(lgeo "0.2.0"))))

(deftest gdal-version
  (is-equal (lgeo:gdal-version)
            "GDAL 1.11.2, released 2015/02/10"))

(deftest release-name
  (is-equal (lgeo:release-name)
            "1.11.2"))

(deftest release-date
  (is-equal (lgeo:release-date)
            "20150210"))

(deftest build-info
  (is-equal (lgeo:build-info)
            "PAM_ENABLED=YES\nOGR_ENABLED=YES\n"))
