(install_if_missing 'theme-changer)
(install_if_missing 'gandalf-theme)
(install_if_missing 'zenburn-theme)
(install_if_missing 'railscasts-theme)
;; (install_if_missing 'hipster-theme) not available currently
(install_if_missing 'powerline) ;; https://github.com/milkypostman/powerline ;; not sure if wanna use it
(install_if_missing 'moe-theme) ;; https://github.com/kuanyui/moe-theme.el
(install_if_missing 'material-theme) ;; pretty good theme
(install_if_missing 'minimal-theme)
(install_if_missing 'abyss-theme)
(install_if_missing 'seti-theme) ;; pretty good dark theme
(install_if_missing 'ample-theme) ;; dark theme (flat version is pretty good, light might lack contrast)
(install_if_missing 'monokai-theme) ;; dark theme, seems to be sublime inspired
(install_if_missing 'color-theme-sanityinc-tomorrow) ;; eighties, night seem good, day is a good light theme
(install_if_missing 'alect-themes) ;; alect-dark-alt seems to be nice dark theme
(install_if_missing 'hemisu-theme) ;; try these for now
(install_if_missing 'waher-theme ) ;; too much contrast!
(install_if_missing 'solarized-theme)

(require 'powerline) ;; needs to come before moe-theme
(require 'moe-theme)
(require 'json)
 ;; Show highlighted buffer-id as decoration. (Default: nil)
(setq moe-theme-highlight-buffer-id t)
(setq moe-theme-resize-org-title nil) ;; (setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
(moe-light)

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

;; theme changer not working as of 2018-07-10
(require 'theme-changer)
;; (change-theme 'moe-light 'seti)
;; (change-theme 'hemisu-light 'seti)
;; good themes: gandalf (light), (n)zenburn(dark), adawaita (light), tango(-dark), wombat (dark), tsdh-light(light)
;; good themes: moe-{light,dark}
;; good themes: material{,-light}
;; (load-theme 'moe-light t)
(change-theme 'solarized-light 'material)

