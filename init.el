;; Package list:
;; community/emacs-w3m-cvs

;; Disable all bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Disable startup-message
(setq inhibit-startup-message t)


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

;; Set font
(set-default-font "Monospace-11")

;; Show time
					;(setq display-time-interval 1)		; in seconds, default value 60
(setq display-time-format "%H:%M")
(display-time-mode)
;;
;;
;; Key bindings
;;
;;

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;
;;
;; Color-theme
;;
;;

;; Files for zenburn-theme : ~/.emacs.d/lisp/zenburn.el and
;; ~/.emacs.d/lisp/color-theme.el
(require 'zenburn)
(zenburn)

;; Nyan-mode
;; files: ~/.emacs.d/lisp/nyan-mode.el, ~/.emacs.d/lisp/nyan-img/*
(require 'nyan-mode)
(nyan-mode)

(setq org-log-done t) ; включает указание даты при DONE в todo-листе

;; Workspaces
;; files: ~/.emacs.d/lisp/workspaces.el
(load-library "workspaces.el")
(global-set-key [?\C-q] 'workspace-goto)

;; Dired use one buffer
(toggle-diredp-find-file-reuse-dir t)

;; Auto Complete Mode
;; files: ~/.emacs.d/lisp/auto-complete-1.3.1/*
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete-1.3.1/ac-dict")
(ac-config-default)

;; InteractivelyDoThings
(ido-mode)
(setq ido-enable-flex-matching t)

(require 'linum-relative)

(setq inferior-lisp-program  "sbcl")
(add-to-list 'load-path "~/.emacsd/lisp/slime/")
(require 'slime)
(slime-setup)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

(column-number-mode)

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(recentf-mode)

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if arg
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun insert-date ()
  "Insert a time-stamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))

(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))

(require 'w3m-load)
(setq w3m-use-cookies t)

