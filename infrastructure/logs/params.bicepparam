using './main.bicep'

// Required parameters
param name = 'logfantastic001'
// Non-required parameters
param dailyQuotaGb = 10
param dataSources = [
  {
    eventLogName: 'Application'
    eventTypes: [
      {
        eventType: 'Error'
      }
      {
        eventType: 'Warning'
      }
      {
        eventType: 'Information'
      }
    ]
    kind: 'WindowsEvent'
    name: 'applicationEvent'
  }
  {
    counterName: '% Processor Time'
    instanceName: '*'
    intervalSeconds: 60
    kind: 'WindowsPerformanceCounter'
    name: 'windowsPerfCounter1'
    objectName: 'Processor'
  }
  {
    kind: 'IISLogs'
    name: 'sampleIISLog1'
    state: 'OnPremiseEnabled'
  }
  {
    kind: 'LinuxSyslog'
    name: 'sampleSyslog1'
    syslogName: 'kern'
    syslogSeverities: [
      {
        severity: 'emerg'
      }
      {
        severity: 'alert'
      }
      {
        severity: 'crit'
      }
      {
        severity: 'err'
      }
      {
        severity: 'warning'
      }
    ]
  }
  {
    kind: 'LinuxSyslogCollection'
    name: 'sampleSyslogCollection1'
    state: 'Enabled'
  }
  {
    instanceName: '*'
    intervalSeconds: 10
    kind: 'LinuxPerformanceObject'
    name: 'sampleLinuxPerf1'
    objectName: 'Logical Disk'
    syslogSeverities: [
      {
        counterName: '% Used Inodes'
      }
      {
        counterName: 'Free Megabytes'
      }
      {
        counterName: '% Used Space'
      }
      {
        counterName: 'Disk Transfers/sec'
      }
      {
        counterName: 'Disk Reads/sec'
      }
      {
        counterName: 'Disk Writes/sec'
      }
    ]
  }
  {
    kind: 'LinuxPerformanceCollection'
    name: 'sampleLinuxPerfCollection1'
    state: 'Enabled'
  }
]
param features = {
    values: {
        enableLogAccessUsingOnlyResourcePermissions: true
    }
}
param linkedStorageAccounts = [
  {
    name: 'Query'
    storageAccountIds: [
      '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourceGroups/rg-web/providers/Microsoft.Storage/storageAccounts/salogworksp001'
    ]
  }
]
param location = 'australiaeast'
param publicNetworkAccessForIngestion = 'Disabled'
param publicNetworkAccessForQuery = 'Disabled'
param tags = {
  Environment: 'Non-Prod'
  'hidden-title': 'This is visible in the resource name'
  Role: 'DeploymentValidation'
}
