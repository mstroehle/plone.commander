Ext.define 'App.view.main.Main',
    extend: 'Ext.tab.Panel'
    xtype: 'app-main'

    requires: [
        'Ext.plugin.Viewport'
        'Ext.panel.Panel'
        'Ext.tree.Panel'
        'Ext.window.MessageBox'
        'Ext.ux.statusbar.StatusBar'

        'App.view.main.MainController'
        'App.view.main.MainModel'
        'App.view.main.List'

        'App.view.search.SearchController'
        'App.view.search.Search'

        "App.view.tree.TreeController"
        "App.view.tree.Tree"

        'App.view.settings.SettingsController'
        'App.view.settings.Settings'

        "App.view.login.LoginController"
        "App.view.login.Login"

        "App.view.statusbar.StatusBar"
    ]

    controller: 'main'
    viewModel: 'main'
    ui: 'navigation'
    tabBarHeaderPosition: 1
    titleRotation: 0
    tabRotation: 0

    initComponent: ->
        console.debug "*** Main::initComponent"
        window.tabpanel = @
        @callParent arguments


    header:
        layout:
            align: 'stretchmax'
        title:
            bind:
                text: """Plone <br/> Commander<br/>
                    <span id="username" style="font-size:10px">
                        <span class="fa fa-arrow-circle-o-right"></span>
                        {username}
                    </span>
                """
            flex: 0
        iconCls: 'fa-space-shuttle'

    tabBar:
        flex: 1
        layout:
            align: 'stretch'
            # display scroller for the tab menu if the window size is too small
            overflowHandler: 'scroller'

    responsiveConfig:
        tall: headerPosition: 'top'
        wide: headerPosition: 'left'

    defaults:
        bodyPadding: 20
        tabConfig:
            plugins: 'responsive'
            responsiveConfig:
                wide:
                    iconAlign: 'left'
                    textAlign: 'left'
                tall:
                    iconAlign: 'top'
                    textAlign: 'center'
                    width: 120

    config:
        fullscreen: yes

    bbar: [
        xtype: "app-statusbar"
        width: "100%"
        border: "1 0 0 0"
    ]

    items: [
        title: 'Search'
        iconCls: 'fa-search'
        layout:
            type: "vbox"
            align: "stretch"
        items: [
            reference: 'mainlist'
            xtype: 'mainlist'
            flex: 1
        ]
    ,
        title: 'Explorer'
        iconCls: 'fa-sitemap'
        itemId: 'explorer'
        layout:
            type: "vbox"
            align: "stretch"
        items: [
            reference: 'tree'
            xtype: "tree"
            flex: 1
        ]
    ,
        title: 'Settings'
        iconCls: 'fa-cog'
        items: [
            xtype: 'settings'
        ]
    ,
        title: 'Login'
        iconCls: 'fa-users'
        items: [
            xtype: 'login'
        ]
    ]
