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
              #(lgeo "0.2.0-dev"))))

(deftest license
  (is-equal (lgeo:license)
            "\nGDAL/OGR\n--------\nGDAL/OGR is released under the MIT/X license.\nThe LICENSE.TXT distributed with GDAL/OGR should\ncontain additional details.\n\n\nlgeo\n----\nApache License, Version 2.0\n\n"))

