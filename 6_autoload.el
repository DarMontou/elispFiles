(setq load-path
      (cons "~/.emacs.d/timestamp/"
            load-path))

(autoload 'insert-writestamp "timestamp")
(autoload 'update-writestamps "timestamp")

(insert-writestamp)


(insert-writestamp)


(update-writestamps)
