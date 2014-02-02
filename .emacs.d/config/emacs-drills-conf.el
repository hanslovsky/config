(install_if_missing 'annoying-arrows-mode)

;; add annoying-arrows-mode to package list to be installed if not present
(when (not (boundp 'elpa-packages-list))
  (setq elpa-packages-list '())
  )
(add-to-list 'elpa-packages-list 'annoying-arrows-mode)

;; punishment for using arrow keys or other 1 char keys for scrolling:
(require 'annoying-arrows-mode)
(global-annoying-arrows-mode)
(setq visible-bell t) ;; no system beep but visible signal instead
(setq annoying-arrows-too-far-count 15) ;; set the number of 1 char moves before signal
