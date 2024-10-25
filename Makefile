g:
	make c
	make l
	make a
	make b
	make p
	make pod

b:
	fvm dart run build_runner build --delete-conflicting-outputs

l:
	fvm flutter gen-l10n

a:
	fluttergen -c pubspec.yaml

p:
	fvm flutter pub get

c:
	fvm flutter clean

cg:
	fvm flutter clean
	fvm flutter pub

cr:
	fvm flutter pub cache repair

pod:
	cd ios && pod install --repo-update && cd ..