%% Requires Calibri and Roboto fonts
%% Identification %%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2019/12/25 Resume]

\LoadClass{article}
\RequirePackage[letterpaper, portrait, top=3.94cm, left=1in, right=1in]{geometry}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr,xcolor}
\RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}
\RequirePackage[utf8]{inputenc}
\RequirePackage{luatex85}
\RequirePackage[letterspace=200]{microtype}
\RequirePackage{hyperref}
\RequirePackage{tikz}
\RequirePackage{titlesec}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{roman, singlespace}
\ProcessOptions\relax


%% Define resume details %%
\newcommand{\@firstname}{}
\newcommand{\firstname}[1]{\renewcommand{\@firstname}{#1}}

\newcommand{\@lastname}{}
\newcommand{\lastname}[1]{\renewcommand{\@lastname}{#1}}

\newcommand{\@major}{}
\newcommand{\major}[1]{\renewcommand{\@major}{#1}}

\newcommand{\@city}{}
\newcommand{\city}[1]{\renewcommand{\@city}{#1}}

\newcommand{\@state}{}
\newcommand{\state}[1]{\renewcommand{\@state}{#1}}

\newcommand{\@phonenumber}{}
\newcommand{\phonenumber}[1]{\renewcommand{\@phonenumber}{#1}}

\newcommand{\@email}{}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}

\newcommand{\@linkedin}{}
\newcommand{\linkedin}[1]{\renewcommand{\@linkedin}{#1}}

\newcommand{\@website}{}
\newcommand{\website}[1]{\renewcommand{\@website}{#1}}

\newcommand{\@github}{}
\newcommand{\github}[1]{\renewcommand{\@github}{#1}}



\hypersetup{colorlinks=true,linkcolor=blue,urlcolor=hlink,pdfborderstyle={/S/U/W 1},pdfborder=0 0 1}

\definecolor{headercolor}{HTML}{FBE5D6}
\definecolor{hlink}{HTML}{0563C1}
\definecolor{sectioncolor}{HTML}{ED7D31}

\topmargin=-2.75cm
\headheight=4.1cm

\pagestyle{fancy}
\fancyhf{}% Remove header/footer

% Remove underline from header
\renewcommand{\headrulewidth}{0pt}

% Expand header through horizontal margins
\fancyheadoffset[lh,rh]{1in}

\lhead{\colorbox{headercolor}{%
    \makebox[\dimexpr\linewidth-2\fboxsep][l]{%
      \color{black}
      \hspace*{1in}
      \begin{minipage}[t][3.94cm][c]{2.5in} {
          \vspace{0.5in}
          \fontsize{40}{48}\setmainfont{Calibri}\selectfont
          \textbf{\uppercase\expandafter{\@firstname}} %
          \setmainfont{Calibri-Light}%
          \uppercase\expandafter{\@lastname}
        }
        \fontsize{10}{12}\setmainfont{Roboto}\selectfont
        \center{\textls{\uppercase\expandafter{\@major}}}
      \end{minipage}%
      \hspace{\dimexpr\textwidth-2in-2.5in-1in-0.1in}
      \begin{minipage}[t][3.94cm][c]{3in}
        \fontsize{10}{12.2}\setmainfont{Calibri}\selectfont
        \vspace{0.4in}
        \begin{flushright}
          \@city, \@state \\
          \@phonenumber \\
        {\color{hlink}\underline{\smash{\href{mailto:\@email}{\@email}}}} \\
        {\color{hlink}\underline{\smash{\href{https://linkedin.com/in/\@linkedin}{linkedin.com/in/\@linkedin}}}} \\
        {\color{hlink}}\underline{\smash{\href{https://github.com/\@github}{github.com/\@github}}}
        \end{flushright}
      \end{minipage}
    }%
  }
}


% Section title format
\newcommand\titlebar{%
 \tikz[overlay]{ \draw [sectioncolor,line width=.25ex] (-2ex,-1.0ex) -- (-2ex,2.5ex); }%
}
\titleformat{\section}{\setmainfont{Roboto}\large\color{black}}{\titlebar}{0ex}{\MakeUppercase}


%{Main Item}{Sub item}{Starting date}{Ending date}
\newcommand{\jitem}[4]{%
  \textbf{#1}
  \textbullet{}
  \textbf{#2}
  \if\relax\detokenize{#3}\relax
  \else
    \if\relax\detokenize{#4}\relax
    \else
      \hfill
      \textbf{#3} -- \textbf{#4}
    \fi
  \fi
}



%% Setup page %%
\renewcommand{\normalsize}{\fontsize{12}{14.4}\selectfont}
\setlength{\textwidth}{6.5in}
\setlength{\textheight}{9in}
\setmainfont{Roboto}
\setlist[itemize,1]{leftmargin=*,labelsep=6.3mm,labelindent=6mm}
