;; punishment for using arrow keys or other 1 char keys for scrolling:
(require 'annoying-arrows-mode)
(global-annoying-arrows-mode)
(setq visible-bell t) ;; no system beep but visible signal instead
(setq annoying-arrows-too-far-count 15) ;; set the number of 1 char moves before signal
