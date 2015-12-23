(defun copy-thing-at-point (THING)
  "Copy whatever is at point and bound specified by THING."
  (when (thing-at-point THING)
      (let ((bounds-of-current-thing (bounds-of-thing-at-point THING)))
        (copy-region-as-kill (car bounds-of-current-thing) (cdr bounds-of-current-thing))
        )
    )
)

(defun copy-word-at-point ()
    "Copy word at current point"
  (interactive)
  (copy-thing-at-point 'word)
  )

(defun copy-sentence-at-point ()
    "Copy sentence at current point"
  (interactive)
  (copy-thing-at-point 'sentence)
  )

(defun copy-line-at-point ()
    "Copy line at current point"
  (interactive)
  (copy-thing-at-point 'line)
  )

(defun copy-filename-at-point ()
    "Copy filename at current point"
  (interactive)
  (copy-thing-at-point 'filename)
  )

(global-set-key (kbd "C-c M-w") 'copy-word-at-point)
(global-set-key (kbd "C-c M-l") 'copy-line-at-point)
(global-set-key (kbd "C-c M-f") 'copy-filename-at-point)
(global-set-key (kbd "C-c M-s") 'copy-sentence-at-point)


