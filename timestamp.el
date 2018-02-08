(defvar insert-time-format "%X"
  "*Format for \\[insert-time] (c.f. 'format-time-string').")

(defvar insert-date-format "%x"
  "*Format for \\[insert-date] (c.f. 'format-time-string').")

(defvar insert-date-and-time-format "%c"
  "*Format for date and time \\[insert-date-and-time]")

(defun insert-time ()
  "Insert the current time according to insert-time-format."
  (interactive "*")
  (insert (format-time-string insert-time-format
                              (current-time))))

(defun insert-date ()
  "Insert the current date according to insert-date-format."
  (interactive "*")
  (insert (format-time-string insert-date-format
                              (current-time))))

(defvar writestamp-format "%C"
  "*Format for writestamps (c.f. 'format-time-string').")

(defvar writestamp-prefix "WRITESTAMP(("
  "*Unique string identifying start of writestamp.")

(defvar writestamp-suffix "))"
  "*String that terminates a writestamp.")

(defvar last-change-time nil
  "Time of last buffer modification.")

(make-variable-buffer-local 'last-change-time)

(defun insert-date-and-time ()
  "Insert the current date and time"
  (interactive "*")
  (insert (format-time-string insert-date-and-time-format
                              (current-time))))

(defun insert-writestamp ()
  "Insert WRITESTAMP((<local time and date>))."
  (interactive "*")
  (progn
    (insert writestamp-prefix)
    (insert-date-and-time)
    (insert writestamp-suffix)))

(defun remember-change-time (&rest unused)
  "Store the current time in 'last-change-time'."
  (setq last-change-time (current-time)))

(defvar modifystamp-format "%C"
  "*Format for modifystamps (c.f. 'format-time-string').")

(defvar modifystamp-prefix "MODIFYSTAMP(("
  "*String identifying start of modifystamp.")

(defvar modifystamp-suffix "))"
  "*String that terminates a modifystamp.")

(defun update-writestamps ()
  "Find writestamps and replace them with the current time."
   (save-excursion
     (save-restriction
       (save-match-data
         (widen)
         (goto-char (point-min))
         (while (re-search-forward (concat
                                    "^"
                                    (regexp-quote
                                     writestamp-prefix)
                                    "\\(.*?\\)"
                                    (regexp-quote
                                     writestamp-suffix)
                                    "$")
                                   nil t)
           (replace-match (format-time-string
                           insert-date-and-time-format
                           (current-time))
                          t t nil 1)))))
   nil)

(provide 'timestamp)
