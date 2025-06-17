package com.sy.utils;

public class GoodsNoUtil {
    /**
     * 根据已有最大商品编号生成下一个商品编号
     * @param maxGNo 数据库中已有的最大商品编号（如 null 则生成初始编号）
     * @return 新的唯一商品编号
     */
    public static String createGoodsNo(String maxGNo, String gtNo) {
        if (maxGNo == null || maxGNo.isEmpty()) {
            // 生成初始编号：类型编号+000001
            return gtNo + "000001";
        }

        try {
            // 提取数字部分并递增
            String numericPart = maxGNo.substring(gtNo.length());
            int number = Integer.parseInt(numericPart);
            number++;

            // 格式化为固定长度（6位）
            String newNumericPart = String.format("%06d", number);
            return gtNo + newNumericPart;
        } catch (Exception e) {
            // 处理格式异常，默认生成类型编号+000001
            e.printStackTrace();
            return gtNo + "000001";
        }
    }
}