;; taken from http://stackoverflow.com/a/5168886/1725687


(defun write-file-and-keep-buffer (filename)
  "Write the current buffer into FILENAME and keep original buffer"
  (interactive "FWrite to file: ")
  (save-restriction
    (widen)
    (write-region (point-min) (point-max) filename nil nil nil 'confirm))
  (find-file filename))
