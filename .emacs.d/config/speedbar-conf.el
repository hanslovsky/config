;; sr-speedbar
(require 'sr-speedbar)

;; bind toggle to f8
(global-set-key (kbd "<f8>") 'sr-speedbar-toggle)

;; turn on refresh automatically
(sr-speedbar-refresh-turn-on)

;; turn of C-o for speedbar; use f9 instead to go to speedbar window
(setq sr-speedbar-skip-other-window-p t)
(global-set-key (kbd "<f9>") 'sr-speedbar-select-window)

;; set window width in terminal and x
(setq sr-speedbar-width-x 100)
(setq sr-speedbar-width-console 100)

;; speedbar should appear on the left
(setq sr-speedbar-right-side nil)

;; add speedbar to after-init-hook
;; need to call function directyl instead of adding to hook:
;; emacs will hang on startup otherwise
(sr-speedbar-toggle)
