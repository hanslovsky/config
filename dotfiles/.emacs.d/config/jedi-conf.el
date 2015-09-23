(install_if_missing 'jedi)
(install_if_missing 'company-jedi)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

