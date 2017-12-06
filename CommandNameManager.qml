import QtQuick 2.0

Item {

    function getRandom()
    {
        var count = names.length;
        var index = Math.floor( Math.random() * count)
        console.debug(index, count)
        return names[index]
    }

    property var names: [
        "Танчики",
        "Кабанчики",
        "Тимон и пумба",
        "Эрудиты",
        "Эйнштейны",

        "Электроники"
    ]

}
