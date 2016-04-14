#!/bin/bash
# create_pdf_report.tex
# Creates a pdf in the build directory for a given file
# Takes in the path to the TeX filename as an argument
TEXFILE_PATH=$1
echo "Creating PDF for file $TEXFILE_PATH"
TEXFILE_NAME=$(basename $TEXFILE_PATH .tex)
echo "Creating build directory"

mkdir -p $(pwd)/build
BUILD_DIR_BUILT=$?

if [[ $BUILD_DIR_BUILT == 0 ]]; then
    echo "Build directory successfully created"
    BUILD_DIR=$(pwd)/build
else
    echo "Failed to build directory, mkdir exited with error $BUILD_DIR_BUILT";
    exit 1
fi

echo "Copying LaTeX package to build directory"
SOURCE_DIR=$(pwd)/src
BUILD_DIR=$(pwd)/build
cp $SOURCE_DIR/workreport.cls $BUILD_DIR/workreport.cls
CLASS_MOVE=$?

cp $SOURCE_DIR/frontmatter.sty $BUILD_DIR/frontmatter.sty
FRONTMATTER_MOVE=$?

cp $SOURCE_DIR/backmatter.sty $BUILD_DIR/backmatter.sty
BACKMATTER_MOVE=$?

if [[ $CLASS_MOVE != 0 || $FRONTMATTER_MOVE != 0 || $BACKMATTER_MOVE != 0 ]]; then
    echo "Error copying LaTeX package to build directory"
    exit 1
else
    echo "LaTeX package successfully moved"
fi

echo "Copying source TeX file to build directory"
    cp $TEXFILE_PATH $BUILD_DIR/$TEXFILE_NAME.tex
    TEXFILE_MOVE=$?

if [[ $TEXFILE_MOVE != 0 ]]; then
    echo "Error copying source file $TEXFILE_PATH"
    exit 1
else
    echo "Successfully copied source file"
fi

echo "Compiling ..."
echo "Step 1: Run pdflatex on the source file"
    pdflatex $BUILD_DIR/$TEXFILE_NAME.tex
    FIRST_COMPILATION=$?
echo "Step 2: Make the glossaries"
    makeglossaries $BUILD_DIR/$TEXFILE_NAME
    GLOSSARIES_EXIT_STATUS=$?
echo "Step 3: Make the references with BiBTex"
    bibtex $BUILD_DIR/$TEXFILE_NAME
    BIBTEX_EXIT_STATUS=$?
echo "Step 4: Run pdflatex again to put the whole thing together"
    pdflatex $BUILD_DIR/$TEXFILE_NAME.tex
    FINAL_COMPILATION=$?

if[[ $FIRST_COMPILATION != 0 || $GLOSSARIES_EXIT_STATUS != 0 || $BIBTEX_EXIT_STATUS != 0 || $FINAL_COMPILATION != 0 ]]; then
    echo "failed to compile file $1"
    exit 1
else
    echo "Compilation complete"
    PDF_FILENAME=$TEXFILE_NAME.pdf
fi

echo "Copying the PDF to original directory and cleaning up"
    cp $BUILD_DIR/$TEXFILE_NAME.pdf $(pwd)/$TEXFILE_NAME.pdf
    PDF_CP_STATUS=$?

if [[ PDF_CP_STATUS != 0 ]]; then
    echo "Unable to copy pdf file to package directory. The file should be located at $BUILD_DIR/$TEXFILE_NAME.pdf"
    exit 1
else
    echo "Cleaning up"
    rm -rf $BUILD_DIR
fi

exit 0
