mkdir temp;
cd temp;
echo "\documentclass[a4paper]{article}
\usepackage[margin=0in]{geometry}
\usepackage{pdfpages}
\usepackage[bookmarks=true]{hyperref}
\usepackage{bookmark}
\usepackage{graphicx}
\begin{document}" > combined.tex;
for line in $(ls ../images/); do
echo Including $line
echo "
\pdfbookmark{$line}{$line}
\noindent
\includegraphics[width=\paperwidth-0.1mm, height=\paperheight-0.1mm]{../images/$line}
\pagebreak
">> combined.tex;
done;
echo "\end{document}" >> combined.tex;
