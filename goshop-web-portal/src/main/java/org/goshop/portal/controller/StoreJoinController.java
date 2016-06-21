package org.goshop.portal.controller;

import org.goshop.common.attachment.AttachmentService;
import org.goshop.common.context.CustomTimestampEditor;
import org.goshop.common.exception.PageException;
import org.goshop.common.web.utils.JsonUtils;
import org.goshop.store.model.JsonManagement;
import org.goshop.store.i.StoreJoinService;
import org.goshop.store.model.StoreInfoModel;
import org.goshop.store.pojo.Store;
import org.goshop.store.pojo.StoreJoin;
import org.goshop.users.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping(value = "/store_join")
public class StoreJoinController {

    @Autowired
    StoreJoinService storeJoinService;

    @Autowired
    AttachmentService attachmentService;

    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        //对于需要转换为Date类型的属性，使用DateEditor进行处理
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);

        SimpleDateFormat datetimeFormat = new SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss");
        datetimeFormat.setLenient(false);

        binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(
                dateFormat, true));
        binder.registerCustomEditor(java.sql.Timestamp.class,
                new CustomTimestampEditor(datetimeFormat, true));
    }

    @RequestMapping("/agreement")
    public String agreement(Model model,
                            User user,
                            @RequestParam(value = "state", required = false) String statePage,
                            HttpServletRequest request,
                            HttpServletResponse response) {
        String jump = jump(user,statePage);
        if (jump != null) {
            return jump;
        }
        model.addAttribute("P_STEP", 1);
        return "store/store_agreement";

    }

    public String jump(User user,String statePage) {
        Store store = storeJoinService.getCurrentStore(user);
        if (store != null) {
            return "redirect:/se/goods/addstep/one";
        }
        StoreJoin storeJoin = storeJoinService.getCurrentUserStoreJoin(user);
        if (storeJoin != null) {
            String state = storeJoin.getJoininState();
            //if (StringUtils.hasText(state) && state.equals("30") && !StringUtils.hasText(statePage)) {
            //    return "redirect:/store_join/step1.html";
            //} else if (StringUtils.hasText(state)) {
                return "redirect:/store_join/step4.html";
           // }
        }

        return null;
    }

    @RequestMapping("/step1")
    public String stepOne(Model model,
                          HttpServletRequest request,
                          HttpServletResponse response) {
        model.addAttribute("P_STEP", 1);
        model.addAttribute("P_SIDEBAR", 1);
        return "store/settled_step_one";

    }

    @RequestMapping(value = "/step2", method = RequestMethod.POST)
    public String stepTwo(User user,StoreJoin storeJoin,
                          BindingResult result,
                          Model model,
                          @RequestParam("businessLicenceNumber_electronic") MultipartFile businessLicenceNumberFile,//营业执照号电子版
                          @RequestParam("organization_code_electronic") MultipartFile organizationCodeFile,//组织机构代码证电子版
                          @RequestParam("general_taxpayer") MultipartFile generalTaxpayerFile,//一般纳税人证明
                          HttpServletRequest request,
                          HttpServletResponse response) {
        Assert.isTrue(businessLicenceNumberFile.getSize() > 0, "请上传营业执照号电子版！");
        Assert.isTrue(businessLicenceNumberFile.getSize() < 1000000, "营业执照号电子版文件超过了1M，请编辑后重新上传！");

        Assert.isTrue(organizationCodeFile.getSize() > 0, "请上传组织机构代码证电子版！");
        Assert.isTrue(organizationCodeFile.getSize() < 1000000, "组织机构代码证电子版文件超过了1M，请编辑后重新上传！");

        Assert.isTrue(generalTaxpayerFile.getSize() > 0, "请上传一般纳税人证明！");
        Assert.isTrue(generalTaxpayerFile.getSize() < 1000000, "一般纳税人证明文件超过了1M，请编辑后重新上传！");

        try {
            String business= attachmentService.upload(businessLicenceNumberFile);
            String organization =  attachmentService.upload(organizationCodeFile);
            String generalTaxpayer=attachmentService.upload(generalTaxpayerFile);
            storeJoin.setBusinessLicenceNumberElectronic(business);
            storeJoin.setOrganizationCodeElectronic(organization);
            storeJoin.setGeneralTaxpayer(generalTaxpayer);
        } catch (IOException e) {
            e.printStackTrace();
            throw new PageException("文件保存错误！");
        }

        try {
            storeJoinService.applySeller(user,storeJoin);
        }catch (Exception e){
            throw new PageException(e.getMessage());
        }
        model.addAttribute("P_STEP", 2);
        model.addAttribute("P_SIDEBAR", 2);
        return "store/settled_step_two";
    }

    @RequestMapping(value = "/step3", method = RequestMethod.POST)
    public String stepThree(User user,StoreJoin storeJoin,
                            Model model,
                            @RequestParam("bank_licence_electronic") MultipartFile bankLicenceElectronicFile,//开户银行许可证电子版
                            @RequestParam("taxRegistrationCertificate_electronic") MultipartFile taxRegistrationCertificateElectronicFile,//税务登记证号电子版
                            HttpServletRequest request,
                            HttpServletResponse response) {


        Assert.isTrue(bankLicenceElectronicFile.getSize() > 0, "请上传开户银行许可证电子版！");
        Assert.isTrue(bankLicenceElectronicFile.getSize() < 1000000, "开户银行许可证电子版文件超过了1M，请编辑后重新上传！");

        Assert.isTrue(taxRegistrationCertificateElectronicFile.getSize() > 0, "请上传税务登记证号电子版！");
        Assert.isTrue(taxRegistrationCertificateElectronicFile.getSize() < 1000000, "税务登记证号电子版文件超过了1M，请编辑后重新上传！");

        try {
            String bankLicence= attachmentService.upload(bankLicenceElectronicFile);
            String taxRegistrationCertificate =  attachmentService.upload(taxRegistrationCertificateElectronicFile);
            storeJoin.setBankLicenceElectronic(bankLicence);
            storeJoin.setTaxRegistrationCertificateElectronic(taxRegistrationCertificate);
        } catch (IOException e) {
            e.printStackTrace();
            throw new PageException("文件保存错误！");
        }

        try {
            StoreInfoModel storeInfoModel=storeJoinService.applySellerThree(user,storeJoin);
            model.addAttribute("P_PARENT_STORECLASS", storeInfoModel.getStoreClassParentList());
            model.addAttribute("P_PARENT_GOODSCLASS", storeInfoModel.getGoodsClassParentList());
            model.addAttribute("P_STOREGRADE", storeInfoModel.getStoreGradeList());
        }catch (Exception e){
            throw new PageException("保存财务信息错误："+e.toString());
        }

        model.addAttribute("P_STEP", 3);
        model.addAttribute("P_SIDEBAR", 3);
        return "store/settled_step_three";

    }

    @RequestMapping(value = "/step4", method = RequestMethod.POST)
    public String stepFour(User user,StoreJoin storeJoin,
                           @RequestParam(value = "store_class_ids[]",required = false) String[] ids,
                           @RequestParam(value = "store_class_names[]",required = false) String[] names,
                           Model model, HttpServletRequest request,
                           HttpServletResponse response) {

        StoreJoin dataBase = storeJoinService.save(user,storeJoin, ids, names);

        model.addAttribute("P_STEP", 4);
        model.addAttribute("P_SIDEBAR", 4);
        model.addAttribute("P_STORE_JOIN", dataBase);
        return "store/settled_step_four";

    }

    @RequestMapping(value = "/step4", method = RequestMethod.GET)
    public String stepFour(User user,Model model, HttpServletRequest request,
                           HttpServletResponse response) {

        StoreJoin storeJoinin = storeJoinService.getCurrentUserStoreJoin(user);

        Store store = storeJoinService.getCurrentStore(user);
        if (store != null) {
            return "redirect:/se/goods/addstep/one";
        }

        model.addAttribute("P_STEP", 4);
        model.addAttribute("P_SIDEBAR", 4);
        model.addAttribute("P_STORE_JOIN", storeJoinin);
        return "store/settled_step_four";

    }

    @RequestMapping(value = "/pay")
    public String pay(User user,Model model, HttpServletRequest request,
                      HttpServletResponse response) {
        StoreJoin storeJoin = storeJoinService.getCurrentUserStoreJoin(user);
        if (!storeJoin.getJoininState().equals("20") && !storeJoin.getJoininState().equals("31")) {
            return "redirect:/store_join/agreement";
        }
        String scIds = storeJoin.getStoreClassIds();
        List<JsonManagement> jsonManagementList = JsonUtils.jsonToList(scIds, JsonManagement.class);

        model.addAttribute("P_CLASS_LIST", jsonManagementList);
        model.addAttribute("P_STEP", 5);
        model.addAttribute("P_SIDEBAR", 5);
        model.addAttribute("P_STORE_JOIN", storeJoin);
        return "store/settled_pay";

    }


    @RequestMapping(value = "/pay_save")
    public String paySave(User user,
            @RequestParam("paying_money_certificate") MultipartFile certificate,//上传付款凭证
            @RequestParam("paying_money_certificate_explain") String explain,//备注
            Model model, HttpServletRequest request,
            HttpServletResponse response) {
        StoreJoin storeJoin = storeJoinService.getCurrentUserStoreJoin(user);
        if (!storeJoin.getJoininState().equals("20") && !storeJoin.getJoininState().equals("31")) {
            return "redirect:/store_join/agreement";
        }
        storeJoin.setPayingMoneyCertificateExplain(explain);

        Assert.isTrue(certificate.getSize() > 0, "请上传付款凭证电子版！");
        Assert.isTrue(certificate.getSize() < 1000000, "付款凭证电子版文件超过了1M，请编辑后重新上传！");

        try {
            String certificateStr= attachmentService.upload(certificate);
            storeJoin.setPayingMoneyCertificate(certificateStr);
        } catch (IOException e) {
            e.printStackTrace();
            throw new PageException("文件保存错误！");
        }
        storeJoinService.paySave(storeJoin);
        return "redirect:/store_join/step4.html";

    }
}
