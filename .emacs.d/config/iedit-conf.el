(install_if_missing 'iedit)

;; due to a bug, C-; works only after iedit-mode has been called once or key is mapped
(define-key global-map (kbd "C-;") 'iedit-mode)
;; same for iedit-rectangle-mode
(define-key global-map (kbd "C-x r <return>") 'iedit-rectangle-mode)
