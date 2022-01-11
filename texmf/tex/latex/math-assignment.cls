%% Identification %%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{math-assignment}[2020/09/18 Math Assignment Class]


\LoadClass{homework}
\RequirePackage{hyperref}
\RequirePackage{url}
\RequirePackage[nobottomtitles*]{titlesec}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{booktabs}
\RequirePackage{parskip}
\RequirePackage{amssymb}
\RequirePackage{gensymb}
\RequirePackage{mathtools}
\RequirePackage{siunitx}
\RequirePackage{float}
\RequirePackage{multirow}
\RequirePackage{nicematrix}
\RequirePackage{systeme}
\RequirePackage{environ}


\graphicspath{ {./images/} }

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

