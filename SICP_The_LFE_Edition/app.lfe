(defmodule hello-world
  (export (print-message 1)))

(defun print-message (message)
  (io:format "~s~n" (list message)))

;; The data is passed to the print-message function
(print-message "Engine Started")
