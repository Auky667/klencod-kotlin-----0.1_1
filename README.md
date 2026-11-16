# ترميم الإسلام — مشروع Android Native

هذا المشروع تطبيق Android أصلي مبني باستخدام Kotlin وJetpack Compose، وليس مشروع React Native أو WebView. بيانات الموسوعة الأساسية مضمنة محليًا في `app/src/main/assets/encyclopedia.json`، كما توجد نسخة HTML المرجعية في `public/assets/aistudio/`.

## فتح المشروع في Klencod IDE

1. فك ضغط الملف ZIP كاملًا.
2. من Klencod IDE اختر Open Project / Import Project.
3. اختر المجلد الرئيسي الذي يحتوي على `settings.gradle.kts` و`build.gradle.kts`، ولا تختر مجلد `app` وحده.
4. اسمح بمزامنة Gradle وتنزيل الاعتماديات عند توفر الإنترنت.
5. اختر مهمة `:app:assembleDebug` أو أمر البناء المكافئ في IDE.
6. بعد نجاح البناء يكون APK عادةً في:

   `app/build/outputs/apk/debug/app-debug.apk`

## البناء من الطرفية

إذا كانت بيئة البناء توفر Gradle متوافقًا:

```bash
./gradlew :app:assembleDebug
```

في Windows:

```bat
gradlew.bat :app:assembleDebug
```

ملاحظة: تصدير AI Studio لم يتضمن `gradle-wrapper.jar`، لذلك أُضيف مشغّل احتياطي يستعمل Gradle المثبت في البيئة إن توفر. إذا كان Klencod IDE يوفر Gradle داخليًا، استخدم زر البناء/المزامنة الخاص به. إذا لم يوفره، فستحتاج إلى إعداد Gradle Wrapper كامل أو Gradle محلي متوافق.

## إعدادات البناء الموجودة

- applicationId: `com.tarmeem.islam`
- namespace: `com.example` (يُترك كما هو لأن ملفات Kotlin ومراجع R تستخدم الحزمة `com.example`)
- minSdk: 24
- targetSdk: 36
- compileSdk: 36.1
- Android Gradle Plugin: 9.1.1
- Gradle distribution المحدد: 9.3.1
- Kotlin: 2.2.10

## ملاحظات مهمة

- لم يتم تغيير شيفرات التطبيق أو بيانات الموسوعة الأصلية.
- أُضيف ملف `debug.keystore` لأن إعداد debug في المشروع يشير إليه.
- لا يحتوي هذا الأرشيف على APK مبني؛ نجاح البناء يعتمد على توفر Android SDK وJDK وGradle/دعم Klencod للإصدارات المحددة.
- لا ترفع `debug.keystore` أو تستخدمه لتوقيع إصدار إنتاجي. أنشئ مفتاح توقيع خاصًا وآمنًا عند النشر.
- `GEMINI_API_KEY` غير مطلوب لتشغيل بيانات الموسوعة المحلية الأساسية؛ لا تضع مفاتيح API سرية داخل التطبيق المنشور.
