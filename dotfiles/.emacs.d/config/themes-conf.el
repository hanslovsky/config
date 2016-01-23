(install_if_missing 'theme-changer)
(install_if_missing 'gandalf-theme)
(install_if_missing 'zenburn-theme)
(install_if_missing 'railscasts-theme)
(install_if_missing 'hipster-theme)
(install_if_missing 'powerline) ;; https://github.com/milkypostman/powerline ;; not sure if wanna use it
(install_if_missing 'moe-theme) ;; https://github.com/kuanyui/moe-theme.el
(install_if_missing 'material-theme) ;; pretty good theme
(install_if_missing 'minimal-theme)
(install_if_missing 'abyss-theme)

(require 'powerline) ;; needs to come before moe-theem
(require 'moe-theme)
 ;; Show highlighted buffer-id as decoration. (Default: nil)
(setq moe-theme-highlight-buffer-id t)
(setq moe-theme-resize-org-title nil) ;; (setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
(moe-light)

;; setup for sun set/rise theme changer
;; (setq calendar-location-name "Heidelberg, Germany")
;; (setq calendar-latitude 49.25)
;; (setq calendar-longitude 8.42)

(setq calendar-location-name "Janelia, VA")
(setq calendar-latitude 39.07)
(setq calendar-longitude -77.47)

(require 'theme-changer)
(change-theme 'moe-light 'moe-dark)
;; good themes: gandalf (light), (n)zenburn(dark), adawaita (light), tango(-dark), wombat (dark), tsdh-light(light)
;; good themes: moe-{light,dark}

;; add theme-changer to package list to be installed if not present
(when (not (boundp 'elpa-packages-list))
  (setq elpa-packages-list '())
  )
(add-to-list 'elpa-packages-list 'theme-changer)
(add-to-list 'elpa-packages-list 'gandalf-theme)
(add-to-list 'elpa-packages-list 'zenburn-theme)
