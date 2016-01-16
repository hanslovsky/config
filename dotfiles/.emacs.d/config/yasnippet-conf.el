(install_if_missing 'yasnippet)
(install_if_missing 'auto-yasnippet)

(defun my:insert-and-comment-file-contents (path)
  (let
      (
       (my:major-mode (buffer-local-value 'major-mode (current-buffer)))
       (my:comment-start comment-start)
       (my:comment-end comment-end)
       )
    (message "%s" my:major-mode)
    (with-temp-buffer
      ;; (funcall my:major-mode)
      (insert-file-contents path)
      (let
          (
           (comment-start my:comment-start)
           (comment-end my:comment-end)
           )
        (comment-region (point-min) (point-max))
        (buffer-substring-no-properties (point-min) (point-max))
        )
      )
    )
  )

(setq my:licenses-path "~/.licenses")

(add-to-list 'yas-snippet-dirs "~/.emacs.d/yasnippets/") 
(yas-global-mode 1)

