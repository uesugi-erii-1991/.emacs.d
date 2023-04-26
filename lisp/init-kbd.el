;;快捷键

(when *is-mac* (setq mac-command-modifier 'meta)
      (setq mac-option-modifier 'none))


(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-kbd)
