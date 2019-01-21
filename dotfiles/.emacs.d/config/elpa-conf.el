;; set repositories for elpa
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(defvar package-archive-priorities
      '(("melpa-stable" . 40)
        ("melpa" . 35)
        ("marmalade" . 20)
        ("gnu" . 10)))

(defun install_if_missing (package_name)
  (when (not (package-installed-p package_name))
    (update_packages_if_neccessary)
    (message "Installing package %s..." package_name)
    (package-install package_name)
    (message "Installing package %s... done" package_name)
    )
  )

(defun update_packages_if_neccessary ()
  (when (not (boundp 'elpa_update_check))
    (setq elpa_update_check t)
    (package-refresh-contents)
    )
  )
