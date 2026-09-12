WinX Studio Home Assistant Rainmeter widget

Files:
- HomeAssistantToggle.ini: Rainmeter skin widget.
- HomeAssistantService.ps1: local helper used to call the Home Assistant service.

Setup:
1. Copy this folder to your Rainmeter Skins folder.
2. Open HomeAssistantToggle.ini in Rainmeter.
3. Edit HAUrl, HAToken, HAEntity, HADomain, and HAService in [Variables].
4. Refresh the skin.
5. Click the widget to call the service. The displayed state is read from Home Assistant every 10 seconds.

Examples:
Light:
HAEntity=light.living_room
HADomain=light
HAService=toggle

Switch:
HAEntity=switch.coffee_machine
HADomain=switch
HAService=toggle

Security:
Do not publish HAToken. This prototype passes the token to PowerShell when the widget is clicked. For wider distribution, use a native Rainmeter plugin or a local authenticated bridge instead of storing a token in a skin file.

Rainmeter package note:
Use Rainmeter Manage > Create .rmskin package to create the official installable package. Do not rename a ZIP file to .rmskin.
