(setq load-path
      (cons "~/.emacs.d/timestamp/"
            load-path))

(load "timestamp")

(insert-writestamp)
