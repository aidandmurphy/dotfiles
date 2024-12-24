import { App } from "astal/gtk3"
import style from "./style.scss"
import Taskbar from "./widget/Taskbar/Taskbar"
import AppMenu from "./widget/AppMenu/AppMenu"

App.start({
    css: style,
    main() {
        App.get_monitors().map(Taskbar)
    },
})

App.start({
    instanceName: "launcher",
    css: style,
    main: AppMenu,
})
