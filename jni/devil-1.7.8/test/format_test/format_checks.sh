#!/bin/bash

VERBOSE=""    # set VERBOSE="v" for verbose mode
# that @expression@ will be substituted by the 'confgure' script
EXTENSIONS=" BLP BMP DCX DDS DICOM WAD FITS GIF HDR ICNS ICON IFF ILBM IWI JPG JP2 LCMS LIF MDL MNG MP3 PCX PCD PIC PIX PNG PNM PSD PSP PXR RAW ROT SGI SUN TEXTURE TGA TIF TPL UTX VTF WAL WBMP WDP XPM"
# Here are the extensions that should support saving according to docs
#CAN_SAVE=" BMP DDS HDR ICO JPG PCX PNG PPM PSD RAW SGI TGA TIF XPM " RAW and XPM are problematic...
CAN_SAVE="BMP DDS EXR HDR ICO JP2 JPG PCX PNG PPM PSD SGI TGA TIF"
# List of formats that we don't test since they are problematic
PROBLEMATIC="RAW WBMP XPM"

echo "Running saving and loading consistency test..."
FAILED_FORMATS=""
PASSED_FORMATS=""

# if using Wine makes sense, use it...
if [ "x@BUILD_OS@" != "x@HOST_OS@" ] 
	then
	if [ "x" = "xMINGW32" -o "x" = "xCYGWIN" ] 
	then
		test $(which wine 2> /dev/null) && WINE="wine"
		echo "Warning: Using wine to test executables (not 100% reliable)"
	fi
fi

for EXTENSION in $EXTENSIONS
do
	#echo expr match "' $CAN_SAVE '" '.*\s'$EXTENSION'\s.*'
	if [ $(expr match "' $CAN_SAVE '" '.*\s'$EXTENSION'\s.*') -eq 0 -o $(expr match "' $PROBLEMATIC '" '.*\s'$EXTENSION'\s.*') -ne 0 ] 
	then # This extension is not considered as supported...
		continue;
	fi
	test -n	"$VERBOSE" && echo $WINE ./testil -e $EXTENSION
	# EXEEXT comes in when one compiles on platforms that append extensions to executables (testil.exe)
	$WINE ./testil -e$VERBOSE $EXTENSION
	
	# We have to capture whether the test has failed or not
	if [ ! $? -eq 0 ]
	then # we have an error here...
		FAILED_FORMATS="$FAILED_FORMATS $EXTENSION"
		FAILED="$?"
	else #no error...
		PASSED_FORMATS="$PASSED_FORMATS $EXTENSION"
	fi
done

#let's tell something to the user as well:
if [ "x$FAILED" = "x" ] 
then #everything went fine
	echo "All examined formats were OK:$PASSED_FORMATS"
else #something went wrong
	echo "Errors were encountered during the test :-("
	echo "Formats that were OK:$PASSED_FORMATS"
	echo "Failed formats: $FAILED_FORMATS"
	FAILED="1"
fi # end of something went wrong
echo "Problematic (untested) formats: $PROBLEMATIC"

echo

# And we have to tell the result to the shell, too...
exit $FAILED
