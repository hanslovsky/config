(install_if_missing 'projectile)
(install_if_missing 'helm-projectile)
(install_if_missing 'org-projectile)
(install_if_missing 'persp-projectile)

(projectile-global-mode)
(setq projectile-enable-caching t)
(helm-projectile-on)
