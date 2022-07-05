import request from '@/utils/request'

// 查询机构列表
export function listOrg(query) {
  return request({
    url: '/system/org/list',
    method: 'get',
    params: query
  })
}

// 查询机构详细
export function getOrg(orgId) {
  return request({
    url: '/system/org/' + orgId,
    method: 'get'
  })
}

// 新增机构
export function addOrg(data) {
  return request({
    url: '/system/org/add',
    method: 'post',
    data: data
  })
}

// 修改机构
export function updateOrg(data) {
  return request({
    url: '/system/org',
    method: 'post',
    data: data
  })
}

// 删除机构
export function delOrg(orgId) {
  return request({
    url: '/system/org/' + orgId,
    method: 'post'
  })
}
