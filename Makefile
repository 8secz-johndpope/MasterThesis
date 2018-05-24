### 注意
## 画像が表示されない場合
# 画像のPDFと出力PDFのバージョンの整合性を取る必要があります
# 手順1. img/org内のpdfのバージョンを調査（バイナリをエディタで開けば1行目にver1.6とか出てきます）
# 手順2. 本MAKEFILEの13行目のオプションを，手順1で調べたバージョンに指定（ex. ver1.6なら-V 6）
# 補足：デフォルトのdvipdfの出力pdfバージョンはver1.5のようで，画像用pdfのバージョンの方が出力pdfのバージョンよりも新しいとダメなようです（たぶん）

TARGET = thesis

TEX = platex
BIBTEX = pbibtex
DVIPDF = dvipdfmx
DVIPDFOPT = -V 6
PDFLATEX = pdflatex
FONTMAP = font/ipa.map
BIBNAME = ref.bib
IMGDIR = img
TRASH = $(TARGET).aux $(TARGET).bbl $(TARGET).dvi $(TARGET).log $(TARGET).toc $(TARGET).lof $(TARGET).lot $(TARGET).blg

.SUFFIXES: .pdf .dvi .tex .bbl .bib
.PHONY: all clean cleanButPdf

all: $(TARGET).pdf

.dvi.pdf:
	$(DVIPDF) $(DVIPDFOPT) -f $(FONTMAP) $<

$(TARGET).dvi: $(TARGET).tex *.tex $(TARGET).bbl
	$(TEX) $(TARGET).tex && $(TEX) $(TARGET).tex

$(TARGET).bbl: $(BIBNAME)
	cd $(IMGDIR); make
	$(TEX) $(TARGET).tex && $(BIBTEX) $(TARGET)

clean:
	-rm -f $(TRASH) $(TARGET).pdf
	cd $(IMGDIR); make clean

cleanButPdf:
	-rm -f $(TRASH)
	cd $(IMGDIR); make clean
