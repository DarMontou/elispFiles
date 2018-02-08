(setq load-path
      (cons "~/.emacs.d/timestamp/"
            load-path))

(eval-after-load
    "timestamp"
  '(insert-writestamp))

(load "timestamp")
