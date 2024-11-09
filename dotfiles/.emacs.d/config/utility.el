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

(defun find-deepest-occurrence (path filename)
  (interactive)
  (let (
        (components (reverse (split-string path "/" t)))
        (my:result nil)
        )
    (when (equal (substring path 0 1) "/")
      (setq components (append components '("")))
      )
      (while components
        (let ((current-dir (string-join (reverse components) "/"))) ;; better way to do this?
          (when (equal current-dir "")
            (setq current-dir "/"))
          (when (file-exists-p (concat (file-name-as-directory current-dir) filename))
                (setq my:result current-dir)
                )
          )
        (setq-local components (cdr components)))
      (identity my:result)
      )
  )

