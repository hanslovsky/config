(install_if_missing 'theme-changer)
(install_if_missing 'gandalf-theme)
(install_if_missing 'zenburn-theme)
(install_if_missing 'railscasts-theme)
(install_if_missing 'hipster-theme)
(install_if_missing 'moe-theme) ;; https://github.com/kuanyui/moe-theme.el

(require 'moe-theme)

;; setup for sun set/rise theme changer
;; (setq calendar-location-name "Heidelberg, Germany")
;; (setq calendar-latitude 49.25)
;; (setq calendar-longitude 8.42)

(setq calendar-location-name "Janelia, VA")
(setq calendar-latitude 39.07)
(setq calendar-longitude -77.47)

(require 'theme-changer)
(change-theme 'gandalf 'zenburn)
;; good themes: gandalf (light), (n)zenburn(dark), adawaita (light), tango(-dark), wombat (dark), tsdh-light(light)

;; add theme-changer to package list to be installed if not present
(when (not (boundp 'elpa-packages-list))
  (setq elpa-packages-list '())
  )
(add-to-list 'elpa-packages-list 'theme-changer)
(add-to-list 'elpa-packages-list 'gandalf-theme)
(add-to-list 'elpa-packages-list 'zenburn-theme)
