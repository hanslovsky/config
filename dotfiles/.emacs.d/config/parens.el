(use-package highlight-parentheses
  :ensure t
  ;; use electric pair mode to create matching pairs of parens instead of autopair
  :init (electric-pair-mode 1))

(electric-pair-mode 1)

;; enable highlight-parentheses in all buffers
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)
