
(use-package straigth
  :ensure t
  )

(straight-use-package
 '(unity :type git :host github :repo "elizagamedev/unity.el"))
(add-hook 'after-init-hook #'unity-mode)
(provide 'init-straigth)
