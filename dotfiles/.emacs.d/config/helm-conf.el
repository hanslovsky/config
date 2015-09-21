(install_if_missing 'helm)
(install_if_missing 'helm-ls-git)
(install_if_missing 'ac-helm)

;; check https://github.com/thierryvolpiatto/emacs-tv-config/blob/master/init-helm-thierry.el for reference

(global-set-key (kbd "M-x")                          'undefined)
(global-set-key (kbd "M-x")                          'helm-M-x)
(global-set-key (kbd "M-y")                          'helm-show-kill-ring)
(global-set-key (kbd "C-c f")                        'helm-recentf)
(global-set-key (kbd "C-x C-f")                      'helm-find-files)
; (global-set-key (kbd "C-:")                          'ac-complete-with-helm)
(global-set-key (kbd "C-x b")                        'helm-buffers-list)

; (define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)
