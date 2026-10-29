% Class Identifier and Version
\ProvidesClass{kyvernitis-resume}[2023/06/06 Kyvernitis class (adapted: A4, 10pt, compact header, extra blocks)]
\NeedsTeXFormat{LaTeX2e}

% Set font size and paper type  (adapted: A4)
\LoadClass[10pt,a4paper]{article}

% ADDED: body text size. 10pt with slightly looser leading. (10.5pt:
% change the two numbers below, e.g. {10.5pt}{13pt} and {9.5pt}{11.5pt}; it may
% push the CV onto a third page, so check the compile.)
\renewcommand\normalsize{\@setfontsize\normalsize{10pt}{12.5pt}}
\renewcommand\small{\@setfontsize\small{9pt}{11pt}}
\renewcommand\large{\@setfontsize\large{11.5pt}{13.5pt}}
\normalsize

% Enable custom and named colors
\RequirePackage[usenames,dvipsnames]{color}

% Remove paragraph indentation
\RequirePackage[parfill]{parskip}

% Set margin width  (adapted: 1cm top/bottom)
\RequirePackage[hmargin=1.25cm,vmargin=1cm]{geometry}

% Use cool fonts
\RequirePackage{fontspec}

% Using IBM Plex Sans
\RequirePackage[sfdefault,light]{plex-sans}

% Use hyperref
\RequirePackage[xetex]{hyperref}

% Use extended columns definitions
\RequirePackage{array}

% Make custom tables
\RequirePackage{tabularx}

% Use FontAwesome icons
\RequirePackage{fontawesome5}

% Adjust page width in the middle of the page
\RequirePackage{changepage}

% Adjust bullet size
\RequirePackage{scalerel}

% Remove page numbers
\pagestyle{empty}

% Define navy-blue color for later use. Color code is taken from Canva
\definecolor{navyblue}{RGB}{0, 83, 137}
% (adapted: links use the navy accent instead of a bright blue)
\definecolor{links}{RGB}{0, 83, 137}

% Define new resizable bullet with default 0.7 size for later use
% Taken from https://tex.stackexchange.com/questions/534192/medium-sized-circle-as-a-bullet
\newcommand{\vbullet}[1][.7]{\mathbin{\ThisStyle{\vcenter{\hbox{%
  \scalebox{#1}{$\SavedStyle\bullet$}}}}}%
}

% Setup Hyperlink style
\hypersetup{
    colorlinks=true,
    urlcolor=links
}

% Define some social accounts and contact information formats
\newcommand{\linkedin}[1]{
    \href{https://linkedin.com/in/#1}{\textcolor{black}
    {\faLinkedinIn}\hspace{0.5em}#1}
}
\newcommand{\email}[1]{
    \href{mailto:#1}{\textcolor{black}
    {\faEnvelope[regular]}\hspace{0.5em}#1}
}
\newcommand{\github}[1]{
    \href{https://github.com/#1}{\textcolor{black}
    {\faGithub}\hspace{0.5em}#1}
}
\newcommand{\twitter}[1]{
    \href{https://twitter.com/#1}{\textcolor{black}
    {\faTwitter}\hspace{0.5em}#1}
}
\newcommand{\facebook}[1]{
    \href{https://www.facebook.com/#1}{\textcolor{black}
    {\faFacebookF}\hspace{0.5em}#1}
}
\newcommand{\website}[1]{
    \href{https://#1}{\textcolor{black}
    {\faGlobeAmericas}\hspace{0.5em}#1}
}
\newcommand{\phone}[1]{
    \textcolor{black}{\faPhone*}\hspace{0.5em}#1
}
\newcommand{\nationality}[1]{
    \textcolor{black}{\faFlagUsa}\hspace{0.5em}#1
}
\newcommand{\address}[1]{
    \textcolor{black}{\faMapMarker*}\hspace{0.5em}#1
}

% Define commands for fullname and job title
\def \fullname#1{\def\@name{#1}}
\def \@name {}
\def \jobtitle#1{\def\@title{#1}}
\def \@title {}

% Convenience commands
\newcommand{\italicitem}[1]{\item{\textit{#1}}}
\newcommand{\bolditem}[1]{\item{\textbf{#1}}}
\newcommand{\entry}[2]{#1 & #2 \tabularnewline}

% ADDED: list line with a bold label, no hyphenation, ragged right
% (used for Thesis / Advisor / Supervisor lines). #1: label, #2: text
\newcommand{\labelitem}[2]{%
    \item{\raggedright\hyphenpenalty=10000 \exhyphenpenalty=10000
          \textbf{#1:} #2\par}%
}

% Define the resume header
% (adapted: name at 25pt so a long name fits; contacts in a balanced block,
%  the third row is only printed when it is not empty)
\newcommand{\resumeheader}[6]{
    % \phantomsection
    % \addcontentsline{toc}{chapter}{\@name}
    \begin{tabularx}{\textwidth}{Xr}{
        \begin{tabular}[c]{l}
            \fontsize{25}{32}\selectfont{\color{navyblue}{\textbf{\@name}}}
            \ifx\empty\@title\empty\else
                \\ \textit{\small\@title}
            \fi
       \end{tabular}
    } & {
        \renewcommand{\arraystretch}{1.3}%
        \begin{tabular}[c]{l@{\hspace{1.2em}}l}
            \entry{\normalsize#4}{\normalsize#1}
            \entry{\normalsize#5}{\normalsize#2}
            \if\relax\detokenize{#3#6}\relax\else
                \entry{\normalsize#6}{\normalsize#3}
            \fi
        \end{tabular}
    }
    \end{tabularx}
}

% Renew section command for resume section
% (adapted: larger heading, more space above it, heading kept with its content)
\renewenvironment{section}[1]{
    \phantomsection
    \addcontentsline{toc}{section}{#1}
    \par\addvspace{0.8em}
    {\color{navyblue}\large\textbf{\textit{#1}}}\par
    \nopagebreak\vspace{0.35em}\nopagebreak
    {\color{navyblue}\hrule}
    \nopagebreak
    \@beginparpenalty=\@M
    \begin{list}{}{
        \setlength{\leftmargin}{1.5em}
    }
    \item[]
}{
    \end{list}
}

% Renew subsection command for resume subsections
% All arguments are compulsory
% #1: Name, #2: Description, #3: Time Period, #4: Location
\renewenvironment{subsection}[4]{
    \phantomsection
    \addcontentsline{toc}{subsection}{#1}
    \textbf{#1} \hfill \textit{#3} \newline
    \textit{#2} \hfill \textit{#4}\unskip\par
    \nopagebreak\smallskip\nopagebreak
    \@beginparpenalty=\@M
    \begin{list}{$\vbullet$}{
        \leftmargin=2em
    }
    \itemsep -0.5em \vspace{-0.5em}
}{
    \end{list}
    \vspace{0.45em}
}


% Define command for resume subsections with no bullets
% All arguments are compulsory
% #1: Name, #2: Description, #3: Time Period, #4: Location
\newenvironment{subsectionnobullet}[4]{
    \phantomsection
    \addcontentsline{toc}{subsection}{#1}
    \textbf{#1} \hfill \textit{#3} \newline
    \textit{#2} \hfill \textit{#4}\unskip\par
    \nopagebreak\smallskip\nopagebreak
    \@beginparpenalty=\@M
    \begin{list}{}{
        \leftmargin=0em \itemindent=0em \labelwidth=0em \labelsep=0em
    }
    \itemsep -0.7em \vspace{-0.7em}
}{
    \end{list}
}

% ADDED: header only, no list (for entries that have no extra lines)
% #1: Name, #2: Description, #3: Time Period, #4: Location
\newcommand{\subsectionheader}[4]{%
    \phantomsection
    \addcontentsline{toc}{subsection}{#1}%
    \textbf{#1} \hfill \textit{#3} \newline
    \textit{#2} \hfill \textit{#4}\unskip\par
    \smallskip
}

% ADDED: bulleted block for projects. The title may wrap onto two lines
% (it sits in a table column), the date stays flush right, and the
% italic sub-line is optional (leave #3 empty to skip it).
% #1: Title, #2: Time Period, #3: Sub-line (optional)
\newenvironment{project}[3]{
    \phantomsection
    \addcontentsline{toc}{subsection}{#1}
    \begin{tabularx}{\linewidth}{@{}>{\raggedright\arraybackslash\hyphenpenalty=10000 \exhyphenpenalty=10000}X r@{}}
        \textbf{#1} & \textit{#2}
    \end{tabularx}\par
    \if\relax\detokenize{#3}\relax\else
        \nopagebreak\textit{#3}\par
    \fi
    \nopagebreak\smallskip\nopagebreak
    \@beginparpenalty=\@M
    \begin{list}{$\vbullet$}{
        \leftmargin=2em
    }
    \itemsep -0.5em \vspace{-0.5em}
}{
    \end{list}
    \vspace{0.45em}
}

% Define new sectiontable command, which makes a section with a table
% All arguments are compulsory
% #1: Name of the section, #2: Body of the section
\newcommand{\sectiontable}[2]{
    \begin{section}{#1}
        \begin{adjustwidth}{0.0in}{0.1in}
            \begin{tabularx}{\linewidth}{@{} >{\bfseries}l @{\hspace{5ex}} X @{}}
                #2
            \end{tabularx}
        \end{adjustwidth}
    \end{section}
}
