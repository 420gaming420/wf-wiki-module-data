---
title: "Module:Mbox/i18n"
wiki_url: "https://wiki.warframe.com/w/Module/Mbox/i18n"
wiki_timestamp: "2022-09-23T23:24:06Z"
---

## Warning!

[[edit source](/w/Template:I18n_module?action=edit&section=T-1 "Edit section's source code: Warning!")]

You are viewing a module with translations for the [Mbox](/w/Module:Mbox "Module:Mbox") module. **It is not advised to edit this page manually.** Instead, use the [translations editor](/w/Special:BlankPage/I18nEdit/Lua/Mbox "Special:BlankPage/I18nEdit/Lua/Mbox"). If there's something that has to be done that the translation editor cannot do or if the translation editor misbehaved please leave a message on [the I18nEdit talk page](https://dev.fandom.com/wiki/Talk:I18nEdit) about your issue.

Upon editing this page without the translations editor you will be stopped by [the abuse filter](/w/Special:AbuseFilter "Special:AbuseFilter").

[Open translations editor](/w/Special:BlankPage/I18nEdit/Lua/Mbox "Special:BlankPage/I18nEdit/Lua/Mbox")

---

```lua
-- 
return {
    ["en"] = {
        ["aside"] = "aside",
        ["type"] = "type",
        ["bgcolor"] = "bgcolor",
        ["imagelink"] = "imagelink",
        ["id"] = "id",
        ["bordercolor"] = "bordercolor",
        ["text"] = "text",
        ["style"] = "style",
        ["image"] = "image",
        ["dismiss"] = "Dismiss",
        ["comment"] = "comment",
        ["header"] = "header",
        ["imagewidth"] = "imagewidth",
        ["collapsed"] = "collapsed",
        ["class"] = "class"
    },
    ["de"] = {
        ["aside"] = "nebenbemerkung",
        ["type"] = "typ",
        ["bgcolor"] = "hintergrundfarbe",
        ["imagelink"] = "bildlink",
        ["id"] = "id",
        ["bordercolor"] = "randfarbe",
        ["text"] = "Text",
        ["style"] = "style",
        ["image"] = "bild",
        ["dismiss"] = "Verstecken",
        ["comment"] = "Kommentar",
        ["header"] = "Titel",
        ["imagewidth"] = "bildbreite",
        ["collapsed"] = "eingeklappt",
        ["class"] = "klasse"
    },
    ["hi"] = {
        ["aside"] = "अलग",
        ["type"] = "प्रकार",
        ["bgcolor"] = "bgcolor",
        ["imagelink"] = "imagelink",
        ["id"] = "id",
        ["bordercolor"] = "bordercolour",
        ["text"] = "टेक्स्ट",
        ["style"] = "स्टाइल",
        ["image"] = "चित्र",
        ["dismiss"] = "हटाएँ",
        ["comment"] = "टिप्पणी",
        ["header"] = "हैडर",
        ["imagewidth"] = "imagewidth",
        ["collapsed"] = "छोटा",
        ["class"] = "क्लास"
    },
    ["ja"] = {
        ["aside"] = "アサイド",
        ["type"] = "種類",
        ["bgcolor"] = "背景色",
        ["imagelink"] = "画像リンク",
        ["id"] = "ID",
        ["bordercolor"] = "境界線の色",
        ["text"] = "テキスト",
        ["style"] = "スタイル",
        ["image"] = "画像",
        ["dismiss"] = "後で見る",
        ["comment"] = "コメント",
        ["header"] = "ヘッダー",
        ["imagewidth"] = "画像の幅",
        ["collapsed"] = "折り畳む",
        ["class"] = "クラス"
    },
    ["pl"] = {
        ["aside"] = "aside",
        ["type"] = "typ",
        ["bgcolor"] = "tło",
        ["imagelink"] = "link obrazu",
        ["id"] = "id",
        ["bordercolor"] = "krawędź",
        ["text"] = "tekst",
        ["style"] = "style",
        ["image"] = "obraz",
        ["dismiss"] = "Odrzuć",
        ["comment"] = "komentarz",
        ["header"] = "nagłówek",
        ["imagewidth"] = "szerokość obrazu",
        ["collapsed"] = "zwinięty",
        ["class"] = "klasa"
    },
    ["pt-br"] = {
        ["aside"] = "de lado",
        ["type"] = "tipo",
        ["bgcolor"] = "bgcolor",
        ["imagelink"] = "link imagem",
        ["id"] = "id",
        ["bordercolor"] = "cor da borda",
        ["text"] = "texto",
        ["style"] = "estilo",
        ["image"] = "imagem",
        ["dismiss"] = "Dispensar",
        ["comment"] = "comentário",
        ["header"] = "cabeçalho",
        ["imagewidth"] = "largura da imagem",
        ["collapsed"] = "recolher",
        ["class"] = "class"
    },
    ["ru"] = {
        ["aside"] = "текст справа",
        ["type"] = "type",
        ["bgcolor"] = "bgcolor",
        ["imagelink"] = "ссылка в изображении",
        ["id"] = "id",
        ["bordercolor"] = "bordercolor",
        ["text"] = "текст",
        ["style"] = "style",
        ["image"] = "изображение",
        ["dismiss"] = "dismiss",
        ["comment"] = "дополнение",
        ["header"] = "заголовок",
        ["imagewidth"] = "ширина изображения",
        ["collapsed"] = "collapsed",
        ["class"] = "class"
    },
    ["tr"] = {
        ["aside"] = "kenar",
        ["type"] = "tür",
        ["bgcolor"] = "aprengi",
        ["imagelink"] = "resimbağlantısı",
        ["id"] = "kimlik",
        ["bordercolor"] = "kenarlıkrengi",
        ["text"] = "metin",
        ["style"] = "stil",
        ["image"] = "resim",
        ["dismiss"] = "Kapat",
        ["comment"] = "yorum",
        ["header"] = "başlık",
        ["imagewidth"] = "resimgenişliği",
        ["collapsed"] = "daratılmış",
        ["class"] = "sınıf"
    },
    ["vi"] = {
        ["aside"] = "phía bên",
        ["type"] = "loại",
        ["comment"] = "bình luận",
        ["imagelink"] = "liên kết ảnh",
        ["id"] = "id",
        ["text"] = "văn bản",
        ["class"] = "lớp",
        ["bordercolor"] = "màu viền",
        ["image"] = "hình ảnh",
        ["dismiss"] = "Bỏ qua",
        ["header"] = "tiêu đề",
        ["style"] = "phong cách",
        ["imagewidth"] = "độ rộng ảnh",
        ["collapsed"] = "đã đóng",
        ["bgcolor"] = "màu nền"
    },
    ["zh"] = {
        ["aside"] = "侧栏",
        ["type"] = "类型",
        ["bgcolor"] = "背景颜色",
        ["imagelink"] = "图像链接",
        ["id"] = "id",
        ["bordercolor"] = "边框颜色",
        ["text"] = "文字",
        ["style"] = "样式",
        ["image"] = "图像",
        ["dismiss"] = "关闭",
        ["comment"] = "备注",
        ["header"] = "标题",
        ["imagewidth"] = "图像宽度",
        ["collapsed"] = "折叠",
        ["class"] = "类"
    },
    ["zh-tw"] = {
        ["aside"] = "邊界",
        ["type"] = "類型",
        ["bgcolor"] = "背景色彩",
        ["imagelink"] = "圖片連結",
        ["id"] = "ID",
        ["bordercolor"] = "邊框色彩",
        ["text"] = "文字",
        ["style"] = "樣式",
        ["image"] = "圖片",
        ["dismiss"] = "忽略",
        ["comment"] = "評論",
        ["header"] = "標頭",
        ["imagewidth"] = "圖片長度",
        ["collapsed"] = "摺疊",
        ["class"] = "屬性"
    }
}
```

