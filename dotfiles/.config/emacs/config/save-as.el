;; from https://stackoverflow.com/a/13712576/1725687

(defun save-as-and-switch (filename)
  "Clone the current buffer and switch to the clone"
  (interactive "Save as and switch to new buffer: ")
  (save-restriction
    (widen)
    (write-region (point-min) (point-max) filename nil nil nil 'confirm))
  (find-file filename))

(defun save-as-but-do-not-switch (filename)
  "Clone the current buffer but don't switch to the clone"
  (interactive "Save as but stay in current buffer:")
  (write-region nil nil filename))
;;  (find-file-noselect filename))

(defun save-as (filename)
  "Prompt user whether to switch to the clone."
  (interactive "Save as: ")
  (if (y-or-n-p "Switch to new file?")
    (save-as-and-switch filename)
    (save-as-but-do-not-switch filename)))
