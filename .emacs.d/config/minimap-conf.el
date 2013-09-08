;; always recenter minimap
(setq minimap-always-recenter t)

;; minimap should have its own window
(setq minimap-dedicated-window t)

;; toggle minimap activate/deactivate on f7
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
