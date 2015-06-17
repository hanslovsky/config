(install_if_missing 'rainbow-mode)
(install_if_missing 'rainbow-delimiters)
(install_if_missing 'rainbow-identifiers)
(install_if_missing 'rainbow-blocks)
(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))

(my-global-rainbow-mode 1)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-identifiers-mode)

;; make own conf file for lisp?
(add-hook 'prog-mode-hook #'rainbow-blocks-mode)
