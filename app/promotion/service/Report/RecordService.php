<?php 
/*
 module:		统计报表
 create_time:	2021-01-02 14:49:20
 author:		
 contact:		
*/

namespace app\promotion\service\Report;
use app\promotion\model\Report\Record;
use think\exception\ValidateException;
use xhadmin\CommonService;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class RecordService extends CommonService {


	/*
 	* @Description  添加
 	*/
	public static function add($data){
		try{
			validate(\app\promotion\validate\Report\Record::class)->scene('add')->check($data);
			$data['create_time'] = strtotime($data['create_time']);
			$data['str_ip'] = request()->ip();
			$res = Record::create($data);
		}catch(ValidateException $e){
			throw new ValidateException ($e->getError());
		}catch(\Exception $e){
			abort(config('my.error_log_code'),$e->getMessage());
		}
		if(!$res){
			throw new ValidateException ('操作失败');
		}
		return $res->id;
	}


	/*
 	* @Description  修改
 	*/
	public static function update($data){
		try{
			validate(\app\promotion\validate\Report\Record::class)->scene('update')->check($data);
			$data['create_time'] = strtotime($data['create_time']);
			$res = Record::update($data);
		}catch(ValidateException $e){
			throw new ValidateException ($e->getError());
		}catch(\Exception $e){
			abort(config('my.error_log_code'),$e->getMessage());
		}
		if(!$res){
			throw new ValidateException ('操作失败');
		}
		return $res;
	}


	/*
 	* @Description  导出
 	* @param (输入参数：)  {array}        where 删除条件
 	* @return (返回参数：) {bool}        
 	*/
	public static function dumpData($list){
		ob_clean();
		try{
			$spreadsheet = new Spreadsheet();
			$sheet = $spreadsheet->getActiveSheet();
			//excel表头
			$sheet->setCellValue('A1','编号');
			$sheet->setCellValue('B1','用户姓名');
			$sheet->setCellValue('C1','软件名称');
			$sheet->setCellValue('D1','手机号');
			$sheet->setCellValue('E1','创建时间');
			$sheet->setCellValue('F1','UA标签');
			$sheet->setCellValue('G1','IP地址');

			//excel表内容
			foreach($list as $k=>$v){
				$sheet->setCellValue('A'.($k+2),$v['id']);
				$sheet->setCellValue('B'.($k+2),$v['user']);
				$sheet->setCellValue('C'.($k+2),$v['soft']);
				$sheet->setCellValue('D'.($k+2),$v['mobile']);
				$v['create_time'] = !empty($v['create_time']) ? date('Y-m-d H:i:s',$v['create_time']) : '';
				$sheet->setCellValue('E'.($k+2),$v['create_time']);
				$sheet->setCellValue('F'.($k+2),$v['str_ua']);
				$sheet->setCellValue('G'.($k+2),$v['str_ip']);
			}
			
			$filename = date('YmdHis');
			header('Content-Type: application/vnd.ms-excel');
			header('Content-Disposition: attachment;filename='.$filename.'.'.config('my.import_type')); 
			header('Cache-Control: max-age=0');
			$writer = new Xlsx($spreadsheet); 
			$writer->save('php://output');
			exit;
		}catch(\Exception $e){
			throw new \Exception($e->getMessage());
		}
	}


}

