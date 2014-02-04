;; set repositories for elpa
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; list of installed packages - there should be a better way to store it
(setq installed-packages-home '("annoying-arrows-mode-20130515.1534"
                                "anti-zenburn-theme-20130901.236"
                                "auto-complete-20130724.1750"
                                "calfw-20130202.2206"
                                "calfw-gcal-20120111.1900"
                                "cmake-mode-20110824"
                                "cmake-project-0.6"
                                "csv-mode-20130424.1528"
                                "fuzzy-20120323.1044"
                                "gandalf-theme-20130809.1147"
                                "google-contacts-20130430.1720"
                                "google-c-style-20130412.1615"
                                "google-maps-20130412.1130"
                                "google-this-20130822.1320"
                                "google-translate-20130614.53"
                                "google-weather-20110930.1055"
                                "goto-chg-20080919.2256"
                                "goto-last-change-20121115.1014"
                                "ipython-2927"
                                "jabber-20130827.1009"
                                "minimap-1.0"
                                "nose-20110804.819"
                                "nzenburn-theme-20130513"
                                "oauth2-0.9"
                                "popup-20130708.2245"
                                "pyde-0.6"
                                "py-import-check-20130802.1150"
                                "pymacs-0.25"
                                "pyvirtualenv-1.1"
                                "svg-clock-0.5"
                                "theme-changer-20130725.2119"
                                "undo-tree-0.6.3"
                                "vlf-0.9.1"
                                "weather-metno-20121023"
                                "windresize-0.1"
                                "yasnippet-20130902.1201"
                                "zenburn-theme-20130831.739"))


;; list of packages to be installed
(when (not (boundp 'elpa-packages-list))
  (setq elpa-packages-list '())
  )

;; install packages automatically
(load-file "~/.emacs.d/functions/acquire_packages_if_neccessary.el")
;; (add-hook 'after-init-hook '(lambda () (acquire_elpa_packages elpa-packages-list)))
