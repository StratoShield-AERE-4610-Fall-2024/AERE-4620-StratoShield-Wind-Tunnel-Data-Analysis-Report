% Class Information
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{4620-report}[2025/01/29 AERE 4620 Report Template]

% Load Master Class
\LoadClass[12pt]{report}

% Required Packages
\RequirePackage{fix-cm} % Fixes font scaling
\usepackage{graphicx} % Required for including images
\usepackage{amsmath} % Mathematical expressions
\usepackage{amssymb} % Mathematical symbols
\usepackage{siunitx} % SI units and quantities
\usepackage[dvipsnames]{xcolor} % Using colors within the document
\usepackage{tocbibind} % Add list of figures and tables of contents
\usepackage{blindtext} % Generate dummy text
\usepackage[toc,page]{appendix} % Add Appendix
\usepackage{titling} % Titlepage and titleback customisation
\usepackage{datetime} % Current date for titlepage and titleback
\usepackage{tcolorbox} % Highlighted box
\usepackage{subcaption} % For side-by-side figures
\usepackage[inkscapelatex=false]{svg} % For SVG figures
\usepackage{xltabular} % For table columns that automatically wrap text and break pages
\usepackage{setspace}

% Colors
\colorlet{redreport}{red!50!black}
\definecolor{lightblack}{gray}{0.5}

% Margins
\usepackage[
	top=1in, % Top margin
	bottom=1in, % Bottom margin
	left=1in, % Left margin
	right=1in, % Right margin
]{geometry}

% Set line spacing
\onehalfspacing

% Fonts
\usepackage{lmodern}
\usepackage[utf8]{inputenc} % Required for international characters
\usepackage[T1]{fontenc} % Font encoding for international characters
\usepackage{newpxtext} % Alternative use of the PX fonts
\usepackage{newpxmath} % Alternative use of the PX fonts (Math)
\usepackage{microtype} % Slightly tweak font spacing for aesthetics
\linespread{1.2} % Increase line spacing slightly

% Glossary & Acronyms
\usepackage[toc,acronym]{glossaries} 
% https://www.dickimaw-books.com/gallery/glossaries-styles/#tree-style
% https://tex.stackexchange.com/questions/346681/space-between-acronym-entry-and-it-description
\setglossarystyle{long} % Glossary style
\setlength\LTleft{-6pt} % Left margin
\setlength\LTright{0pt} % Right margin
\setlength\glsdescwidth{0.94\hsize} % Glossary description width
\renewcommand{\glsnamefont}[1]{\textbf{#1}} % Notation in bold
\renewcommand{\glossaryentrynumbers}[1]{\textit{(p. \textcolor{redreport}{#1})}} % Page number customisation

% Adjust the height of the text area
\addtolength{\textheight}{-20pt}
\setlength{\headheight}{20pt}

% Header & Footer
\usepackage{fancyhdr} % Required for customizing headers and footers
\usepackage[bottom, hang]{footmisc} % Force footnotes to the bottom
\pagestyle{fancy} \fancyhf{} % Clear default style
\renewcommand{\headrulewidth}{.3pt}
\setlength{\footnotemargin}{6pt} % Footnote space
\fancyhead[R]{\small{\rightmark}\vspace{3pt}}
\fancyhead[L]{\small{\leftmark}\vspace{3pt}}
\fancyfoot[L]{\color{lightblack}\textit{Insert Report Name}}
\fancyfoot[R]{\thepage}

\fancypagestyle{plain}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[L]{\color{lightblack}\textit{Insert Report Name}}
    \fancyfoot[R]{\thepage}
}

% Bibliography
\usepackage[
	backend=biber, % Use the biber backend for compiling the bibliography
	citestyle=authoryear, % In-text citation style
	bibstyle=authoryear, % Bibliography style
	sorting=nyt, % Order references
    natbib=true, % Use natbib compatibility mode
    uniquelist=false % Only show one author, e.g. (Author et al., 2023)
]{biblatex}

\setlength\bibitemsep{1.5\itemsep} % Adjust the space between references
\setlength\bibhang{0pt} % Remove indentation
\renewcommand*{\bibfont}{\small} % Change references font size

% Highlight both Author and Year in the citations
\ExecuteBibliographyOptions{maxcitenames=1}
\DeclareFieldFormat{citehyperref}{\DeclareFieldAlias{bibhyperref}{noformat}\bibhyperref{#1}}
\DeclareFieldFormat{textcitehyperref}{\DeclareFieldAlias{bibhyperref}{noformat}\bibhyperref{#1\ifbool{cbx:parens}{\bibcloseparen\global\boolfalse{cbx:parens}}{}}}
\savebibmacro{cite}
\savebibmacro{textcite}
\renewbibmacro*{cite}{\printtext[citehyperref]{\restorebibmacro{cite}\usebibmacro{cite}}}
\renewbibmacro*{textcite}{\ifboolexpr{( not test {\iffieldundef{prenote}} and test {\ifnumequal{\value{citecount}}{1}} ) or ( not test {\iffieldundef{postnote}} and test {\ifnumequal{\value{citecount}}{\value{citetotal}}} )}{\DeclareFieldAlias{textcitehyperref}{noformat}}{}\printtext[textcitehyperref]{\restorebibmacro{textcite}\usebibmacro{textcite}}}

% Tables
\usepackage{tabularx} % Table length
\usepackage{booktabs} % Table style
\usepackage{multirow} % Multirow
\usepackage{longtable} % For long tables
\newcommand{\customtableformatting}{
    \renewcommand{\arraystretch}{1.1}\small
} % Increase space between rows and smaller font
\AtBeginEnvironment{tabular}{\customtableformatting} % Apply to tabular
\AtBeginEnvironment{tabularx}{\customtableformatting} % Apply to tabularx
\preto\longtable{\customtableformatting} % Apply to longtable

% Captions
\usepackage{caption} % Required for customizing captions
\captionsetup{skip=6pt} % Whitespace between figures/tables and the caption
\captionsetup{
    labelfont={bf,small},
    textfont={it,small}
} % Caption font style
\captionsetup[table]{skip=3pt} % Align left

% Lists
\usepackage{enumitem} % Required for list customization
\setlist{noitemsep} % Customize spacing around and inside lists

% Links
\usepackage[bookmarks]{hyperref} % Required for links
% Capitalise the first letter when \autoref
\renewcommand{\figureautorefname}{Figure}
\renewcommand{\tableautorefname}{Table}
\renewcommand{\partautorefname}{Part}
\renewcommand{\appendixautorefname}{Appendix}
\renewcommand{\chapterautorefname}{Chapter}
\renewcommand{\sectionautorefname}{Section}
\renewcommand{\subsectionautorefname}{Section}
\renewcommand{\subsubsectionautorefname}{Section}

% Custom color for citations and references
\hypersetup{
	colorlinks=true, % Whether to color the text of links
	urlcolor=black, % Color for \url and \href links
	linkcolor=redreport, % Color for \nameref links
	citecolor=redreport, % Color of reference citations
}

% Titlepage and titleback variables
\NewDocumentCommand{\firstauthor}{m}{\newcommand{\firstauthorname}{#1}}
\NewDocumentCommand{\secondauthor}{m}{\newcommand{\secondauthorname}{#1}}
\NewDocumentCommand{\thirdauthor}{m}{\newcommand{\thirdauthorname}{#1}}
\NewDocumentCommand{\fourthauthor}{m}{\newcommand{\fourthauthorname}{#1}}
\NewDocumentCommand{\fifthauthor}{m}{\newcommand{\fifthauthorname}{#1}}
\NewDocumentCommand{\sixthauthor}{m}{\newcommand{\sixthauthorname}{#1}}
\NewDocumentCommand{\seventhauthor}{m}{\newcommand{\seventhauthorname}{#1}}
\NewDocumentCommand{\supervisor}{m}{\newcommand{\supname}{#1}}
\NewDocumentCommand{\supervisormail}{m}{\newcommand{\supmail}{#1}}
\NewDocumentCommand{\subtitle}{m}{\newcommand{\subname}{#1}}
\NewDocumentCommand{\university}{m}{\newcommand{\univname}{#1}}
\NewDocumentCommand{\school}{m}{\newcommand{\schoolname}{#1}}
\NewDocumentCommand{\degree}{m}{\newcommand{\degname}{#1}}
\NewDocumentCommand{\course}{m}{\newcommand{\coursename}{#1}}

% Chapters & Sections
\usepackage{titlesec}
\titleformat{\chapter}[block]
{\flushleft\normalsize\huge\color{black}}
{\huge\thechapter} % Formats the chapter number
{0.5em} % Small spacing between number and title
{\huge\scshape\textls[50]} % Formats the title inline
\titlespacing{\chapter}{0pt}{0pt}{20pt}

% Abstract Keywords
\NewDocumentCommand{\keywordsen}{m}{
    \vspace{.4cm}\noindent\textbf{Keywords:} #1
}
\NewDocumentCommand{\keywordspt}{m}{
    \vspace{.4cm}\noindent\textbf{Palavras-Chave:} #1
}

% Blankpage with warning for left blank
\newcommand\blankpage{
    \clearpage
    \thispagestyle{empty}
    \addtocounter{page}{1}
    \vspace*{\fill}
    \begin{center}
        \textcolor{gray!50}{\textit{This page intentionally left blank.}}
    \end{center}
    \vspace*{\fill}
    \clearpage
}

% Todo notes
\newcommand{\todo}[1]{\textcolor{red}{TODO: #1}}

% Define a custom environment for the highlighted box
\newenvironment{importantbox}{
  \begin{tcolorbox}[colback=gray!20, colframe=gray!50, arc=5pt, boxrule=1pt, left=15pt, right=15pt, top=10pt, bottom=10pt]
  \small
}{
  \end{tcolorbox}
}

% Code highlighting and printing
\usepackage[newfloat]{minted}
\newenvironment{code}{\captionsetup{type=listing}}{}
\SetupFloatingEnvironment{listing}{name=Listing}
\captionsetup[listing]{skip=-7pt}

\newenvironment{longlisting}{
    \bigskip\medskip
    \captionsetup{type=listing}
}{
    \bigbreak
    \medskip
}

% Define a new minted style
\setminted{
  frame=lines,
  framesep=2mm,
  baselinestretch=1.2,
  fontsize=\footnotesize,
  linenos,
  tabsize=4,
  breaklines=true,
  breakanywhere=true
}

% Configure siunitx
\sisetup{per-mode=fraction}

% Configure step autoref
\renewcommand{\itemautorefname}{Step}
