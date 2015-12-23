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

(global-set-key (kbd "C-c M-w") 'copy-word-at-point)


