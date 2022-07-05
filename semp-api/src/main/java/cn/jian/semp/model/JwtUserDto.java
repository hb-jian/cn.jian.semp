package cn.jian.semp.model;//package cn.jian.semp.semp1.model;
//
//import com.hqyz.webservice.portal.entity.User;
//import lombok.Data;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//
//import java.util.Collection;
//import java.util.List;
//
//@Data
//public class JwtUserDto implements UserDetails {
//    private String uId;
//    private String userName;
//    private String password;
//    private String orgId;
//    private Collection<? extends GrantedAuthority> authorities;
//
//    public JwtUserDto(User user, List<SimpleGrantedAuthority> authorites) {
//        uId = user.getId();
//        userName = user.getAccount();
//        password = user.getPassword();
//        orgId = user.getOrgId();
//        roleId = user.getRoleId();
//        authorities = authorites;
//    }
//
//    @Override
//    public Collection<? extends GrantedAuthority> getAuthorities() {
//        return authorities;
//    }
//
//    @Override
//    public String getPassword() {
//        return password;
//    }
//
//    @Override
//    public String getUsername() {
//        return userName;
//    }
//
//    @Override
//    public boolean isAccountNonExpired() {
//        return false;
//    }
//
//    @Override
//    public boolean isAccountNonLocked() {
//        return false;
//    }
//
//    @Override
//    public boolean isCredentialsNonExpired() {
//        return false;
//    }
//
//    @Override
//    public boolean isEnabled() {
//        return false;
//    }
//
//    private String roleId;
//
//    @Override
//    public String toString() {
//        return String.format("JwtUserService{id={}, username={}, password={}, authorities={}",uId,userName,password,authorities);
//    }
//}
