// Copyright © 2022 Ni Fu. All rights reserved.

import Foundation

///
/// The User Defaults keys.
///
enum UDKey: String {
    
    ///
    /// Is the User Defaults values already initialized.
    ///
    case isInitialized = "is_initialized"
    
    ///
    /// The message written in the text editor.
    ///
    case message = "message"
    
    ///
    /// The font size in the setting.
    ///
    case fontSize = "font_size"
    
    ///
    /// The font weight in the setting.
    ///
    case fontWeight = "font_weight"
    
    ///
    /// The font design in the setting.
    ///
    case fontDesign = "font_design"
    
    ///
    /// The text alignment selection in the setting.
    ///
    case textAlignment = "text_alignment"
    
    ///
    /// Is the auto-correction function enabled in the setting.
    ///
    case isAutocorrectionEnabed = "is_autocorrection_enabled"
    
    ///
    /// Is the  hide-status-bar mode enabled in the setting.
    ///
    case hideStatusBar = "hide_status_bar"
    
    ///
    /// Is the single mode enabled in the setting.
    ///
    case isSingleMode = "is_single_mode"
}
