sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"fiorielementapplication/test/integration/pages/UsersList",
	"fiorielementapplication/test/integration/pages/UsersObjectPage"
], function (JourneyRunner, UsersList, UsersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('fiorielementapplication') + '/test/flpSandbox.html#fiorielementapplication-tile',
        pages: {
			onTheUsersList: UsersList,
			onTheUsersObjectPage: UsersObjectPage
        },
        async: true
    });

    return runner;
});

