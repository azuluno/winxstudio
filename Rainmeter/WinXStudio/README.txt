WinX Studio Home Assistant Rainmeter widget

Files:
- HomeAssistantToggle.ini: Rainmeter skin widget.
- HomeAssistantService.ps1: local helper used to call the Home Assistant service.

The tile layout is intentional: the icon is placed on the left, the title is
near the upper-left with spacing, the entity/domain label is below it, and the
live state is aligned to the bottom-right. The icon uses the explicit Material
Symbols lightbulb glyph rather than the literal word "lightbulb".

Setup:
1. Copy this folder to your Rainmeter Skins folder.
2. Open HomeAssistantToggle.ini in Rainmeter.
3. Edit HAUrl, HAToken, HAEntity, HADomain, and HAService in [Variables].
4. Refresh the skin.
5. Click the widget to call the service. The displayed state is read from Home Assistant every 10 seconds and the icon/state color updates for an `on` response.

Troubleshooting toggle clicks:
- Confirm the Rainmeter RunCommand plugin is installed and enabled.
- Confirm Windows PowerShell can run scripts on this machine.
- Test the exact values with `HomeAssistantService.ps1` if the state reads but clicks do not toggle.
- Check `Rainmeter.log` for RunCommand or PowerShell errors.

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
