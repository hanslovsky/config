;; set repositories for elpa
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))

(defvar package-archive-priorities
      '(("gnu" . 30)
        ("melpa-stable" . 20)
        ("melpa" . 10)))

(defun install_if_missing (package_name)
  (when (not (package-installed-p package_name))
    (message "Installing package %s..." package_name)
    (update_packages_if_necessary)
    (package-install package_name)
    (message "Installing package %s... done" package_name)))

(defun update_packages_if_necessary ()
  (when (not (boundp 'elpa_update_check))
    (defvar elpa_update_check t)
    (package-refresh-contents)))

