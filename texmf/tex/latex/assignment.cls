%% Identification %%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}[2019/09/05 Assignment Class]


\LoadClass{article}
\RequirePackage{enumitem}
\RequirePackage{lmodern}
\RequirePackage[letterpaper, portrait, margin=1in]{geometry}

%% Document Options %%
%% 'sans' option
\DeclareOption{sans}{
  \renewcommand{\familydefault}{\sfdefault}
}

%% 'roman' option
\DeclareOption{roman}{
  \renewcommand{\familydefault}{\rmdefault}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{roman}
\ProcessOptions\relax


%% Define course and teacher command %%
\newcommand{\course}[1]{\renewcommand{\@course}{#1}}
\newcommand{\@course}{\@latex@error{No \unexpand\course given}\@ehc}
\newcommand{\teacher}[1]{\renewcommand{\@teacher}{#1}}
\newcommand{\@teacher}{\@latex@error{No \unexpand\teacher given}\@ehc}


%% Title page %%
\renewcommand{\maketitle}{
        \clearpage
        \begin{titlepage}
        \begin{center}
            \fontsize{50}{60}\selectfont
            \vspace*{\fill}
            \@title
            \vfill
            \fontsize{12}{14.4}\selectfont
            \textbf{Submitted To:} \@teacher\\
            \textbf{Submitted By:} \@author\\
            \textbf{Submitted On:} \@date\\
            \textbf{Course Code:} \@course
        \end{center}
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
  \enumerate[label=\bfseries\arabic*.]%
  \let\realItem\item%
  \def\item##1\par{\realItem\textbf{##1}\par}}%
  {\endenumerate}

%% Setup page %%
\renewcommand{\normalsize}{\fontsize{12}{14.4}\selectfont}
\setlength{\textwidth}{6.5in}
\setlength{\textheight}{9in}
\setcounter{secnumdepth}{0}
