ENV_FILE=.env
DEV_ENV_FILE=.env.dev
STAGING_ENV_FILE=.env.staging
PROD_ENV_FILE=.env.prod

DEV_FLAVOR=dev
PROD_FLAVOR=prod
STAGING_FLAVOR=staging

KEY_PROPERTIES_FILE=android/key.properties
STAGING_KEY_PROPERTIES_FILE=android/key_staging.properties
PROD_KEY_PROPERTIES_FILE=android/key_prod.properties

freezed:
	flutter packages pub run build_runner build --delete-conflicting-outputs

init:
	fvm flutter pub get
	make freezed

test:
	flutter run

dev-apk-build:
	fvm flutter build apk --flavor $(DEV_FLAVOR)

staging-apk-build:
	fvm flutter build apk --flavor $(STAGING_FLAVOR)

prod-appbundle-build:
	fvm flutter build appbundle --flavor $(PROD_FLAVOR)

dev-ipa-build:
	fvm flutter build ipa --flavor $(DEV_FLAVOR)

staging-ipa-build:
	fvm flutter build ipa --flavor $(STAGING_FLAVOR)

prod-ipa-build:
	fvm flutter build ipa --flavor $(PROD_FLAVOR)

android-dev-build: dev-config dev-apk-build

android-staging-build: staging-config staging-apk-build

android-prod-build: prod-config prod-appbundle-build

ios-dev-build: dev-config dev-ipa-build

ios-staging-build: staging-config staging-ipa-build

ios-prod-build: prod-config prod-ipa-build

dev-config:
	cp $(DEV_ENV_FILE) $(ENV_FILE)
	cp $(STAGING_KEY_PROPERTIES_FILE) $(KEY_PROPERTIES_FILE)

staging-config:
	cp $(STAGING_ENV_FILE) $(ENV_FILE)
	cp $(STAGING_KEY_PROPERTIES_FILE) $(KEY_PROPERTIES_FILE)

prod-config:
	cp $(PROD_ENV_FILE) $(ENV_FILE)
	cp $(PROD_KEY_PROPERTIES_FILE) $(KEY_PROPERTIES_FILE)
