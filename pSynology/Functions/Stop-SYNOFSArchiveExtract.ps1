﻿function Stop-SYNOFSArchiveExtract {
	<#
	.SYNOPSIS
	Stop an extract task

	.DESCRIPTION
	Invokes the "stop" method of SYNO.FileStation.Extract

	.PARAMETER taskid
	Unique ID of the task

	.EXAMPLE
	Stop-SYNOFSArchiveExtract taskid 5CDC455CE78D0CF0

	Stop extract task with id 5CDC455CE78D0CF0

	.NOTES
	Author: Pete Maan
 	Twitter: @_psPete
	GitHub: https://github.com/pspete
	#>

	[CmdletBinding(SupportsShouldProcess)]
	param(

		[parameter(
			Mandatory = $true,
			ValueFromPipelineByPropertyName = $true
		)]
		[string]$taskid

	)

	BEGIN {

		$Parameters = @{
			api     = "SYNO.FileStation.Extract"
			method  = "stop"
			version = "2"
		}

		$WebAPIPath = "/webapi/entry.cgi?"

	}#begin

	PROCESS {

		$Parameters = $Parameters + $PSBoundParameters

		#Construct Request URI
		$URI = $URL + $WebAPIPath + "$($Parameters | Get-Parameter)"

		if ($PSCmdlet.ShouldProcess($($Parameters["api"]), "Invoke Method: '$($Parameters["method"])'")) {

			#Send Request
			$Response = Invoke-Request -Uri $URI -Method GET -WebSession $ThisSession

			If ($Response) {
				$Response
			}

		}

	}#process

	END { }#end

}