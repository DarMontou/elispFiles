(setq load-path
      (cons "~/.emacs.d/timestamp/"
            load-path))

(require 'timestamp)

(insert-writestamp)
