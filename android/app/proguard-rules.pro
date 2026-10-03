# Flutter & Android R8 / ProGuard Obfuscation & Security Rules
# -----------------------------------------------------------

# Kod küçültme ve agresif optimizasyon
-optimizationpasses 5
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-verbose

# Hata ayıklama bilgilerini ve kaynak dosya isimlerini sil (Anti-Decompilation)
-renamesourcefileattribute SourceFile
-keepattributes SourceFile,LineNumberTable

# Flutter motoru ve temel pluginleri koru
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Cryptography ve SharedPreferences desteği
-keep class com.cryptography.** { *; }

# Loglama ve print fonksiyonlarını kaldır
-assumenosideeffects class android.util.Log {
    public static boolean isLoggable(java.lang.String, int);
    public static int v(...);
    public static int d(...);
    public static int i(...);
    public static int w(...);
    public static int e(...);
}

# Play Core ve Deferred Components uyarılarını bastır
-dontwarn com.google.android.play.core.**
-dontwarn io.flutter.embedding.engine.deferredcomponents.**

