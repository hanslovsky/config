(install_if_missing 'theme-changer)
(install_if_missing 'gandalf-theme)
(install_if_missing 'zenburn-theme)

;; setup for sun set/rise theme changer
(setq calendar-location-name "Heidelberg, Germany")
(setq calendar-latitude 49.25)
(setq calendar-longitude 8.42)
(require 'theme-changer)
(change-theme 'gandalf 'zenburn)
;; good themes: gandalf, (n)zenburn, adawaita, tango(-dark), wombat, tsdh-light

;; add theme-changer to package list to be installed if not present
(when (not (boundp 'elpa-packages-list))
  (setq elpa-packages-list '())
  )
(add-to-list 'elpa-packages-list 'theme-changer)
(add-to-list 'elpa-packages-list 'gandalf-theme)
(add-to-list 'elpa-packages-list 'zenburn-theme)
