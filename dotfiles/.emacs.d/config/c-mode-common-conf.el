(install-if-missing 'cpputils-cmake)

;; set-up hook
(defun my-c-mode-common-hook ()

  ( define-key c-mode-base-map (kbd "C-m") 'c-context-line-break ) 
  )

;; also check out M-j (c-indent-new-comment-line)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-hook 'c-mode-common-hook
          (lambda ()
            (if (derived-mode-p 'c-mode 'c++-mode)
                (cppcm-reload-all)
              )))
;; OPTIONAL, somebody reported that they can use this package with Fortran
(add-hook 'c90-mode-hook (lambda () (cppcm-reload-all)))
;; OPTIONAL, avoid typing full path when starting gdb
(global-set-key (kbd "C-c C-g")
 '(lambda ()(interactive) (gud-gdb (concat "gdb --fullname " (cppcm-get-exe-path-current-buffer)))))
