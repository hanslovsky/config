(defun acquire_elpa_packages (package_list)
  (cl-loop for package_name in package_list do
           (ignore-errors (install_if_missing package_name))
           )
  )

(defun install_if_missing (package_name)
  (when (not (package-installed-p package_name))
    (message "Installing package %s..." package_name)
    (package-install package_name)
    (message "Installing package %s... done" package_name)
    )
  )
