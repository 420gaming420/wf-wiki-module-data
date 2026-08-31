---
title: "Module:ReleaseStatus/i18n"
wiki_url: "https://wiki.warframe.com/w/Module/ReleaseStatus/i18n"
wiki_timestamp: "2024-12-29T00:53:11Z"
---

## Warning!

[[edit source](/w/Template:I18n_module?action=edit&section=T-1 "Edit section's source code: Warning!")]

You are viewing a module with translations for the [ReleaseStatus](/w/Module:ReleaseStatus "Module:ReleaseStatus") module. **It is not advised to edit this page manually.** Instead, use the [translations editor](/w/Special:BlankPage/I18nEdit/Lua/ReleaseStatus "Special:BlankPage/I18nEdit/Lua/ReleaseStatus"). If there's something that has to be done that the translation editor cannot do or if the translation editor misbehaved please leave a message on [the I18nEdit talk page](https://dev.fandom.com/wiki/Talk:I18nEdit) about your issue.

Upon editing this page without the translations editor you will be stopped by [the abuse filter](/w/Special:AbuseFilter "Special:AbuseFilter").

[Open translations editor](/w/Special:BlankPage/I18nEdit/Lua/ReleaseStatus "Special:BlankPage/I18nEdit/Lua/ReleaseStatus")

---

```lua
-- 
return {
    ["_metadata"] = {
        ["order"] = {
            "archive",
            "awaiting",
            "beta",
            "blocked",
            "broken",
            "delete",
            "done",
            "experimental",
            "stable",
            "unmaintained",
            "unstable"
        }
    },
    ["en"] = {
        ["archive"] = "Archived",
        ["awaiting"] = "Awaiting",
        ["beta"] = "Beta",
        ["blocked"] = "Blocked",
        ["broken"] = "Broken",
        ["delete"] = "Delete",
        ["done"] = "Ready",
        ["experimental"] = "Experimental",
        ["stable"] = "Stable",
        ["unmaintained"] = "Unmaintained",
        ["unstable"] = "Unstable"
    },
    ["ar"] = {
        ["archive"] = "أرشفة",
        ["beta"] = "بيتا",
        ["experimental"] = "تجريبي",
        ["stable"] = "مستقر",
        ["unmaintained"] = "غير المشرف عليها",
        ["unstable"] = "غير مستقر"
    },
    ["be"] = {
        ["archive"] = "Архівавана",
        ["awaiting"] = "Пераносіцца",
        ["beta"] = "Бэта",
        ["blocked"] = "Заблакавана",
        ["delete"] = "Выдалена",
        ["done"] = "Сумяшчальна",
        ["experimental"] = "Эксперыментальны",
        ["stable"] = "Стабільны",
        ["unmaintained"] = "Не падтрымваецца",
        ["unstable"] = "Нестабільны"
    },
    ["de"] = {
        ["archive"] = "Archiviert",
        ["awaiting"] = "Ausstehend",
        ["beta"] = "Beta",
        ["blocked"] = "Blockiert",
        ["broken"] = "Kaputt",
        ["delete"] = "Löschen",
        ["done"] = "Bereit",
        ["experimental"] = "Experimentell",
        ["stable"] = "Stabil",
        ["unmaintained"] = "Nicht gewartet",
        ["unstable"] = "Instabil"
    },
    ["es"] = {
        ["archive"] = "Archivado",
        ["awaiting"] = "Esperando",
        ["beta"] = "Beta",
        ["blocked"] = "Bloqueado",
        ["delete"] = "Eliminar",
        ["done"] = "Listo",
        ["experimental"] = "Experimental",
        ["stable"] = "Estable",
        ["unmaintained"] = "Sin mantenimiento",
        ["unstable"] = "Inestable"
    },
    ["fr"] = {
        ["archive"] = "Archivé",
        ["awaiting"] = "En attente",
        ["beta"] = "Bêta",
        ["blocked"] = "Bloqué",
        ["broken"] = "Ne fonctionne pas",
        ["delete"] = "Supprimé",
        ["done"] = "Prêt",
        ["experimental"] = "Expérimental",
        ["stable"] = "Stable",
        ["unmaintained"] = "Non maintenu",
        ["unstable"] = "Instable"
    },
    ["hi"] = {
        ["archive"] = "संग्रहीत",
        ["awaiting"] = "जल्द होगा",
        ["beta"] = "बीटा",
        ["blocked"] = "ब्लॉक हो चुका है",
        ["broken"] = "टूटा हुआ",
        ["delete"] = "हटाया जाएगा",
        ["done"] = "तैयार",
        ["experimental"] = "प्रयोगात्मक",
        ["stable"] = "स्थिर",
        ["unmaintained"] = "अनानुरक्षित",
        ["unstable"] = "अस्थिर"
    },
    ["ja"] = {
        ["archive"] = "アーカイブ版",
        ["beta"] = "ベータ版",
        ["experimental"] = "開発版",
        ["stable"] = "安定版",
        ["unmaintained"] = "更新停止",
        ["unstable"] = "不安定版"
    },
    ["ko"] = {
        ["archive"] = "보존됨",
        ["beta"] = "베타",
        ["experimental"] = "시험판",
        ["stable"] = "안정됨",
        ["unmaintained"] = "관리 중단",
        ["unstable"] = "불안정함"
    },
    ["pl"] = {
        ["archive"] = "Archiwalny",
        ["beta"] = "Beta",
        ["experimental"] = "Eksperymentalny",
        ["stable"] = "Stabilny",
        ["unmaintained"] = "Niewspierany",
        ["unstable"] = "Niestabilny"
    },
    ["pt-br"] = {
        ["archive"] = "Arquivado",
        ["awaiting"] = "Aguardando",
        ["beta"] = "Beta",
        ["blocked"] = "Impedido",
        ["broken"] = "Quebrado",
        ["delete"] = "Excluir",
        ["done"] = "Pronto",
        ["experimental"] = "Experimental",
        ["stable"] = "Estável",
        ["unmaintained"] = "Sem manutenção",
        ["unstable"] = "Instável"
    },
    ["ru"] = {
        ["archive"] = "Архивировано",
        ["awaiting"] = "Переносится",
        ["beta"] = "Бета",
        ["blocked"] = "Заблокировано",
        ["broken"] = "Не работает",
        ["delete"] = "Удалено",
        ["done"] = "Совместимо",
        ["experimental"] = "Экспериментальный",
        ["stable"] = "Стабильный",
        ["unmaintained"] = "Не поддерживается",
        ["unstable"] = "Нестабильный"
    },
    ["th"] = {
        ["archive"] = "ถูกเก็บ",
        ["awaiting"] = "รอคอย",
        ["beta"] = "เบต้า",
        ["blocked"] = "บล็อก",
        ["broken"] = "พัง",
        ["delete"] = "โดนลบ",
        ["done"] = "ใช้งานได้",
        ["experimental"] = "ทดลอง",
        ["stable"] = "เสถียร",
        ["unmaintained"] = "ไม่บำรุงรักษา",
        ["unstable"] = "ไม่เสถียร"
    },
    ["tr"] = {
        ["archive"] = "Arşivlendi",
        ["awaiting"] = "Bekleniyor",
        ["beta"] = "Beta",
        ["blocked"] = "Engellendi",
        ["broken"] = "Bozuk",
        ["delete"] = "Sil",
        ["done"] = "Hazır",
        ["experimental"] = "Deneysel",
        ["stable"] = "Kararlı",
        ["unmaintained"] = "Bakımsız",
        ["unstable"] = "Kararsız"
    },
    ["uk"] = {
        ["archive"] = "Архівовано",
        ["awaiting"] = "Переноситься",
        ["beta"] = "Бета",
        ["blocked"] = "Заблоковано",
        ["broken"] = "Не працює",
        ["delete"] = "Вилучено",
        ["done"] = "Сумісно",
        ["experimental"] = "Експериментальний",
        ["stable"] = "Стабільний",
        ["unmaintained"] = "Не підтримується",
        ["unstable"] = "Нестабільний"
    },
    ["zh-hans"] = {
        ["archive"] = "存档",
        ["awaiting"] = "等待",
        ["beta"] = "测试",
        ["blocked"] = "受阻",
        ["broken"] = "损坏",
        ["delete"] = "删除",
        ["done"] = "就绪",
        ["experimental"] = "开发中",
        ["stable"] = "稳定",
        ["unmaintained"] = "不再维护",
        ["unstable"] = "不稳定"
    },
    ["zh-hant"] = {
        ["archive"] = "已存檔",
        ["beta"] = "測試",
        ["experimental"] = "開發",
        ["stable"] = "穩定",
        ["unmaintained"] = "已停止更新",
        ["unstable"] = "不穩定"
    }
}
--
```

