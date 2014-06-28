;; might be better than minimap
;; https://github.com/zk-phi/sublimity
(require 'sublimity)
(require 'sublimity-scroll)
(require 'sublimity-map)

;; make sublimity available everywhere
(sublimity-global-mode)

;; update map on the following commands 
;; (setq sublimity-map-on-commands
;;       '(previous-line next-line backward-paragraph forward-paragraph
;;                       end-of-defun beginning-of-defun))

;; sublimity size
(setq sublimity-map-size 30)
(setq sublimity-map-fraction 0.3)

;; make scrolling smooth - does not feel that good
;; (setq sublimity-scroll-weight 5
;;      sublimity-scroll-drift-length 10)

;; no timer for sublimity
(sublimity-map-set-delay 2)
