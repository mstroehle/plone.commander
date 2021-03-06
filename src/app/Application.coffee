Ext.define 'App.Application',
    extend: 'Ext.app.Application'

    name: 'App'

    requires: [
        "App.services.AppConfig"
        "App.lib.Proxy"
        "App.services.UserService"

        "App.model.*"
        "App.store.*"
        "App.controller.*"
        "App.view.*"

        "App.controller.Main"
        "App.store.PloneTree"
        "App.store.Search"
        "App.store.Settings"
        "App.model.Collection"
        "App.model.Document"
        "App.model.File"
        "App.model.Folder"
        "App.model.Image"
        "App.model.Node"
        "App.model.Setting"
        "App.model.User"
        "App.model.PloneSite"
    ]

    controllers: [
        "Main"
    ]

    stores: [
        "PloneTree"
        "Search"
        "Settings"
    ]

    models: [
        "Collection"
        "Document"
        "File"
        "Folder"
        "Image"
        "Node"
        "Setting"
        "User"
        "PloneSite"
    ]

    launch: ->
        console.debug "°°° App::launch"

        # XXX develop only
        window.searchstore = Ext.StoreManager.get "Search"
        window.treestore = Ext.StoreManager.get "PloneTree"

    onAppUpdate: ->
        Ext.Msg.confirm 'Application Update', 'This application has an update, reload?', (choice) ->
            if choice == 'yes'
                window.location.reload()
            return
        return
