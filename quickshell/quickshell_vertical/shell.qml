//@ pragma Env QS_NO_RELOAD_POPUP=1

import "./bar"
import Quickshell

ShellRoot {
    LazyLoader { active: true; component: Bar {} }
}
