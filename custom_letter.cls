%
% custom_letter.cls -- A document class for writing letters with Tsinghua letterhead
% This class is based on "brownletter.cls" Copyright 2003, Nesime Tatbul (tatbul@cs.brown.edu)
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{custom_letter}

\RequirePackage{graphicx}
\RequirePackage{ifthen}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions
\LoadClass[letterpaper]{letter}

\newcommand{\subjectname}{Subject}
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{\subjectname: #1}}

\newboolean{logofound}
\IfFileExists{full_logo.pdf}
    {\setboolean{logofound}{true}}
    {\setboolean{logofound}{false}}

\setlength{\textwidth}{6.875in}
\setlength{\textheight}{7.0in}
\setlength{\topskip}{0.0in}
\setlength{\footskip}{1.0in}
\setlength{\oddsidemargin}{-0.25in}
\setlength{\evensidemargin}{-0.25in}
\setlength{\topmargin}{-0.875in}

\newsavebox{\departmenthead}

\sbox{\departmenthead}{%
    \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{0.0in}}|@{\extracolsep{0.125in}}l@{}}
        \parbox{4.0in}{\raggedright
            \ifthenelse{\boolean{logofound}}
                {\vspace{0.3in}\includegraphics[height=1.1in]{full_logo.pdf}}
                {\parbox[t][2.0in][t]{3.0in}{\hfill} 
                \ClassWarning{custom_letter}{full_logo.pdf COULD NOT BE FOUND!}}
        } &
        \parbox[t][1in][t]{2in}{{~}\\}
    \end{tabular*}%
}

\renewcommand{\ps@firstpage}{%
    \setlength{\headheight}{1.375in}
    \setlength{\headsep}{1.0in}
    \renewcommand{\@oddhead}{\usebox{\departmenthead}}
    \renewcommand{\@oddfoot}{}
    \renewcommand{\@evenhead}{}
    \renewcommand{\@evenfoot}{}
}

\renewcommand{\ps@empty}{%
    \setlength{\headheight}{1.375in}
    \setlength{\headsep}{0.5in}
    \renewcommand{\@oddhead}{}
    \renewcommand{\@oddfoot}{}
    \renewcommand{\@evenhead}{}
    \renewcommand{\@evenfoot}{}
}

\pagestyle{empty}

\renewcommand{\opening}[1]{\thispagestyle{firstpage}%
    \ifx\@empty\fromaddress
        %{\raggedleft\@date\par}%
    \else
        {\raggedleft
            \begin{tabular}{l@{}}\ignorespaces
            \fromaddress \\ *[1\parskip]%
            %\@date
            \end{tabular}\par
        }%
     \fi
     \vspace{-6\parskip}
     \@date \vspace{2\parskip}\\
     {\raggedright \toname \\ \toaddress \par}%
     \vspace{1\parskip}%
     \ifthenelse{\equal{\@subject}{}}{}{\@subject\par}
     \vspace{1\parskip}%
     #1\par\nobreak
}

\RequirePackage{varwidth}

\renewcommand{\closing}[1]{\par\nobreak\vspace{\parskip}%
    \stopbreaks
    \noindent
    \hfill\begin{varwidth}{\textwidth}\raggedright
    \ignorespaces #1\\[4\medskipamount]%
    \ifx\@empty\fromsig
        \fromname
    \else \fromsig 
    \fi\strut\end{varwidth}%
    \par
}
