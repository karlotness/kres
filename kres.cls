\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kres}[2016/05/25 Karl Resume]

\DeclareOption*{
  \ClassWarning{kres}{Unknown option '\CurrentOption'}
}
\ProcessOptions\relax

\LoadClass[letterpaper, 11pt]{article}
\RequirePackage[T1]{fontenc}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{navigator, libertine, multicol, microtype, xstring, changepage, xparse, ifthen}

\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\setlength{\multicolsep}{0pt}
\setlength{\partopsep}{0pt}
\pagenumbering{gobble}

\newcounter{res@numaddress}

\NewDocumentCommand{\name}{m}{\def\res@name{#1}}
\RenewDocumentCommand{\author}{}{\name}
\NewDocumentCommand{\makename}{}{
  {\centering\Large\textsc{\textbf{\res@name}}\par\vspace{0.15em}}
}
\RenewDocumentCommand{\maketitle}{}{\makename}
\NewDocumentCommand{\address}{m}{
  \ifthenelse{\value{res@numaddress} = 0}{
    \def\res@addra{#1}
  }
  {
    \ifthenelse{\value{res@numaddress} = 1}{
      \def\res@addrb{#1}
    }
    {
      \ClassError{kres}{Too many addresses}{No more than two addresses are supported at this time}
    }
  }
  \stepcounter{res@numaddress}
}
\NewDocumentCommand{\phone}{m}{
  \def\res@phone{#1}
}
\NewDocumentCommand{\email}{m}{
  \def\res@email{#1}
}
\NewDocumentCommand{\formatphone}{m}{(\StrLeft{#1}{3}) \StrMid{#1}{4}{6}-\StrRight{#1}{4}}
\NewDocumentCommand\makephone{s}{
  \IfBooleanTF#1
  {\formatphone{\res@phone}}
  {\href{tel:\res@phone}{\formatphone{\res@phone}}}
}
\NewDocumentCommand\makeemail{s}{
  \IfBooleanTF#1
  {\res@email}
  {\href{mailto:\res@email}{\res@email}}
}
\NewDocumentCommand{\res@makecontactoutline}{}{\outline{1}{Contact}}
\NewDocumentCommand{\res@makeemcol}{}{
  \ifthenelse{\isundefined{\res@phone}}
  {}{\makephone\\}
  \ifthenelse{\isundefined{\res@email}}
  {}{\makeemail}
}
\NewDocumentCommand{\res@maketriplecontact}{}{
  \res@makecontactoutline
  \begin{multicols}{3}
    \begin{flushleft}
      \res@addra
    \end{flushleft}\columnbreak
      {\centering\res@makeemcol\par}
    \columnbreak
    \begin{flushright}
      \res@addrb
    \end{flushright}
  \end{multicols}
}
\NewDocumentCommand{\res@makedoublecontact}{}{
  \res@makecontactoutline
  \begin{multicols}{2}
    \begin{flushleft}
      \res@addra
    \end{flushleft}\columnbreak
    \begin{flushright}
      \res@makeemcol
    \end{flushright}\columnbreak
  \end{multicols}
}
\NewDocumentCommand{\res@makesinglecontact}{}{
  \res@makecontactoutline
  {\centering
    \res@makeemcol\par
  }
}
\NewDocumentCommand{\makecontact}{}{
  \ifthenelse{\value{res@numaddress} = 0}
  {\res@makesinglecontact}
  {
    \ifthenelse{\value{res@numaddress} = 1}
    {\res@makedoublecontact}
    {
      \ifthenelse{\value{res@numaddress} = 2}
      {
        \res@maketriplecontact
      }
      {\ClassError{kres}{Too many addresses to format}{No more than two addresses are supported at this time}}
    }
  }
}
\RenewDocumentCommand{\section}{m}{
  \vspace{0.5em}
  \outline{1}{#1}
  {
    \parskip=0pt
    \large\textsc{\textbf{#1}}\par
    \vspace{0.15em}\nointerlineskip\rule{\textwidth}{0.7pt}
    \par
  }
}
\NewDocumentCommand{\res@makesmallentryline}{mm}{
  {\small \textbf{#1} \hfill \textbf{#2}\par}
}
\NewDocumentEnvironment{entry}{mO{}O{}oo}
{
  \vspace{0.05em}
  \outline{2}{#1}
  \textbf{#1} {\small \textit{#3}} \hfill \textbf{#2}\par
  \IfValueTF{#4}{
    \res@makesmallentryline{#4}{\IfValueT{#5}{#5}}
  }
  {
    \IfValueT{#5}{\res@makesmallentryline{\IfValueT{#4}{#4}}{#5}}
  }
  \begin{adjustwidth}{0.2in}{}
}
{
  \end{adjustwidth}\par
}
\NewDocumentEnvironment{inlineentry}{m}
{
  \vspace{0.05em}
  \outline{2}{#1}
  \hangindent=0.2in
  \textbf{#1:}
}
{\par}
\NewDocumentCommand{\makepdfmeta}{}{
  \hypersetup
  {
    pdfauthor={\res@name},
    pdftitle={\res@name\ Resume}
  }
}