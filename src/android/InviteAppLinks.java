package com.example.plugin;

import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;


import com.facebook.FacebookSdk;
import com.facebook.share.model.AppInviteContent;
import com.facebook.share.widget.AppInviteDialog;


import android.app.Activity;
import android.content.Context;
 

public class InviteAppLinks extends CordovaPlugin {


    /**
     * Called after plugin construction and fields have been initialized.
     * Prefer to use pluginInitialize instead since there is no value in
     * having parameters on the initialize() function.
     */
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
    	
    }
    
    /**
     * Called after plugin construction and fields have been initialized.
     */
    protected void pluginInitialize() {
		Context context = this.cordova.getActivity().getApplicationContext();
		FacebookSdk.sdkInitialize(context);    	
    }
	
    @Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {

		String respMsg = "";
    	
        if (action.equals("canShow")) {

            if(this.canShow())
            {
            	callbackContext.success(1);
            	return true;
            }
            else
            {
            	callbackContext.success(0);
            	return false;
            }

        }

        
        if (action.equals("appInvite")) {
        	
            String appLinkUrl = data.getString(0);
            String previewImageUrl = data.getString(1);

            if ((appLinkUrl.length() > 0) && (previewImageUrl.length() > 0) )
            {
                if(this.appInvite(appLinkUrl, previewImageUrl))
                {
                	callbackContext.success("success");
                	return true;
                }
                else
                {
                	callbackContext.success("failed");
                	return false;
                }            	
            }
            else
            {
            	callbackContext.error("appLinkUrl or previewImageUrl is empty.");
            	return false;
            }
        }


        callbackContext.error("unknown error");    
        return false;

    }
    
    
    public boolean appInvite(String appLinkUrl, String previewImageUrl)
    {

    	Activity activity = cordova.getActivity();
        if (this.canShow()) {
            AppInviteContent content = new AppInviteContent.Builder()
                        .setApplinkUrl(appLinkUrl)
                        .setPreviewImageUrl(previewImageUrl)
                        .build();
            AppInviteDialog.show(activity, content);
            
            return true;
        }    	
    	
    	return false;
    }

    public boolean canShow()
    {
        if (AppInviteDialog.canShow()) 
        {            
            return true;
        }    	
    	return false;
    }
    
	
}
