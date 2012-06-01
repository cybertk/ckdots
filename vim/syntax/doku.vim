" Vim syntax file
" Language:     DokuWiki
" Maintainer:   Shin Gyuha
" Created:		02-Jan-2007
" Last Change:  01-Feb-2007
" Revision:		0.001
" Bugs:         

if version <600
    syntax clear
elsif exists("b:current_syntax")
    finish
endif

"syn clear
"hi clear

" headings
"syn match       dokuHeader              /^\(=\{1,6}\).*\1$/
syn region		dokuHeader				start="^="			end="=.*$"
syn region		dokuHeader				start="^=="			end="==.*$"
syn region		dokuHeader				start="^==="		end="===.*$"
syn region		dokuHeader				start="^===="		end="====.*$"
syn region		dokuHeader				start="^====="		end="=====.*$"
syn region		dokuHeader				start="^======"		end="======.*$"

" inline markup
syn match       dokuItalic              /\(\/\{2}\)[^\/]\+\1/
syn match       dokuBold                /\(*\{2}\)[^*]\+\1/
syn match       dokuUnderline           /\(_\{2}\)[^_]\+\1/
syn match       dokuMonoSpace           /\('\{2}\)[^']\+\1/
syn match		dokuFootNote			/\((\{2}\)[^)]\+\1/
syn region      dokuSubscript           start=/<sub>/ end=/<\/sub>/
syn region      dokuSuperscript         start=/<sup/ end=/<\/sup>/
syn region      dokuDelMark				start=/<del/ end=/<\/del>/
syn match       dokuTypewriter          /\(`\).\{-}\1/
syn match       dokuMacro               /\[\{2}.\{-}\]\{2}/

" Smileys
syn keyword		dokuSmileys		LOL FIXME DELETEME
syn match		dokuSmileys     /8-)/		
syn match		dokuSmileys     /8-O/		
syn match		dokuSmileys     /:-(/
syn match		dokuSmileys     /:-)/
syn match		dokuSmileys     /=)/
syn match		dokuSmileys     /:-\//
syn match		dokuSmileys     /:-\\/
syn match		dokuSmileys     /:-?/
syn match		dokuSmileys     /:-D/
syn match		dokuSmileys     /:-P/
syn match		dokuSmileys     /:-O/
syn match		dokuSmileys     /:-X/
syn match		dokuSmileys     /:-|/
syn match		dokuSmileys     /;-)/
syn match		dokuSmileys     /^_^/
syn match		dokuSmileys     /:?:/
syn match		dokuSmileys     /:!:/

" Links
syn match       dokuWikiWord            /\(\w\+:\)\?\u[a-z0-9]\+\u[a-z0-9]\+\(\u[a-z0-9]\+\)*/
syn match       dokuBracketLink         /\[[^[\]]\+\]/
syn match       dokuFileLink		    /\({\{2}\)[^}]\+\}\}/
syn match       dokuSubLink             /\(\w\+\|\.\.\)\?\// nextgroup=dokuWikiWord
syn match       dokuNormalURL           /\w\+:\/\/\S\+/
syn match       dokuEmail               /\S\+@\S\+/

" lists
syn match       dokuBulletList          /^\(\s\+\)\zs\*\ze\s/
syn match       dokuNumberedList        /^\(\s\+\)\zs\-\ze\s/

" rules
syn match       dokuRule                /^-\{4,}/

" Quoting
syn match		dokuQuoting				/\(^\|^\s\+\)>\+.*/

" Tables syn match		dokuTableHeader			/\(^\|^\s\+\)|.*\(\^|\|\)$/ syn match		dokuTableBody			/\(^\|^\s\+\)\^.*\(\^|\|\)$/

" comments/pragmas
syn region 		dokuComment				matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cCommentString,cCharacter,cNumbersCom,cSpaceError,@Spell extend

syn match		dokuLineBreak			/\\\\/

" Codeblocks
syn region      dokuPreformatted        start=/<code/ end=/<\/code>/
syn match		dokuPreformatted2		/^\s\s\(\s\+\).*/
syn match		dokuPreformatted3		/^\s\s[^-\*\|\^\< ].*/
syn match		dokuPreformatted4		/^\t[^-\*\|\^\< ].*/
syn region      dokuFile				start=/<file/ end=/<\/file>/
syn region      dokuNoWiki				start=/<nowiki/ end=/<\/nowiki>/
syn region      dokuHtml				start=/<html/ end=/<\/html>/
syn region      dokuPhp					start=/<php/ end=/<\/php>/
syn region      dokuNote				start=/<note/ end=/<\/note>/

" Plug in
syn match		dokuPlugin				/^\~\~.*\~\~$/

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_acedb_syn_inits")
    if version < 508
        let did_acedb_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink      dokuHeader              Function

    HiLink      dokuItalic              Identifier
    HiLink      dokuBold                Identifier
    HiLink      dokuUnderline           Identifier
    HiLink      dokuMonoSpace           Identifier
    HiLink      dokuFootNote	        Identifier
    HiLink      dokuSubscript           Identifier
    HiLink      dokuSuperscript         Identifier
    HiLink      dokuDelMark		        Identifier
    HiLink      dokuTypewriter          Identifier
	HiLink		dokuLineBreak			Identifier
    HiLink      dokuMacro               Define

	HiLink		dokuSmileys				Define

    HiLink      dokuWikiWord            Statement
    HiLink      dokuBracketLink         Statement
    HiLink      dokuFileLink			Statement
    HiLink      dokuNormalURL           Statement
    HiLink      dokuSubLink             Statement
    HiLink      dokuInterLink           Statement
    HiLink      dokuEmail               Statement

    HiLink      dokuBulletList          Type
    HiLink      dokuNumberedList        Type

    HiLink      dokuRule                Special

    HiLink      dokuComment             Comment

	HiLink		dokuTableHeader			Special
	HiLink		dokuTableBody			String

	HiLink		dokuQuoting				String

    HiLink      dokuPreformatted        String
	HiLink		dokuPreformatted2		String
	HiLink		dokuPreformatted3		String
	HiLink		dokuPreformatted4		String
    HiLink      dokuFile		        String

    HiLink      dokuNoWiki		        String
    HiLink      dokuHtml		        String
    HiLink      dokuPhp			        String
    HiLink      dokuNote		        String

	HiLink		dokuPlugin				Function

  delcommand HiLink
endif

let b:current_syntax = "doku"
