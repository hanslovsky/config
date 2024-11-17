(use-package theme-changer :ensure t)
(use-package gandalf-theme :ensure t)
;; (use-package zenburn-theme :ensure t)
(use-package railscasts-theme :ensure t)
;; (use-package moe-theme :ensure t) ;; https://github.com/kuanyui/moe-theme.el ;; currently not working for some reason
(use-package material-theme :ensure t) ;; pretty good theme
(use-package minimal-theme :ensure t)
(use-package abyss-theme :ensure t)
(use-package seti-theme :ensure t) ;; pretty good dark theme
(use-package ample-theme :ensure t) ;; dark theme (flat version is pretty good, light might lack contrast)
(use-package monokai-theme :ensure t) ;; dark theme, seems to be sublime inspired
(use-package color-theme-sanityinc-tomorrow :ensure t) ;; eighties, night seem good, day is a good light theme
(use-package alect-themes :ensure t) ;; alect-dark-alt seems to be nice dark theme
(use-package hemisu-theme :ensure t) ;; try these for now
(use-package waher-theme :ensure t ) ;; too much contrast!
(use-package solarized-theme :ensure t)

;; Show highlighted buffer-id as decoration. (Default: nil)
;; (setq moe-theme-highlight-buffer-id t)
;; (setq moe-theme-resize-org-title nil) ;; (setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))


;; config for theme changer
(require 'json)
(defvar my:location-info '((countryCode . "US")
                           (city . "Alexandria")
                           (region . "VA")
                           (regionName . "Virginia")
                           (timezone . "America/New_York")
                           (lat . "38.77275200260602")
                           (lon . "-77.14527852335527")))

(defun my:update-calendar-from-location-info()
  (setq calendar-location-name (concat (alist-get 'countryCode my:location-info) "_" (alist-get 'city  my:location-info)))
  (setq calendar-latitude (alist-get 'lat my:location-info))
  (setq calendar-longitude (alist-get 'lon my:location-info)))

(my:update-calendar-from-location-info)

;; read longitute and latitude from freegeoip
(defun my:update-location-info()
  (interactive)
  (setq my:location-info (json-read-from-string (shell-command-to-string '"curl -s 'http://ip-api.com/json'" )))
  (my:update-calendar-from-location-info))


(change-theme 'tsdh-light 'alect-dark)
