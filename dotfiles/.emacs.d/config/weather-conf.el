(install_if_missing 'weather-metno)

;; add weather-metno to package list to be installed if not present
(when (not (boundp 'elpa-packages-list))
  (setq elpa-packages-list '())
  )
(add-to-list 'elpa-packages-list 'weather-metno)

;; weather-metno
(setq weather-metno-location-name "Heidelberg, Germany"
      weather-metno-location-latitude 49
      weather-metno-location-longitude 8)
(require 'org-weather-metno)
