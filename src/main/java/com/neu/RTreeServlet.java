package com.neu;

import spatialindex.spatialindex.Point;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class RTreeServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        try
        {
            long time = 1417401382;
            double lng = Double.parseDouble(req.getParameter("lng"));
            double lat = Double.parseDouble(req.getParameter("lat"));
            System.out.println(lng + ":" + lat);
            String realIndexPath = req.getSession().getServletContext().getRealPath("tree");//索引文件绝对路径
            String realDataPath = req.getSession().getServletContext().getRealPath("data.csv");//原始数据绝对路径
            //将查询结果返回
            PrintWriter out = resp.getWriter();
            out.print(BuildTree.getData(realIndexPath, realDataPath, new Point(new double[]{time, lng, lat})));

        }catch (NumberFormatException e)
        {
            e.printStackTrace();
        }

    }
}
