<div align="center">

# AXOutliner 🔍♿

## Project Description 🎨

"AXOutliner" is a macOS app built with Objective-C and AppKit that combines a VoiceOver-first outliner with a built-in accessibility inspector. Instead of treating accessibility as an afterthought, AXOutliner makes it the product's defining feature — every screen is navigable by keyboard and VoiceOver, and the built-in "AX-Ray" panel can inspect the accessibility tree of any running application on the system.

The app uses Apple's C-based Accessibility API (`AXUIElement`, `AXObserver`) alongside AppKit's `NSAccessibility` protocol stack to support real-time cross-process inspection, automated accessibility auditing, and Objective-C runtime introspection — while itself serving as an example of what excellent VoiceOver support looks like in practice.

## Highlights 💫
<div align="left">

### Outliner Architecture (Protocol-Driven) 🏗️
- **Delegate and data source protocols** decouple the data model from AppKit views, following Cocoa's native patterns for `NSOutlineView` and `NSTableView`.
- **`NSCoding` persistence** with `NSKeyedArchiver` for a fully serializable recursive tree structure with parent-child relationships.

### AX-Ray Inspector 🔬
- **Cross-process accessibility inspection** via the C-based `AXUIElement` API — queries the accessibility tree of any running application in real time.
- **`AXObserver` integration** with `CFRunLoop` provides live focus tracking and element change notifications from target applications.
- **Action triggering** via `AXUIElementPerformAction` allows programmatic interaction with any accessible element in any app.

### VoiceOver-First Design ♿
- **Full keyboard and VoiceOver navigability** across every screen — sidebar, item list, detail pane, inspector panel, and custom controls.
- **`NSAccessibilityPostNotification`** keeps VoiceOver in sync with all dynamic content changes, selection updates, and layout transitions.
- **Custom accessible control** (priority picker) built from scratch with correct `NSAccessibilityRadioGroupRole` conformance, child elements, and keyboard navigation.

### Accessibility Audit Engine 🛡️
- **Protocol-based rule system** (`AXOAuditRule`) provides extensible, pluggable accessibility checks against any application's AX tree.
- **Self-inspection loop** — the app audits its own accessibility tree using the same engine it uses on third-party apps.

### Objective-C Runtime Introspection 🧬
- **`objc/runtime.h` integration** inspects class hierarchies and discovers which accessibility methods a target app's classes implement at runtime.
- **`NSSpeechSynthesizer`** mimics VoiceOver's spoken output — constructing announcements from role, label, and value attributes in the correct priority order.

### Core Foundation Memory Discipline 🔩
- **Correct `CF`/`NS` bridging** throughout the inspector layer — explicit `__bridge`, `__bridge_transfer`, and `__bridge_retained` casts with manual `CFRelease` for all `AXUIElement` objects.
- **Zero leaks verified** with Instruments profiling across full inspection sessions.

</div>

## Screenshots

<div style="display: flex; justify-content: center; align-items: center;">
    <kbd>
        <img src="https://github.com/user-attachments/assets/placeholder" alt="Outliner-Sidebar" width="280">
    </kbd>
    <kbd>
        <img src="https://github.com/user-attachments/assets/placeholder" alt="AX-Ray-Inspector" width="280">
    </kbd>
    <kbd>
        <img src="https://github.com/user-attachments/assets/placeholder" alt="Audit-Results" width="280">
    </kbd>
</div>

<div style="display: flex; justify-content: center; align-items: center;">
    <kbd>
        <img src="https://github.com/user-attachments/assets/placeholder" alt="VoiceOver-Navigation" width="280">
    </kbd>
    <kbd>
        <img src="https://github.com/user-attachments/assets/placeholder" alt="Custom-Priority-Picker" width="280">
    </kbd>
    <kbd>
        <img src="https://github.com/user-attachments/assets/placeholder" alt="Runtime-Inspector" width="280">
    </kbd>
</div>

## Technologies Used 💻

This project uses Objective-C, AppKit, and Apple's C-based Accessibility API to demonstrate macOS systems-level development and deep accessibility expertise.

**Language & Frameworks**
- [x] Objective-C
- [x] AppKit
- [x] Foundation
- [x] ApplicationServices (Accessibility API)

**Accessibility — Producing (Own UI)**
- [x] NSAccessibility Protocol (Roles, Labels, Descriptions, Help Text)
- [x] NSAccessibilityPostNotification (Dynamic Content Announcements)
- [x] Custom Accessible Controls (NSAccessibilityRadioGroupRole)
- [x] Full Keyboard Navigation (Responder Chain, Key Equivalents)
- [x] Rotor-Style Filtered Navigation

**Accessibility — Consuming (Inspecting Other Apps)**
- [x] AXUIElement (Cross-Process Tree Queries)
- [x] AXObserver + CFRunLoop (Live Focus Tracking)
- [x] AXUIElementPerformAction (Remote Action Triggering)
- [x] AXUIElementCopyAttributeValue (Attribute Extraction)

**AppKit UI**
- [x] NSOutlineView (Sidebar + Inspector Tree)
- [x] NSTableView (Item List + Audit Results)
- [x] NSTextView + NSTextStorage (Detail Pane)
- [x] NSSplitViewController (Multi-Pane Layout)
- [x] NSToolbar + NSMenu (Toolbar, Menus, Keyboard Shortcuts)
- [x] Drag and Drop (NSPasteboard, UTI)

**Core Foundation & Memory**
- [x] CFTypeRef / AXUIElementRef (Manual CF Memory Management)
- [x] \_\_bridge / \_\_bridge\_transfer / \_\_bridge\_retained Casts
- [x] CFRelease Discipline (Verified with Instruments)

**Objective-C Runtime**
- [x] objc/runtime.h (class\_copyMethodList, class\_getSuperclass)
- [x] Dynamic Method Discovery (Accessibility Method Inspection)

**Speech**
- [x] NSSpeechSynthesizer (Element Announcement)

**Persistence**
- [x] NSCoding (NSKeyedArchiver / NSKeyedUnarchiver)

**Profiling**
- [x] Instruments (Leaks, Allocations, Time Profiler)

## Skills Demonstrated 🥋

This project is designed to showcase the specific engineering skills relevant to Apple's VoiceOver accessibility team:

- [x] **OBJECTIVE-C FLUENCY**: Idiomatic Cocoa code — protocols, delegates, categories, `NS_ENUM`, `@property` memory semantics, `alloc`/`init` patterns, and correct naming conventions.
- [x] **CORE FOUNDATION**: Comfortable in CF-land — manual `CFRelease`, correct bridging casts, `CFRunLoop` integration, pointer-to-pointer parameters, and C function pointer callbacks.
- [x] **ACCESSIBILITY PRODUCTION**: Building UI that is excellent with VoiceOver — not just labeled, but structurally correct with proper hierarchy, roles, notifications, and keyboard navigation.
- [x] **ACCESSIBILITY INSPECTION**: Using the same C-based `AXUIElement` API that VoiceOver uses internally to query, traverse, and interact with other applications' UI.
- [x] **APPKIT DEPTH**: `NSOutlineView`, `NSTableView`, `NSSplitViewController`, responder chain, drag and drop, toolbar, menus — the full AppKit toolkit.
- [x] **RUNTIME KNOWLEDGE**: `objc/runtime.h` introspection to discover class hierarchies and method implementations dynamically.
- [x] **AUDIT & QUALITY**: Protocol-based accessibility rule system that identifies real defects in production apps.
- [x] **MEMORY DISCIPLINE**: Zero-leak CF memory management verified with Instruments across full inspection sessions.

## Architecture 🏛️

```
┌─────────────────────────────────────────────────────────┐
│                     AXOutliner                          │
├──────────────┬──────────────┬───────────────────────────┤
│   Models     │   AppKit UI  │   AX Inspector            │
│              │              │                           │
│ AXOOutlineItem│ Sidebar      │ AXOElementNode            │
│ AXODataStore │ Item List    │ AXOInspectorViewController│
│ NSCoding     │ Detail Pane  │ AXObserver + CFRunLoop    │
│              │ Custom Ctrls │ Action Triggering         │
├──────────────┴──────────────┴───────────────────────────┤
│                    Audit Engine                         │
│                                                         │
│  AXOAuditRule Protocol → MissingLabel, EmptyButton,    │
│  BrokenHierarchy, UnlabeledImage, MissingAction        │
├─────────────────────────────────────────────────────────┤
│                 Runtime Introspection                   │
│                                                         │
│  objc/runtime.h → Class Hierarchy, Method Discovery    │
│  NSSpeechSynthesizer → Element Announcements           │
└─────────────────────────────────────────────────────────┘
```

| Layer | Technology | What It Proves |
|---|---|---|
| Data Model | Objective-C classes, `NSCoding`, `NSKeyedArchiver` | Clean Objective-C data type design |
| AppKit UI | `NSOutlineView`, `NSTableView`, `NSTextView`, `NSToolbar` | Standard macOS interface development |
| AX Inspector | `AXUIElement` C API, `AXObserver`, `CFRunLoop` | CF-land fluency and inter-process AX |
| Custom Accessibility | `NSAccessibilityProtocol`, notifications, custom controls | VoiceOver-excellent UI authoring |
| Audit Engine | Protocol-oriented rule system | Accessibility defect identification |
| Runtime Layer | `objc/runtime.h`, `class_copyMethodList` | Objective-C at the metal |
| Speech | `NSSpeechSynthesizer` | VoiceOver output construction |

## Building & Running 🔨

**Setup:**
```bash
git clone https://github.com/yourusername/axoutliner.git
cd axoutliner
open AXOutliner.xcodeproj
```

Build and run (`⌘R`). On first launch, the app will prompt you to grant accessibility trust — this is required for the AX-Ray inspector to query other applications.

**Using VoiceOver:**
Press `⌘F5` to enable VoiceOver, then navigate the app entirely with keyboard. This is the intended primary interaction mode.

## Contributing ⚙️

Contributions are welcome. If you have ideas for new audit rules, accessibility improvements, or inspector features, open an issue or submit a pull request. Please ensure all contributions maintain full VoiceOver navigability — every new control must have correct roles, labels, and keyboard access.

## License 🪪

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

</div>
