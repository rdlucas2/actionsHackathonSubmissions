# Register Azure IoT Edge Device

This action Registers a new IoT Edge Device on a given Azure IoT Hub.

## Inputs

### `azure-sp-client-id`

**Required** Azure Service Principal Client ID.

### `azure-sp-password`

**Required** Azure Service Principal Password.

### `azure-tenant-id`

**Required** Azure Tenant ID.

### `azure-iot-hub-name`

**Required** Azure IoT Hub Name.

### `device-list-file-path`

**Required** Device List File Path.

## Outputs

None

## Example usage

```
uses: rdlucas2/actionsHackathonSubmissions@v0.0.1

with:
  azure-sp-client-id: '${{ secrets.AZ_SP_CLIENTID }}'
  azure-sp-password: '${{ secrets.AZ_SP_PASSWORD }}'
  azure-tenant-id: '${{ secrets.AZ_TENANT }}'
  azure-iot-hub-name: 'MyExistingHubName'
  device-list-file-path: '/devices/list.txt'
```