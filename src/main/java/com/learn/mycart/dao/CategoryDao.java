package com.learn.mycart.dao;

import com.learn.mycart.entities.Category;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {
    private SessionFactory sessionFactory;
    
    public CategoryDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public int saveCategory(Category category){
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        int catId = (int) session.save(category);
        tx.commit();
        session.close();
        return catId;
    }
    
    public List<Category> getCategories(){
        Session session = this.sessionFactory.openSession();
        Query query = session.createQuery("from Category");
        List<Category> list = query.list();
        return list;
    }
    
    public Category getCategoryById(int cid){
        Category category = null;
        try {
            Session session = this.sessionFactory.openSession();
            category = session.get(Category.class, cid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return category;
    }
    
}
