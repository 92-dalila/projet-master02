/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author dalila
 */
@Repository
public class HelloDAOImpl implements HelloDAO {

    @PersistenceContext(unitName = "HelloPU")
    private EntityManager em;

    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }

    public void save(HelloEntity h) {
        h = em.merge(h);
        em.persist(h);
    }

    @Override
    public void update(HelloEntity h) {
        em.merge(h);
    }

    @Transactional
    @Override
    public void delete(HelloEntity h) {
        h = em.merge(h);
        em.remove(h);
    }

    @Transactional(readOnly = true)
    @Override
    public HelloEntity find(long id) {
        return em.find(HelloEntity.class, id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<HelloEntity> findAll() {
        Query q = em.createQuery("SELECT h FROM HelloEntity h");
        return q.getResultList();
    }

    
    public List<HelloEntity> findByName(String nom) {
        Query q = em.createQuery("SELECT h FROM HelloEntity h WHERE h.nom =?").setParameter(1, nom);
        return q.getResultList();
    }
    
    
    @Transactional(readOnly = true)
    public List<HelloEntity> findByName(HelloEntity h, String nom) {
         Query q = em.createQuery("SELECT h FROM HelloEntity h WHERE h.nom =?").setParameter(1, nom);
        return q.getResultList();
    }

}
