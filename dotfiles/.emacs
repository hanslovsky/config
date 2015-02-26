;; This is my emacs.d file. It has grown over time and will certainly do so in future
;; To put some structure in my config I decided to split it up into smaller config files

;; this has to go before any packae is loaded that has been installed using elpa
;; see: http://stackoverflow.com/questions/17598801/emacs-sometimes-cant-open-load-file
(package-initialize)

;; this is here because emacs doesn't know oxygen font and fucks up
(setq default-frame-alist '((font . "monofur-15")))

;; elpa
(load-file "~/.emacs.d/config/elpa-conf.el")

;; auctex
(load-file "~/.emacs.d/config/auctex-conf.el")

;; auto-complete
(load-file "~/.emacs.d/config/auto-complete-conf.el")

;; general config
(load-file "~/.emacs.d/config/general-conf.el")

;; iedit
(load-file "~/.emacs.d/config/iedit-conf.el")

;; jabber
;; (load-file "~/.emacs.d/config/jabber-conf.el")

;; tramp
(load-file "~/.emacs.d/config/tramp-conf.el")

;; minimap
(load-file "~/.emacs.d/config/minimap-conf.el")

;; sublimity - might be better than minimap
;; in the end not of any use
;; (load-file "~/.emacs.d/config/sublimity-conf.el")

;; c++ settings
(load-file "~/.emacs.d/config/cxx-conf.el")

;; theme related settings
(load-file "~/.emacs.d/config/themes-conf.el")

;; matlab
(load-file "~/.emacs.d/config/matlab-conf.el")

;; cmake
(load-file "~/.emacs.d/config/cmake-conf.el")

;; calendar
(load-file "~/.emacs.d/config/calendar-conf.el")

;; org
(load-file "~/.emacs.d/config/org-conf.el")

;; weather
(load-file "~/.emacs.d/config/weather-conf.el")

;; drills
(load-file "~/.emacs.d/config/emacs-drills-conf.el")

;; speedbar - deactivate now due to a bug with emacsclient
;; (load-file "~/.emacs.d/config/speedbar-conf.el")

;; cedet
(load-file "~/.emacs.d/config/cedet-conf.el")

;; Emacs-IDE
(load-file "~/.emacs.d/config/ide-conf.el")

;; mu4e
;; (load-file "~/.emacs.d/config/mu4e-conf.el")

;; undo tree
(load-file "~/.emacs.d/config/undo-tree-conf.el")

;; magit
(load-file "~/.emacs.d/config/magit-conf.el")

;; flymake
(load-file "~/.emacs.d/config/flymake-conf.el")

;; yasnippet
(load-file "~/.emacs.d/config/yasnippet-conf.el")

;; python-mode
(load-file "~/.emacs.d/config/python-conf.el")

;; jedi
(load-file "~/.emacs.d/config/jedi-conf.el")

;; gnuplot
(load-file "~/.emacs.d/config/gnuplot-conf.el")

;; emacs-eclim
(load-file "~/.emacs.d/config/emacs-eclim-conf.el")

;; c-mode-common
(load-file "~/.emacs.d/config/c-mode-common-conf.el")

;; functions
;; kill
(load-file "~/.emacs.d/functions/kill.el")

;; write to file and keep buffer
(load-file "~/.emacs.d/functions/write-file-and-keep-buffer.el")




;; add license text as file heading
(defun add-license-heading (license_dir license_type)
  "Adds license in front of file"
  (interactive
   (list (read-directory-name "Directory in which to look for license file: " (get_default_license_dir) (get_default_license_dir))
         (read-string "License to be used: " (get_default_license_type))
         ))
  (message "%s %s" license_dir license_type)
  (if (file-exists-p license_dir)
      ; (let filepath (concat license_dir "/" license_type)
      (if (file-exists-p (concat license_dir "/" license_type))
          (progn
            (beginning-of-buffer)
            (insert-file (concat license_dir "/" license_type))
            (pop-global-mark)
            (message "Added license %s at the beginning of the buffer." (concat license_dir "/" license_type)))
        (message "File %s does not exist!" (concat license_dir "/" license_type)))
    (message "Directory %s does not exist!" license_dir))
  )


(defun get_default_license_dir ()
  (interactive)
  (when (not (boundp 'default_license_dir))
    (setq default_license_dir "~/.emacs.d/license"))
  (setq default_license_dir default_license_dir))


(defun get_default_license_type ()
  (interactive)
  (when (not (boundp 'default_license_type))
    (setq default_license_type "GPL"))
  (setq default_license_type default_license_type))

(defun set_theme_graphic_dependent()
  (when CURRENT_THEME
    (disable-theme CURRENT_THEME))
  (if (display-graphic-p)
      (progn
        (load-theme WINDOW_THEME t)
        (setq CURRENT_THEME WINDOW_THEME))
    (progn
      (load-theme TERMINAL_THEME t)
      (setq CURRENT_THEME TERMINAL_THEME))))

(defun set_theme_after_frame_creation(new-frame)
  (select-frame new-frame)
  (set_theme_graphic_dependent))
















