import request from '@/utils/request'

// 查询设备列表
export function listDev(query) {
  return request({
    url: '/energy/device/list',
    method: 'get',
    params: query
  })
}

// 查询设备详细
export function getDev(devId) {
  return request({
    url: '/energy/device/' + devId,
    method: 'get'
  })
}

// 新增设备
export function addDev(data) {
  return request({
    url: '/energy/device/create',
    method: 'post',
    data: data
  })
}

// 修改设备
export function updateDev(data) {
  return request({
    url: '/energy/device/update',
    method: 'post',
    data: data
  })
}

// 删除设备
export function delDev(devId) {
  return request({
    url: '/energy/device/delete?devId=' + devId,
    method: 'post'
  })
}

// 查询设备状态
export function statusDev(devIds) {
  return request({
    url: '/energy/device/status?deviceIds=' + devIds,
    method: 'get'
  })
}