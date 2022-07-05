import request from '@/utils/request'

// 查询项目列表
export function listPro(query) {
  return request({
    url: '/energy/project/list',
    method: 'get',
    params: query
  })
}

// 查询项目详细
export function getPro(proId) {
  return request({
    url: '/energy/project/' + proId,
    method: 'get'
  })
}

// 新增项目
export function addPro(data) {
  return request({
    url: '/energy/project/create',
    method: 'post',
    data: data
  })
}

// 修改项目
export function updatePro(data) {
  return request({
    url: '/energy/project/update',
    method: 'post',
    data: data
  })
}

// 删除项目
export function delPro(proId) {
  return request({
    url: '/energy/project/delete?projectId=' + proId,
    method: 'post'
  })
}