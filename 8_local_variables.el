(setq load-path
      (cons "~/.emacs.d/timestamp/"
            load-path))

(require 'timestamp)

(insert-writestamp)

(update-writestamps)

;; Local Variables:
;; eval: (add-hook 'write-file-functions 'update-writestamps)
;; writestamp-prefix: "Written:"
;; writestamp-suffix: "."
;; writestamp-format: "%D"
;; End:
