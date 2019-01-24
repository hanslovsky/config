(use-package calfw
  :ensure t
  :defer 2
  :config (add-hook 'cfw:calendar-mode-hook (lambda () (auto-fill-mode -1)))
  :bind (("C-c C-c c" . cfw:open-calendar-buffer)))

(defvar my/calendars
  '(("Philipp Hanslovsky" . "https://calendar.google.com/calendar/ical/philipp.hanslovsky%40gmail.com/public/basic.ics")
   ("Home" . "https://calendar.google.com/calendar/ical/ppa48drl0205i14bj3ldiabef4%40group.calendar.google.com/public/basic.ics")
   ("DM" . "https://calendar.google.com/calendar/ical/9j7uqtjf4ibjosm15gv1fnhd0k%40group.calendar.google.com/public/basic.ics")))

(defun my/open-calendar ()
    (interactive)
  (cfw:open-ical-calendar (helm-comp-read "Open Calendar: " my/calendars :must-match t :fuzzy t)))

(use-package calfw-ical
  :ensure t
  :defer 2
  :after (calfw)
  :bind (("C-c C-c o" . my/open-calendar)))
