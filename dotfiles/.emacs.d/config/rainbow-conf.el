(use-package rainbow-mode
  :ensure t
  :config
  (define-globalized-minor-mode global-rainbow-mode rainbow-mode
    (lambda () (rainbow-mode 1)))
  (global-rainbow-mode 1) ;; enable rainbow mode in every buffer (global minor mode)
  )
(use-package rainbow-delimiters :ensure t :hook (prog-mode LaTeX-mode))
(use-package rainbow-identifiers :ensure t)

