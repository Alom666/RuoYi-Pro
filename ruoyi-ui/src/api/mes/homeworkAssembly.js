
import request from '@/utils/request'

// 查询作业装配列表
export function listHomeworkAssembly(query) {
  return request({
    url: '/mes/HomeworkAssembly/list',
    method: 'get',
    params: query
  })
}

// 查询作业装配详细
export function getHomeworkAssembly(assemblyId) {
  return request({
    url: '/mes/HomeworkAssembly/' + assemblyId,
    method: 'get'
  })
}

// 新增作业装配
export function addHomeworkAssembly(data) {
  return request({
    url: '/mes/HomeworkAssembly',
    method: 'post',
    data: data
  })
}

// 修改作业装配
export function updateHomeworkAssembly(data) {
  return request({
    url: '/mes/HomeworkAssembly',
    method: 'put',
    data: data
  })
}

// 删除作业装配
export function delHomeworkAssembly(assemblyId) {
  return request({
    url: '/mes/HomeworkAssembly/' + assemblyId,
    method: 'delete'
  })
}

// 导出作业装配
export function exportHomeworkAssembly(query) {
  return request({
    url: '/mes/HomeworkAssembly/export',
    method: 'post',
    params: query
  })
}
