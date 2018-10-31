package org.apache.hadoop.hive.ql;


import org.apache.hadoop.hive.ql.parse.ASTNode;
import org.apache.hadoop.hive.ql.parse.ParseDriver;
import org.junit.Test;

/**
 * Created by 2pc on 2018/10/30.
 */
public class MyHiveParseTest {

    @Test
    public  void testParse(){

        ParseDriver pd = new ParseDriver();

        String ps= "select t1.c1,t1.c2,t2.c1 from table1 t1 left join table2 t2 on t1.id = t2.id where t1.age > 20";
        ASTNode ast =null;
        try {
            ast = pd.parse(ps);

        }catch (Exception e){

        }


        String strTree = ast.toStringTree();

        System.out.println(strTree);


    }


}
