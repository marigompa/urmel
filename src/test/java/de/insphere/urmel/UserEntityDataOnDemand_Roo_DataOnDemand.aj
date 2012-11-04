// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.insphere.urmel;

import de.insphere.urmel.UserEntity;
import de.insphere.urmel.UserEntityDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect UserEntityDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserEntityDataOnDemand: @Component;
    
    private Random UserEntityDataOnDemand.rnd = new SecureRandom();
    
    private List<UserEntity> UserEntityDataOnDemand.data;
    
    public UserEntity UserEntityDataOnDemand.getNewTransientUserEntity(int index) {
        UserEntity obj = new UserEntity();
        setUserName(obj, index);
        return obj;
    }
    
    public void UserEntityDataOnDemand.setUserName(UserEntity obj, int index) {
        String userName = "userName_" + index;
        obj.setUserName(userName);
    }
    
    public UserEntity UserEntityDataOnDemand.getSpecificUserEntity(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        UserEntity obj = data.get(index);
        Long id = obj.getId();
        return UserEntity.findUserEntity(id);
    }
    
    public UserEntity UserEntityDataOnDemand.getRandomUserEntity() {
        init();
        UserEntity obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return UserEntity.findUserEntity(id);
    }
    
    public boolean UserEntityDataOnDemand.modifyUserEntity(UserEntity obj) {
        return false;
    }
    
    public void UserEntityDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = UserEntity.findUserEntityEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'UserEntity' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<UserEntity>();
        for (int i = 0; i < 10; i++) {
            UserEntity obj = getNewTransientUserEntity(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}