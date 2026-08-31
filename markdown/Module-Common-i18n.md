---
title: "Module:Common/i18n"
wiki_url: "https://wiki.warframe.com/w/Module/Common/i18n"
wiki_timestamp: "2022-09-23T23:15:59Z"
---

## Warning!

[[edit source](/w/Template:I18n_module?action=edit&section=T-1 "Edit section's source code: Warning!")]

You are viewing a module with translations for the [Common](/w/Module:Common "Module:Common") module. **It is not advised to edit this page manually.** Instead, use the [translations editor](/w/Special:BlankPage/I18nEdit/Lua/Common "Special:BlankPage/I18nEdit/Lua/Common"). If there's something that has to be done that the translation editor cannot do or if the translation editor misbehaved please leave a message on [the I18nEdit talk page](https://dev.fandom.com/wiki/Talk:I18nEdit) about your issue.

Upon editing this page without the translations editor you will be stopped by [the abuse filter](/w/Special:AbuseFilter "Special:AbuseFilter").

[Open translations editor](/w/Special:BlankPage/I18nEdit/Lua/Common "Special:BlankPage/I18nEdit/Lua/Common")

---

```lua
-- 
return {
    ["en"] = {
        ["module"] = "{{plural:$1|module|modules}}",
        ["stylesheet"] = "{{plural:$1|stylesheet|stylesheets}}",
        ["global"] = "Global",
        ["personal"] = "Personal",
        ["vanilla-mw"] = "Vanilla MediaWiki",
        ["reason"] = "Reason",
        ["application"] = "{{plural:$1|application|applications}}",
        ["sitewide"] = "Site-wide",
        ["template"] = "{{plural:$1|template|templates}}",
        ["local"] = "Local",
        ["custom-languages-notice"] = "Text {{#if:$3|above|below}} can be found [[$1|here]] ([$2 edit])",
        ["unknown"] = "Unknown",
        ["script"] = "{{plural:$1|script|scripts}}",
        ["recommended"] = "Recommended"
    },
    ["ar"] = {
        ["custom-languages-notice"] = "يمكن العثور على النص {{#if:$3|فوق|تحت}} [[$1|هنا]] ([$2 حرر])"
    },
    ["be"] = {
        ["module"] = "{{plural:$1|модуль|модуляў}}",
        ["stylesheet"] = "{{plural:$1|табліца стыляў|табліц стыляў}}",
        ["global"] = "Глабальная",
        ["personal"] = "Персанальная",
        ["reason"] = "Прычына",
        ["application"] = "{{plural:$1|дадатак|дадатакў}}",
        ["script"] = "{{plural:$1|скрыпт|скрыптоў}}",
        ["template"] = "{{plural:$1|шаблон|шаблонаў}}",
        ["local"] = "Лакальная",
        ["custom-languages-notice"] = "Тэкст {{#if:$3|вышэй|ніжэй}} можна знайсці [[$1|тут]] ([$2 правіць])",
        ["unknown"] = "Невядома",
        ["sitewide"] = "Лакальная",
        ["recommended"] = "Рэкамендаваная"
    },
    ["bn"] = {
        ["module"] = "{{plural:$1|মোডাল|মোডাল}}",
        ["stylesheet"] = "{{plural:$1|স্টাইলশিট|স্টাইলশিট}}",
        ["global"] = "গ্লোবাল",
        ["personal"] = "ব্যক্তিগত",
        ["reason"] = "কারণ",
        ["application"] = "{{plural:$1|এপ্লিকেশন|এপ্লিকেশন}}",
        ["sitewide"] = "সাইট-ওয়াইড",
        ["template"] = "{{plural:$1|টেম্পলেট|টেম্পলেট}}",
        ["local"] = "লোকাল",
        ["custom-languages-notice"] = "{{#if:$3|উপরে|নীচে}}র টেক্সট [[$1|এখানে]] পাওয়া যায় ([$2 সম্পাদন])",
        ["unknown"] = "অচেনা",
        ["script"] = "{{plural:$1|স্ক্রিপ্ট|স্ক্রিপ্ট}}",
        ["recommended"] = "সুপারিশ করা"
    },
    ["ca"] = {
        ["custom-languages-notice"] = "El text de dalt es pot trobar aquí ([$2 modifica])"
    },
    ["co"] = {
        ["custom-languages-notice"] = "U testu supra pò esse truvatu quì ([$2 mudificà])"
    },
    ["de"] = {
        ["module"] = "{{plural:$1|Modul|Module}}",
        ["stylesheet"] = "{{plural:$1|Stylesheet|Stylesheets}}",
        ["global"] = "Global",
        ["personal"] = "Persönlich",
        ["sitewide"] = "Seitenweit",
        ["reason"] = "Grund",
        ["application"] = "{{plural:$1|Applikation|Applikationen}}",
        ["template"] = "{{plural:$1|Vorlage|Vorlagen}}",
        ["script"] = "{{plural:$1|Skript|Skripte}}",
        ["local"] = "Lokal",
        ["custom-languages-notice"] = "Den {{#if:$3|obigen|unteren}} Text findest du [[$1|hier]] ([$2 bearbeiten])",
        ["unknown"] = "Unbekannt",
        ["recommended"] = "Empfohlen",
        ["vanilla-mw"] = "Vanilla MediaWiki"
    },
    ["el"] = {
        ["module"] = "{{plural:$1|άρθρωμα|αρθρώματα}}",
        ["stylesheet"] = "{{plural:$1|σελίδα στυλ|σελίδες στυλ}}",
        ["global"] = "Γενικά",
        ["personal"] = "Προσωπική",
        ["reason"] = "Αιτία",
        ["application"] = "{{plural:$1|εφαρμογή|εφαρμογές}}",
        ["sitewide"] = "Site-wide",
        ["template"] = "{{plural:$1|πρότυπο|πρότυπα}}",
        ["local"] = "Τοπικά",
        ["custom-languages-notice"] = "Το κείμενο {{#if:$3|παραπάνω|παρακάτω}} μπορεί να βρεθεί [[$1|εδώ]] ([$2 επεξεργασία])",
        ["unknown"] = "Άγνωστο",
        ["script"] = "{{plural:$1|κώδικας|κώδικες}}",
        ["recommended"] = "Προτεινόμενο"
    },
    ["es"] = {
        ["module"] = "{{plural:$1|módulo|módulos}}",
        ["stylesheet"] = "{{plural:$1|hoja de estilo|hojas de estilo}}",
        ["global"] = "Global",
        ["personal"] = "Personal",
        ["reason"] = "Razón",
        ["application"] = "{{plural:$1|aplicación|aplicaciones}}",
        ["sitewide"] = "Todo el sitio",
        ["template"] = "{{plural:$1|plantilla|plantillas}}",
        ["local"] = "Local",
        ["custom-languages-notice"] = "El texto de {{#if: $3|arriba|abajo}} se puede encontrar [[$1|aquí]] ([$2 editar])",
        ["unknown"] = "Desconocido",
        ["script"] = "{{plural:$1|script|scripts}}",
        ["recommended"] = "Recomendado"
    },
    ["fi"] = {
        ["custom-languages-notice"] = "{{#if:$3|Alla|Yllä}} oleva teksti löytyy [[$1|täältä]] ([$2 muokkaus])"
    },
    ["fr"] = {
        ["module"] = "{{plural:$1|module|modules}}",
        ["stylesheet"] = "{{plural:$1|feuille de style|feuilles de style}}",
        ["global"] = "Global",
        ["personal"] = "Personnel",
        ["sitewide"] = "Tout le site",
        ["reason"] = "Raison ",
        ["application"] = "{{plural:$1|application|applications}}",
        ["template"] = "{{plural:$1|modèle|modèles}}",
        ["script"] = "{{plural:$1|script|scripts}}",
        ["local"] = "Locale",
        ["custom-languages-notice"] = "Le texte {{#if:$3|ci-dessus|ci dessous}} peut être trouvé [[$1|ici]] ([$2 éditer])",
        ["unknown"] = "Inconnu",
        ["recommended"] = "Recommandée",
        ["vanilla-mw"] = "MediaWiki Vanilla"
    },
    ["hi"] = {
        ["module"] = "{{plural:$1|मॉड्यूल|मॉड्यूल्स}}",
        ["stylesheet"] = "{{plural:$1|स्टाइलशीट|स्टाइलशीट्स}}",
        ["global"] = "वैश्विक",
        ["personal"] = "व्यक्तिगत",
        ["reason"] = "कारण",
        ["application"] = "ऐप्लिकेशन",
        ["sitewide"] = "पूरे साइट के लिए",
        ["template"] = "{{plural:$1|साँचा|साँचें}}",
        ["local"] = "लोकल",
        ["custom-languages-notice"] = "{{#if:$3|ऊपर|नीचे}} का टेक्स्ट [[$1|यहाँ]] पाया जा सकता है ([$2 सम्पादन])",
        ["unknown"] = "अनजान",
        ["script"] = "{{plural:$1|स्क्रिप्ट|स्क्रिप्ट्स}}",
        ["recommended"] = "अनुशंसित",
        ["vanilla-mw"] = "वैनिला मीडियाविकि"
    },
    ["hr"] = {
        ["custom-languages-notice"] = "Tekst {{#if:$3|iznad|ispod}} može biti pronađen [[$1|ovdje]] ([$2 uredi])"
    },
    ["id"] = {
        ["module"] = "modul",
        ["stylesheet"] = "Stylesheet",
        ["global"] = "Global",
        ["personal"] = "Pribadi",
        ["reason"] = "Alasan",
        ["application"] = "Aplikasi",
        ["sitewide"] = "Situs Luas",
        ["template"] = "templat",
        ["local"] = "Lokal",
        ["custom-languages-notice"] = "Teks {{#if:$3|diatas|below}} bisa ditemukan [[$1|disini]] ([$2 sunting])",
        ["unknown"] = "Tidak Diketahui",
        ["script"] = "Skrip",
        ["recommended"] = "Direkomendasikan"
    },
    ["it"] = {
        ["sitewide"] = "Tutto il sito",
        ["global"] = "Globale",
        ["local"] = "Locale",
        ["custom-languages-notice"] = "Il testo di sopra può essere trovato qui ([$2 modifica])",
        ["script"] = "{{plural:$1|script|scripts}}",
        ["personal"] = "Personale",
        ["recommended"] = "Consigliata"
    },
    ["ja"] = {
        ["module"] = "モジュール",
        ["stylesheet"] = "スタイルシート",
        ["global"] = "全Wiki",
        ["personal"] = "個人利用",
        ["reason"] = "理由",
        ["application"] = "アプリケーション",
        ["sitewide"] = "該当Wiki",
        ["template"] = "テンプレート",
        ["local"] = "ローカル",
        ["custom-languages-notice"] = "{{#if:$3|上記|以下}}の文章は[[$1|こちら]] ([$2 編集])",
        ["unknown"] = "不明",
        ["script"] = "スクリプト",
        ["recommended"] = "推奨"
    },
    ["ka"] = {
        ["custom-languages-notice"] = "{{#if:$3|ზემოთ|ქვემოთ}} წარმოდგენილი ტექსტი აგრეთვე შეგიძლიათ, იხილოთ [[$1|აქ]] ([$2 რედაქტირება])"
    },
    ["ko"] = {
        ["module"] = "모듈",
        ["stylesheet"] = "스타일시트",
        ["global"] = "개인 전역",
        ["personal"] = "개인",
        ["reason"] = "이유",
        ["application"] = "애플리케이션",
        ["sitewide"] = "위키 전역",
        ["template"] = "틀",
        ["local"] = "개인 지역",
        ["custom-languages-notice"] = "{{#if:$3|위|아래}}의 텍스트는 [[$1|이곳]]에서 확인하실 수 있습니다. ([$2 편집])",
        ["unknown"] = "알 수 없음",
        ["script"] = "스크립트",
        ["recommended"] = "추천"
    },
    ["lv"] = {
        ["custom-languages-notice"] = "{{#if:$3|Augstāk|Zemāk}} redzamo tekstu var atrast [[$1|šeit]] ([$2 labot])"
    },
    ["mo"] = {
        ["custom-languages-notice"] = "Текстул де май {{#if:$3|сус|жос}} поате фи гэсит [[$1|аич]] ([$2 редактаре])"
    },
    ["nl"] = {
        ["custom-languages-notice"] = "{{#if:$3|Bovenstaande|Onderstaande}} tekst kan [[$1|hier]] gevonden worden ([$2 bewerken])",
        ["sitewide"] = "Wikibrede",
        ["script"] = "{{plural:$1|script|scripts}}",
        ["personal"] = "Persoonlijke"
    },
    ["pl"] = {
        ["module"] = "{{plural:$1|moduł|moduły|modułów}}",
        ["stylesheet"] = "{{plural:$1|styl|style|stylów}}",
        ["global"] = "Globalna",
        ["personal"] = "Osobista",
        ["reason"] = "Powód",
        ["application"] = "{{plural:$1|aplikacja|aplikacje}}",
        ["sitewide"] = "Wszyscy użytkownicy",
        ["template"] = "{{plural:$1|szablon|szablony|szablonów}}",
        ["local"] = "Lokalna",
        ["custom-languages-notice"] = "Tekst widoczny {{#if:$3|powyżej|poniżej}} znajduje się na [[$1|tej stronie]] ([$2 edytuj])",
        ["unknown"] = "Nieznany",
        ["script"] = "{{plural:$1|skrypt|skrypty|skryptów}}",
        ["recommended"] = "Zalecana"
    },
    ["pt"] = {
        ["module"] = "{{plural:$1|módulo|módulos}}",
        ["stylesheet"] = "{{plural:$1|folha de estilo|folhas de estilo}}",
        ["global"] = "Global",
        ["personal"] = "Pessoal",
        ["reason"] = "Razão",
        ["application"] = "{{plural:$1|aplicação|aplicações}}",
        ["sitewide"] = "Todo o site",
        ["template"] = "{{plural:$1|predefinição|predefinições}}",
        ["local"] = "Local",
        ["custom-languages-notice"] = "O texto {{#if:$3|acima|abaixo}} pode ser encontrado [[$1|aqui]] ([$2 editar])",
        ["unknown"] = "Desconhecido",
        ["script"] = "{{plural:$1|script|scripts}}",
        ["recommended"] = "Recomendado"
    },
    ["pt-br"] = {
        ["module"] = "{{plural:$1|módulo|módulos}}",
        ["stylesheet"] = "{{plural:$1|folha de estilo|folhas de estilo}}",
        ["global"] = "Global",
        ["personal"] = "Pessoal",
        ["reason"] = "Razão",
        ["application"] = "{{plural:$1|aplicação|aplicações}}",
        ["sitewide"] = "Em todo o site",
        ["template"] = "{{plural:$1|predefinição|predefinições}}",
        ["local"] = "Local",
        ["custom-languages-notice"] = "O texto {{#if:$3|acima|abaixo}} pode ser encontrado [[$1|aqui]] ([$2 editar])",
        ["unknown"] = "Desconhecido",
        ["script"] = "{{plural:$1|script|scripts}}",
        ["recommended"] = "Recomendado"
    },
    ["ru"] = {
        ["module"] = "{{plural:$1|модуль|модуля|модулей}}",
        ["stylesheet"] = "{{plural:$1|таблица|таблицы|таблиц}} стилей",
        ["global"] = "Глобальная",
        ["personal"] = "Персональная",
        ["vanilla-mw"] = "Оригинальная MediaWiki",
        ["reason"] = "Причина",
        ["application"] = "{{plural:$1|приложение|приложения|приложения}}",
        ["script"] = "{{plural:$1|скрипт|скрипта|скриптов}}",
        ["template"] = "{{plural:$1|шаблон|шаблона|шаблонов}}",
        ["local"] = "Локальная",
        ["custom-languages-notice"] = "Текст {{#if:$3|выше|ниже}} можно найти [[$1|здесь]] ([$2 править])",
        ["unknown"] = "Неизвестно",
        ["sitewide"] = "Локальная",
        ["recommended"] = "Рекомендованная"
    },
    ["sr"] = {
        ["custom-languages-notice"] = "Садржај {{#if:$3|изнад|испод}} се може наћи [[$1|овде]] ([$2 уреди])"
    },
    ["sr-ec"] = {
        ["custom-languages-notice"] = "Садржај {{#if:$3|изнад|испод}} се може наћи [[$1|овде]] ([$2 уреди])"
    },
    ["sr-el"] = {
        ["custom-languages-notice"] = "Sadržaj {{#if:$3|iznad|ispod}} se može naći [[$1|ovde]] ([$2 uredi])"
    },
    ["tl"] = {
        ["module"] = "{{plural:$1|module|mga module}}",
        ["stylesheet"] = "{{plural:$1|stylesheet|mga stylesheet}}",
        ["global"] = "Buong Fandom",
        ["personal"] = "Pansarili",
        ["sitewide"] = "kabuoan ng Wiki",
        ["reason"] = "Dahilan",
        ["application"] = "{{plural:$1|application|mga application}}",
        ["template"] = "{{plural:$1|template|mga template}}",
        ["vanilla-mw"] = "Vanilla MediaWiki",
        ["local"] = "Lokal",
        ["custom-languages-notice"] = "Ang teksto {{#if:$3|sa taas|sa baba}} ay mahanap [[$1|dito]] ([$2 I-edit])",
        ["unknown"] = "Hindi alam",
        ["script"] = "{{plural:$1|script|mga script}}",
        ["recommended"] = "Inirekomenda"
    },
    ["tr"] = {
        ["module"] = "{{plural:$1|modül|modüller}}",
        ["stylesheet"] = "{{plural:$1|stil|stiller}}",
        ["global"] = "Küresel",
        ["personal"] = "Kişisel",
        ["vanilla-mw"] = "Vanilya MediaWiki",
        ["reason"] = "Sebep",
        ["application"] = "{{plural:$1|uygulama|uygulamalar}}",
        ["sitewide"] = "Site çapı",
        ["template"] = "{{plural:$1|şablon|şablonlar}}",
        ["local"] = "Konum",
        ["custom-languages-notice"] = "{{#if:$3|Yukarıdaki|Aşağıdaki}} metin, [[$1|burada]] bulabilir ([$2 düzenle])",
        ["unknown"] = "Bilinmiyor",
        ["script"] = "{{plural:$1|betik|betiker}}",
        ["recommended"] = "Önerilen"
    },
    ["uk"] = {
        ["module"] = "{{plural:$1|модуль|модулів}}",
        ["stylesheet"] = "{{plural:$1|таблиця стилів|таблиць стилів}}",
        ["global"] = "Глобальне",
        ["personal"] = "Персональне",
        ["reason"] = "Причина",
        ["application"] = "{{plural:$1|додаток|додатки}}",
        ["script"] = "{{plural:$1|скрипт|скриптів}}",
        ["template"] = "{{plural:$1|шаблон|шаблонів}}",
        ["local"] = "Локальне",
        ["custom-languages-notice"] = "Текст {{#if:$3|вище|нижче}} можна знайти [[$1|тут]] ([$2 редагувати])",
        ["unknown"] = "Невідомо",
        ["sitewide"] = "Локальне",
        ["recommended"] = "Рекомендовано"
    },
    ["vi"] = {
        ["vanilla-mw"] = "MediaWiki bản thường",
        ["stylesheet"] = "{{plural:$1|stylesheet|các stylesheet}}",
        ["global"] = "Toàn cục",
        ["personal"] = "Cá nhân",
        ["module"] = "{{plural:$1|mô đun|các mô đun}}",
        ["reason"] = "Lý do",
        ["application"] = "{{plural:$1|ứng dụng|các ứng dụng}}\n",
        ["sitewide"] = "Toàn hệ trang",
        ["template"] = "{{plural:$1|bản mẫu|các bản mẫu}}",
        ["local"] = "Cục bộ",
        ["custom-languages-notice"] = "Văn bản bên {{#if:$3|trên|dưới}} có thể được tìm thấy [[$1|tại đây]] ([$2 sửa])",
        ["unknown"] = "Không rõ",
        ["recommended"] = "Gợi ý",
        ["script"] = "{{plural:$1|đoạn mã|nhiều đoạn mã}}"
    },
    ["zh-hans"] = {
        ["module"] = "模块",
        ["stylesheet"] = "样式表",
        ["global"] = "全域",
        ["personal"] = "个人",
        ["vanilla-mw"] = "原版MediaWiki",
        ["reason"] = "原因",
        ["application"] = "应用程序",
        ["sitewide"] = "社区",
        ["template"] = "模板",
        ["local"] = "本地",
        ["custom-languages-notice"] = "{{#if:$3|以上|以下}}的文本可以在[[$1|这里]]找到（[$2 编辑]）",
        ["unknown"] = "未知",
        ["script"] = "脚本",
        ["recommended"] = "推荐"
    },
    ["zh-hant"] = {
        ["module"] = "模組",
        ["stylesheet"] = "樣式表",
        ["global"] = "全域",
        ["personal"] = "個人",
        ["vanilla-mw"] = "原版MediaWiki",
        ["reason"] = "原因",
        ["application"] = "應用程式",
        ["sitewide"] = "社區",
        ["template"] = "模板",
        ["local"] = "本地",
        ["custom-languages-notice"] = "{{#if:$3|以上|以下}}文字可以在[[$1|此處]]找到（[$2 編輯]）",
        ["unknown"] = "未知",
        ["script"] = "腳本",
        ["recommended"] = "推薦"
    }
}
```

