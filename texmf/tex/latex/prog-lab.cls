%% Identification %%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{prog-lab}[2021/02/01 Programming Assignment Class]


\LoadClass{assignment}
\RequirePackage[nobottomtitles*]{titlesec}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{booktabs}
\RequirePackage{parskip}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{siunitx}
\RequirePackage{float}
\RequirePackage{multirow}
\RequirePackage{nicematrix}
\RequirePackage{systeme}
\RequirePackage{environ}
\RequirePackage{listings}
\RequirePackage{color}

\definecolor{coperation}{RGB}{57,113,237}
\definecolor{csection}{RGB}{163,106,199}
\definecolor{cregister}{RGB}{204,52,43}
\definecolor{cstring}{RGB}{25,136,68}
\definecolor{ccomment}{RGB}{180,183,180}
\definecolor{cbackground}{RGB}{250,250,250}

\input{avr-lst.tex}

\lstset{
    showstringspaces=false,
    aboveskip=3mm,
    belowskip=3mm,
    numbers=left,
    numbersep=10pt,
    tabsize=3,
    basicstyle={\small\ttfamily},
    keywordstyle=[1]\color{coperation},
    keywordstyle=[2]\color{csection},
    keywordstyle=[3]\color{cregister},
    stringstyle=\color{cstring},
    commentstyle=\color{ccomment},
    backgroundcolor=\color{cbackground},
    upquote=true,
    frame=single,
    rulecolor=\color{cbackground},
}

\graphicspath{ {./images/} }

\titlespacing*{\section}{0pt}{5.5ex plus 1ex minus .2ex}{1.3ex plus .2ex}

\captionsetup{justification=raggedright, singlelinecheck=false, format=hang}

% Fix spacing when two fractions are above/below each other
\NiceMatrixOptions{cell-space-top-limit=1pt,cell-space-bottom-limit=1pt}

\NewEnviron{alignterms}{%
    \sysdelim{.}{.}\systeme{\BODY}
}

\NewEnviron{matrixsteps}{%
  \begin{align*}
    \begin{NiceMatrixBlock}[auto-columns-width]
      \begin{aligned}
        \BODY
      \end{aligned}
    \end{NiceMatrixBlock}
  \end{align*}
}

\newcommand{\tageq}[1]{\label{eq:#1}\tag{eq. #1}}
\newcommand{\req}[1]{\eqref{eq:#1}}

\newcommand{\elementarystep}[2]{%
  \begin{bNiceMatrix}[r]
    #2
  \end{bNiceMatrix} & \hspace{10pt}\text{\parbox{4cm}{#1}} \\ \\
}

\newcommand{\emptyline}{\phantom{T}}

\allowdisplaybreaks

\makeatletter
\setlength\@fptop{0pt}
\setlength\@fpsep{8pt plus 1fil}
\setlength\@fpbot{0pt}
\makeatother

