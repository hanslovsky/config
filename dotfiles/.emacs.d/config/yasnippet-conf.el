(install_if_missing 'yasnippet)
(install_if_missing 'auto-yasnippet)

(defun my:insert-and-comment-file-contents (path)
  (let
      (
       (my:major-mode (buffer-local-value 'major-mode (current-buffer)))
       (my:comment-start comment-start) ;; get comment symbols of current major mode
       (my:comment-end comment-end) ;; get comment symbols of current major mode
       (my:year (read-string (format "Year (%s):" (format-time-string "%Y")) nil nil (format-time-string "%Y") nil))
       (my:author (read-string (format "Author (%s):" user-full-name) nil nil user-full-name nil))
       )
    (message "%s" my:major-mode)
    (with-temp-buffer
      ;; (funcall my:major-mode)
      (insert-file-contents path)
      (replace-string "${YEAR}" my:year)
      (replace-string "${AUTHOR}" my:author)
      (let
          (
           (comment-start my:comment-start)
           (comment-end my:comment-end)
           )
        (comment-region (point-min) (point-max))
        ;; (replace-str)
        (buffer-substring-no-properties (point-min) (point-max))
        )
      )
    )
  )

(setq my:licenses-path "~/.licenses")

(add-to-list 'yas-snippet-dirs "~/.emacs.d/yasnippets/") 
(yas-global-mode 1)

