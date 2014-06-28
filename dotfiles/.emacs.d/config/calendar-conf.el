(install_if_missing 'calfw)
(install_if_missing 'calfw-gcal)

;; calendar view framework (calfw + calfw-gcal for google)
(require 'calfw)
(require 'calfw-gcal)

;; add calfw to package list to be installed if not present
(when (not (boundp 'elpa-packages-list))
  (setq elpa-packages-list '())
  )
(add-to-list 'elpa-packages-list 'calfw)
(add-to-list 'elpa-packages-list 'calfw-gcal)
