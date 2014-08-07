;; set-up hook
(defun my-c-mode-common-hook ()

  ( define-key c-mode-base-map (kbd "C-m") 'c-context-line-break ) 
  )

;; also check out M-j (c-indent-new-comment-line)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
