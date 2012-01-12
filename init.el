(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings starter-kit-js
                      php-mode
                      clojure-mode clojure-test-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(mouse-avoidance-mode 'jump)
(delete-selection-mode 1)


(set-default-font "-unknown-Ubuntu Mono-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1")
;;(set-default-font "-*-Courier New-normal-r-*-*-12-112-96-96-c-*-iso8859-1")

;;(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(global-set-key "\M-=" 'goto-line)

(set-frame-position (selected-frame) 0 0) 

(load-theme ' tango-dark)
(set-background-color "black")

(setq 
  ido-case-fold  t                 ; be case-insensitive
  ido-enable-last-directory-history t ; remember last used dirs
  ido-max-work-directory-list 30   ; should be enough
  ido-max-work-file-list      50   ; remember many
  ido-use-filename-at-point nil    ; don't use filename at point (annoying)
  ido-use-url-at-point nil         ; don't use url at point (annoying)
  ido-confirm-unique-completion t) ; wait for RET, even with unique completion

(setq column-number-mode 1)
(setq flymake-gui-warnings-enabled nil)

(defun rt-do-line-comments ()
(setq comment-start "// ")
(setq comment-end ""))
(add-hook 'c-mode-hook 'rt-do-line-comments)

(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
