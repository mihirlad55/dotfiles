%% Identification %%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}[2019/09/05 Assignment Class]


\LoadClass{article}
\RequirePackage[letterpaper, portrait, margin=1in]{geometry}
\RequirePackage{enumitem}
\RequirePackage{lmodern}
\RequirePackage{setspace}

\usepackage[english]{babel}
\usepackage[autostyle=true, english=american]{csquotes}
\MakeOuterQuote{"}



%% Document Options %%
%% 'sans' option
\DeclareOption{sans}{
  \renewcommand{\familydefault}{\sfdefault}
}

%% 'roman' option
\DeclareOption{roman}{
  \renewcommand{\familydefault}{\rmdefault}
}


\newcommand{\defaultspace}

%% 'doublespace' option
\DeclareOption{doublespace}{
    \renewcommand{\defaultspace}{\doublespacing}
}

%% 'singlespace' option
\DeclareOption{singlespace}{
    \renewcommand{\defaultspace}{\singlespacing}
}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{roman, singlespace}
\ProcessOptions\relax



%% Define course, teacher, and subtitle command %%
\newcommand{\@course}{}
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}

\newcommand{\@teacher}{}
\newcommand{\teacher}[1]{\renewcommand{\@teacher}{#1}}

\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}

% Define title details 
\newcommand{\authorline}{\textbf{Submitted By:} \@author}
\newcommand{\teacherline}{\textbf{Submitted To:} \@teacher}
\newcommand{\dateline}{\textbf{Submitted On:} \@date}
\newcommand{\courseline}{\textbf{Course Code:} \@course}


%% Title page %%
\renewcommand{\maketitle}{
        \clearpage
        \begin{titlepage}
            \begin{singlespace}
                \begin{center}
                    \fontsize{36}{43.2}\selectfont
                    \vspace*{\fill}
                    \@title
                    
                    \fontsize{24}{28.8}\selectfont
                    \@subtitle
                    \vfill
                    \fontsize{12}{14.4}\selectfont
                    \teacherline

                    \authorline

                    \dateline

                    \courseline
                \end{center}
            \end{singlespace}
        \thispagestyle{empty}
        \end{titlepage}
        \newpage
}

\renewcommand{\section}{%
    \@startsection%
    {section}{1}{0pt}{-1.5ex plus -1ex minus -.2ex}% 
    {1ex plus .2ex}{\normalsize\textbf}%
}

%% Bold enumerate with first paragraph and label bolded %%
\newenvironment{benumerate}{%
    \enumerate[label=\bfseries\arabic*., listparindent=\parindent]%
  \let\realItem\item%
  \def\item##1\par{\realItem\textbf{##1}\par}}%
  {\endenumerate}

%% Setup page %%
\renewcommand{\normalsize}{\fontsize{12}{14.4}\selectfont}
\setlength{\textwidth}{6.5in}
\setlength{\textheight}{9in}
\defaultspace
\hfuzz=1pt
