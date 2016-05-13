from xml.dom import minidom
xmldoc = minidom.parse('0033.xml')
alto = xmldoc.getElementsByTagName('alto')[0]
layout = alto.getElementsByTagName('Layout')[0]
page = layout.getElementsByTagName('Page')[0]
printspace = page.getElementsByTagName('PrintSpace')[0]
textblocks = printspace.getElementsByTagName('TextBlock')
with open('test.txt', 'w') as f:
	for textblock in textblocks:
		if textblock.getElementsByTagName('TextLine'):
			textlines = textblock.getElementsByTagName('TextLine')
			for textline in textlines:
				strings = textline.getElementsByTagName('String')
				sps = textline.getElementsByTagName('SP')
				for string in strings:
					# f.write("%s\t %s\t %s\t %s\n" % (str(string.getAttribute('HPOS')) \
					# str(string.getAttribute('VPOS')) \
					# str(string.getAttribute('WIDTH')) \
					# str(string.getAttribute('HEIGHT')))
					 f.write("%f %f %f %f\n" % (float(string.getAttribute('HPOS')), float(string.getAttribute('VPOS')), float(string.getAttribute('WIDTH')), float(string.getAttribute('HEIGHT'))))
				# for sp in sps:
				# 	 f.write("%s %s %s\n" % (sp.getAttribute('HPOS'), sp.getAttribute('VPOS'), sp.getAttribute('WIDTH')))
		# if textblock.getAttribute('HPOS'):
		# 	f.write("%f %f %f %f\n" % (float(textblock.getAttribute('HPOS')), float(textblock.getAttribute('VPOS')), float(textblock.getAttribute('WIDTH')), float(textblock.getAttribute('HEIGHT'))))
