//
//  Strings.swift
//  UBAuthFlow
//
//  Created by Tulio Parreiras on 20/05/19.
//  Copyright (c) 2019 Usemobile. All rights reserved.
//

import Foundation

extension String {
    
    static var share: String {
        switch currentLanguage {
        case .en:
            return "Share"
        case .pt:
            return "Compartilhe"
        case .es:
            return "Comparte"
        }
    }
    
    static var theAppWithYourFriends: String {
        switch currentLanguage {
        case .en:
            return " the app with your frieds using your indication code :)"
        case .pt:
            return " o app com seus amigos através do seu código de indicação :)"
        case .es:
            return " la aplicación con tus amigos a través de su código de referencia :)"
        }
    }
    
    static var shareAction: String {
        switch currentLanguage {
        case .en:
            return "Share"
        case .pt:
            return "Compartilhar"
        case .es:
            return "Compartir"
        }
    }
    
    static var invites: String {
        switch currentLanguage {
        case .en:
            return "Invites"
        case .pt:
            return "Convites"
        case .es:
            return "Invitationes"
        }
    }
    
    static var confirmed: String {
        switch currentLanguage {
        case .en:
            return "confirmed"
        case .pt:
            return "confirmado"
        case .es:
            return "confirmado"
        }
    }
    
    static var indicationCode: String {
        switch currentLanguage {
        case .en:
            return "Indication code"
        case .pt:
            return "Código de indicação"
        case .es:
            return "Cupones y descuentos"
        }
    }
    
    static var editYourIndicationCode: String {
        switch currentLanguage {
        case .en:
            return "Edit your indication code bellow:"
        case .pt:
            return "Edite seu código de indicação abaixo:"
        case .es:
            return "Edite su cógio de referencia abajo"
        }
    }
    
    static var cancel: String {
        switch currentLanguage {
        case .en:
            return "Cancelar"
        case .pt:
            return "Cancel"
        case .es:
            return "Cancel"
        }
    }
    
    static var save: String {
        switch currentLanguage {
        case .en:
            return "Save"
        case .pt:
            return "Salvar"
        case .es:
            return "Guardar"
        }
    }
    
    static var model: String {
        switch currentLanguage {
        case .en:
            return ""
        case .pt:
            return ""
        case .es:
            return ""
        }
    }

}
