% This document class provides a simple memo for LaTeX users.
% It is based on article.cls and inherits most of the functionality
% that class.
% customized by JPAlves for PhD works.
% customized for IST Courses by Rui Santos Cruz.
% Original Author: Rob Oakes, Copyright 2010.  
% Released under the LGPL, version 3.
% A copy of the LGPL can be found at http://www.gnu.org/licenses/lgpl.html
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texRel}[2018/07/31 - Simple Memo Class, Including Logo, 2015/09/20 adaptation by Rui Cruz]
\RequirePackage{palatino}
\usepackage{graphicx}
% Load the Base Class
\LoadClassWithOptions{report}
% Begin Requirements
\RequirePackage{ifthen}
% Specialized memo Commands (To, From, Subject, Logo, Letterhead Address)
\def\@memocourse{\relax}
\newcommand{\memocourse}[1]{\gdef\@memocourse{#1}}
\def\@memoid{\relax}
\newcommand{\memoid}[1]{\gdef\@memoid{#1}}
\def\@memofrom{\relax}
\newcommand{\memofrom}[1]{\gdef\@memofrom{#1}}
\def\@memosubject{\relax}
\newcommand{\memosubject}[1]{\gdef\@memosubject{#1}}
\def\@memodate{\relax}
\newcommand{\memodate}[1]{\gdef\@memodate{#1}}
\def\@memologo{\relax}
\newcommand{\logo}[1]{\gdef\@memologo{\protect #1}}
\def\@letterheadaddress{\relax}
\newcommand{\lhaddress}[1]{\gdef\@letterheadaddress{#1}}
\def\@memoorient{\relax}
\newcommand{\memoorient}[1]{\gdef\@memoorient{#1}}
% Custom Document Formatting
\newcommand\decorativeline[1][1pt]{
	\par\noindent%
	\rule[0.5ex]{\linewidth}{#1}\par
}
\newcommand\arraybslash{\let\\\@arraycr}
% Set the Paper Size and margins
\RequirePackage{geometry}
\geometry{margin=1.0in}

% Create the Letterhead and To/From Block
 
\renewcommand{\maketitle}{\makememotitle}
\newcommand\makememotitle{
	\ifthenelse{\equal{\@memologo}{\relax}}{}
	{ % Create With Logo
	\begin{minipage}[t]{1\columnwidth}%
	UNIVERSIDADE DE TR\'AS-OS-MONTES E ALTO DOURO
		\begin{flushright}
			\vspace{-0.6in}
			\@memologo
			\vspace{0.5in}
		\par\end{flushright}%
	\end{minipage}
	}
	{\begin{center}
	{\LARGE\bf
	P\textsc{lano de Trabalho}}\\ \vspace*{10\p@}
	{\bf da\\Tese de Douramento\\em Engenharia Electrot\'ecnica e de Computadores} 		    \vspace*{5\p@}\\
	  
{de acordo com \\
o disposto no Regulamento Geral dos Ciclos de Estudo\\ 
Conducentes ao Grau de Doutor na UTAD\\
 Di\'ario da Rep\'ublica, 2. a s\'erie - N. o 133 - 13 de julho de 2016}
	\vspace*{30\p@}
	\end{center}}
	% To, From, Subject Block
	\begin{description}
		\ifthenelse{\equal{\@memofrom}{\relax}}{}{\item [\IfLanguageName{english}{From:}{De:}] \@memofrom}
		\ifthenelse{\equal{\@memoid}{\relax}}{}{\item [\IfLanguageName{english}{Student ID:}{Aluno n.:}] \@memoid} 
\ifthenelse{\equal{\@memocourse}{\relax}}{}{\item [\IfLanguageName{english}{Course:}{Disciplina:}] \@memocourse}
		\ifthenelse{\equal{\@memosubject}{\relax}}{}{\item [\IfLanguageName{english}{Title:}{T\'itulo:}] \@memosubject}
		
		\ifthenelse{\equal{\@memodate}{\relax}}{}{\item [\IfLanguageName{english}{Date:}{Data:}] \@memodate}
	
	
	\ifthenelse{\equal{\@memoorient}{\relax}}{}{\item [\IfLanguageName{english}{:}{Orientadores:}] \@memoorient}
	
	\end{description}
	%\newcommand{\orientadores}{\IfLanguageName{english}{Tutors:}{Orientadores:}}
	\decorativeline%\bigskip{}
	%\newgeometry{top=0cm}
	\renewcommand\abstract{\noindent \textbf{\textit{\IfLanguageName{english}{Abstract}{Resumo}}}\hspace{0.1cm}}
	%\restoregeometry
	%\mainmatter
}
