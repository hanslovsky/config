;; ===== Set the highlight cpurrent line minor mode =====
;; (message (getenv "PATH"))

;; ========== Color themes                     ==========
;;(require 'color-theme)
;;(color-theme-initialize)
;;(load-file "~/.emacs-themes/color-theme-sunburst.el")
;;(load-file "~/.emacs-themes/color-theme-tango.el")
;;(load-file "~/.emacs-themes/gentooish.el")
;;(add-to-list 'load-path "~/.emacs-themes")
;;(color-theme-tm)
;;(color-theme-tango)
;;(color-theme-gentooish)

;; (setq custom-theme-path "~/.emacs-themes/")
(add-to-list 'custom-theme-load-path "~/.emacs-themes")
;; do not load colortheme if started in terminal
;; (if window-system
;;    (load-theme 'tango t)
;;  (load-theme 'manoj-dark t))
;; (load-theme 'tango t)

(setq WINDOW_THEME 'tango-dark)
(setq TERMINAL_THEME 'tango)
(setq CURRENT_THEME nil)

;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode 0)


;; Specify default font
;; (set-default-font "Inconsolata 12")

;; open *.h in c++ mode instead of c mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; ========== Enable Line and Column Numbering ==========

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; No scroll bar
(scroll-bar-mode -1)

;; No menu bar
(menu-bar-mode -1)

;; No tool bar
(tool-bar-mode -1)

;; set default cursor
(set-default 'cursor-type '(hbar . 3))

;; enable left hand side line numbers
(global-linum-mode t)

;; write y instead of yes
(fset 'yes-or-no-p 'y-or-n-p) 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(background-color "#1c1c1c")
 '(background-mode dark)
 '(column-number-mode t)
 '(cursor-color "#808080")
 '(custom-enabled-themes nil)
;; '(custom-safe-themes (quote ("817ce7168851955b2d67a9dfb2f4bb283504e3be87b17932bd8a3ee4b43cfeb1" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "050beead9159996a613ba4bc734de8b13b882f1c6596d1dffa4f51d096662cf6" "4c9ba94db23a0a3dea88ee80f41d9478c151b07cb6640b33bfc38be7c2415cc4" "3ad55e40af9a652de541140ff50d043b7a8c8a3e73e2a649eb808ba077e75792" default)))
 '(fci-rule-color "#383838")
 '(foreground-color "#808080")
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(minimap-always-recenter t)
 '(minimap-dedicated-window t)
 '(preview-gs-options (quote ("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4")))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map (quote ((20 . "#BC8383") (40 . "#CC9393") (60 . "#DFAF8F") (80 . "#D0BF8F") (100 . "#E0CF9F") (120 . "#F0DFAF") (140 . "#5F7F5F") (160 . "#7F9F7F") (180 . "#8FB28F") (200 . "#9FC59F") (220 . "#AFD8AF") (240 . "#BFEBBF") (260 . "#93E0E3") (280 . "#6CA0A3") (300 . "#7CB8BB") (320 . "#8CD0D3") (340 . "#94BFF3") (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 83 :width normal))))
 '(minimap-font-face ((t (:height 50 :family "DejaVu Sans Mono"))) t))

;; ===== Matlab Mode =====
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
  'auto-mode-alist
  '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")

;; minor fold mode
;; (hs-minor-mode t)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; no tabs!
(setq-default indent-tabs-mode nil)

;; magit
;; (require 'magit)

;; blinking cursor
;; (load-file "~/.emacs.d/blink-cursor-colors.el")
(blink-cursor-mode 1)

;; auctex
(require 'tex-site)
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-parse-self t)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(setq LaTeX-indent-level 4)
(setq LaTeX-item-indent 2)
(setq TeX-brace-indent-level 4)


;; delete file and associated buffer
(defun delete-current-buffer-and-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))


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


(add-hook 'after-make-frame-functions 'set_theme_after_frame_creation)
(add-hook 'after-init-hook 'set_theme_graphic_dependent)

;; minimap toggle (taken from http://www.emacswiki.org/emacs/MiniMap)
(defun minimap-toggle-retain-size ()
  "Toggle minimap"
  (interactive)
  (if (or (not (boundp 'minimap-exists))
	  (not minimap-exists))
      (progn (minimap-create)
	     (setf minimap-exists t)
	     (set-frame-width (selected-frame) 100))
    (progn (minimap-kill)
	   (setf minimap-exists nil)
	   (set-frame-width (selected-frame) 80))))

(global-set-key (kbd "<f7>") 'minimap-toggle-retain-size)
  
    



;; settings for backup files (*~):
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )


;; cedet
;; (load-file "~/.emacs.d/cedet_config.el")

;; ede
;; (load-file "~/.emacs.d/ede_config.el")

;; cedet & ede (built-in)
(semantic-mode 1)
(global-ede-mode 1)

;; tramp
(require 'tramp)

;; autocomplete siwtch buffers on C-x b
;; http://stackoverflow.com/questions/7394289/how-can-i-more-easily-switch-between-buffers-in-emacs
(iswitchb-mode t)
(setq iswitchb-buffer-ignore '("^ " "*Completions*" "Shell Command Output*"
                               "*Messages*" "Async Shell Command"))
;; display time in tray
(display-time-mode 1)

;; remaining working time
;; (timeclock-mode-line-display)
;; (add-hook 'after-init-hook 'timeclock-in)
;; (add-hook 'kill-emacs-hook 'timeclock-out) not neccessary: timeclock asks on kill
(global-set-key (kbd "<f8>") 'timeclock-status-string)


;; set repositories for elpa
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))


;; google style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)


;; setup for sun set/rise theme changer
(setq calendar-location-name "Heidelberg, Germany")
(setq calendar-latitude 49.25)
(setq calendar-longitude 8.42)
(require 'theme-changer)
(change-theme 'gandalf 'zenburn)
;; good themes: gandalf, (n)zenburn, adawaita, tango(-dark), wombat, tsdh-light


;; cmake major mode
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))


;; calendar view framework (calfw + calfw-gcal for google)
(require 'calfw)
(require 'calfw-gcal)


;; google weather (as of 2012: API shut down, does not work anymore
;; (require 'google-weather)
;; (require 'org-google-weather)


;; org
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/.emacs.d/org/basics.org"))


;; weather-metno
(setq weather-metno-location-name "Heidelberg, Germany"
      weather-metno-location-latitude 49
      weather-metno-location-longitude 8)
(require 'org-weather-metno)


;; punishment for using arrow keys or other 1 char keys for scrolling:
(require 'annoying-arrows-mode)
(global-annoying-arrows-mode)
(setq visible-bell t) ;; no system beep but visible signal instead
(setq annoying-arrows-too-far-count 15) ;; set the number of 1 char moves before signal



;; jabber for chats such as facebook
(require 'jabber-autoloads)
(setq jabber-account-list '(("Philipp.Tavernello@chat.facebook.com")
                            ("Philipp.Hanslovsky@gmail.com"
                             (:network-server . talk.google.com)
                             (:port . 5223)
                             (:connection-type . ssl))))
(defun jabber ()
    (interactive)
    (jabber-connect)
    (switch-to-buffer "*-jabber-*"))
;; (setq jabber-username "hanslovsky")
;; (setq jabber-nickname "hanslovsky")

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





