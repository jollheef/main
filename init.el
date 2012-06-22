;; Package list:
;; community/emacs-w3m-cvs, aspell, aspell-ru, aspell-en, lush
;; Elpa list:
;; crontab-mode-1.2 dired+-21.2 haskell-mode-2.8.0 paredit-22
;; windresize-0.1
;; Lisp List:
;; auto-complete-1.3.1 color-theme.el linum-relative.el nyan-mode.el
;; slime workspaces.el zenburn.el

;;
;;
;; Common
;;
;;

(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
;; Load-path for lisp files
(let ((default-directory "~/.emacs.d/lisp/"))
  (setq load-path
	(append
         (let ((load-path (copy-sequence load-path))) ;; Shadow
           (append 
            (copy-sequence (normal-top-level-add-to-load-path '(".")))
            (normal-top-level-add-subdirs-to-load-path)))
         load-path)))

;;
;;
;; Key bindings
;;
;;

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "<f12>")
		(lambda () 
		  (interactive) 
		  (ispell-change-dictionary "ru" nil)))
(global-set-key (kbd "<f11>") 
		(lambda ()
		  (interactive)
		  (ispell-change-dictionary "en" nil)))
(global-set-key (kbd "<f9>") 'flyspell-mode)
(global-set-key [?\C-q] 'workspace-goto)

;;
;;
;; Appearance
;;
;;

;; Disable startup-message (show *scratch* buffer)
(setq inhibit-startup-message t)
;; Disable all bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; Set font
(set-default-font "Monospace-11")
;; Files for zenburn-theme : ~/.emacs.d/lisp/zenburn.el and
;; ~/.emacs.d/lisp/color-theme.el
(require 'zenburn)
(zenburn)
;; Show time
;(setq display-time-interval 1)		; in seconds, default value 60
(setq display-time-format "%H:%M")
(display-time-mode)
;; Show column (line,column)
(column-number-mode)
;; Nyan-mode
;; files: ~/.emacs.d/lisp/nyan-mode.el, ~/.emacs.d/lisp/nyan-img/*
(require 'nyan-mode)
(nyan-mode)

;;
;;
;; Goodies
;;
;;

;; DONE with date in todo-list
(setq org-log-done t) 
;; Dired+ use one buffer
(toggle-diredp-find-file-reuse-dir t)
;; y-or-n instead of yes-or-no in kill buffer
(defalias 'yes-or-no-p 'y-or-n-p)
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))
;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

;;
;;
;; Functions
;;
;;

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun fill-buffer ()
  (interactive)
  (fill-region (point-min) (point-max)))
(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
(defun insert-date ()
  "Insert a time-stamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))
(defun sudo-edit (&optional arg)
  (interactive "p")
  (if arg
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;;
;;
;; Plugins
;;
;;

;; Workspaces
;; files: ~/.emacs.d/lisp/workspaces.el
(load-library "workspaces.el")
;; Auto Complete Mode
;; files: ~/.emacs.d/lisp/auto-complete-1.3.1/*
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete-1.3.1/ac-dict")
(ac-config-default)
;; InteractivelyDoThings
(ido-mode)
(setq ido-enable-flex-matching t)
(recentf-mode)
;; Relative linum line-number mode
(require 'linum-relative)
;; Common Lisp developer environment
(setq inferior-lisp-program  "sbcl")
(add-to-list 'load-path "~/.emacsd/lisp/slime/")
(require 'slime)
(slime-setup)
(require 'w3m-load)
(setq w3m-use-cookies t)
;; For aspell, need aspell, aspell-ru, aspell-en
(setq-default ispell-program-name "aspell")
(setq ispell-list-command "list")
;; Lush
;(load "/usr/share/lush2/etc/lush.el")

;;
;;
;; Hooks
;;
;;

(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))
(add-hook 'text-mode-hook             (lambda () (auto-fill-mode +1)))
(add-hook 'text-mode-hook             (lambda () (ispell-minor-mode +1)))
(add-hook 'text-mode-hook             (lambda () (flyspell-mode +1)))
