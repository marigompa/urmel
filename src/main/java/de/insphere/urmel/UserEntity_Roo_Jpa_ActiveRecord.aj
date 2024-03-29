// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.insphere.urmel;

import de.insphere.urmel.UserEntity;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserEntity_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager UserEntity.entityManager;
    
    public static final EntityManager UserEntity.entityManager() {
        EntityManager em = new UserEntity().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long UserEntity.countUserEntitys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM UserEntity o", Long.class).getSingleResult();
    }
    
    public static List<UserEntity> UserEntity.findAllUserEntitys() {
        return entityManager().createQuery("SELECT o FROM UserEntity o", UserEntity.class).getResultList();
    }
    
    public static UserEntity UserEntity.findUserEntity(Long id) {
        if (id == null) return null;
        return entityManager().find(UserEntity.class, id);
    }
    
    public static List<UserEntity> UserEntity.findUserEntityEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM UserEntity o", UserEntity.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void UserEntity.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void UserEntity.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            UserEntity attached = UserEntity.findUserEntity(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void UserEntity.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void UserEntity.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public UserEntity UserEntity.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        UserEntity merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
