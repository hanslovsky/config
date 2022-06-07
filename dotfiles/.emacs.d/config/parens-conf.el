(install_if_missing 'highlight-parentheses)

;; use electric pair mode to create matching pairs of parens
;; instead of autopair
(electric-pair-mode 1)

;; enable highlight-parentheses in all buffers
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)
