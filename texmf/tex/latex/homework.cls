%% Identification %%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2020/10/14 Homework Class]


\LoadClass{assignment}
\RequirePackage[nobottomtitles*]{titlesec}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{booktabs}
\RequirePackage{parskip}
\RequirePackage{float}
\RequirePackage{multirow}
\RequirePackage{environ}


\graphicspath{ {./images/} }

\captionsetup{justification=raggedright, singlelinecheck=false, format=hang}

\newcounter{QuestionCounter}
\setcounter{QuestionCounter}{1}
\newenvironment{question}[1][\arabic{QuestionCounter}]
  {\bigskip\normalfont\textbf{#1. }\stepcounter{QuestionCounter}}{}
\newenvironment{question*}
  {\bigskip\normalfont}{}

\newenvironment{solution}{\smallskip\hspace{\itemindent}\textbf{Solution}

}{}


