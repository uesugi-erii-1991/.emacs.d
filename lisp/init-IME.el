(use-package pyim
  :ensure t
  :demand t
  :config
  (use-package pyim-basedict
    :ensure t
    :config (pyim-basedict-enable))
  (setq default-input-method "pyim")
  (setq pyim-default-scheme 'quanpin)
  (global-set-key (kbd "C-\\") 'toggle-input-method))





(provide 'init-IME)
