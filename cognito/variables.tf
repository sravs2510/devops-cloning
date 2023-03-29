variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "user_pool_name" {
  type        = string
  description = "Cognito user pool name"
}

variable "user_pool_web_client_name" {
  type        = string
  description = "Cognito web client name"
}

variable "cognito_custom_domain" {
  type        = string
  description = "Cognito Custom Domain"
}

variable "cognito_custom_domain_acm_arn" {
  type        = string
  description = "Cognito Custom Domain ACM ARN"
}

variable "cognito_callback_url" {
  type        = string
  description = "Cognito callback url"
}

variable "base_domain" {
  type        = string
  description = "Base Domain"
}

variable "verification_message" {
  type        = string
  description = "<html style="width:100%;font-family:'trebuchet ms', 'lucida grande', 'lucida sans unicode', 'lucida sans', tahoma, sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0">

<body style="width:100%;font-family:'trebuchet ms', 'lucida grande', 'lucida sans unicode', 'lucida sans', tahoma, sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0">

<div class="es-wrapper-color" style="background-color:transparent"> <!--[if gte mso 9]>

    <v:background xmlns:v="urn:schemas-microsoft-com:vml" fill="t">

        <v:fill type="tile" color="transparent"></v:fill>

    </v:background><![endif]-->

    <table class="es-wrapper" width="100%" cellspacing="0" cellpadding="0"

           style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;padding:0;Margin:0;width:100%;height:100%;background-repeat:repeat;background-position:center top;background-color:transparent">

        <tr style="border-collapse:collapse">

            <td valign="top" style="padding:0;Margin:0">

                <table class="es-content" cellspacing="0" cellpadding="0" align="center"

                       style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%">

                    <tr style="border-collapse:collapse">F

                        <td align="center" bgcolor="#ffffff" style="padding:0;Margin:0;background-color:#ffffff">

                            <table class="es-content-body" cellspacing="0" cellpadding="0" align="center"

                                   style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:transparent;width:600px">

                                <tr style="border-collapse:collapse">

                                    <td align="left"

                                        style="Margin:0;padding-top:10px;padding-bottom:10px;padding-left:20px;padding-right:20px">

                                        <table cellpadding="0" cellspacing="0" width="100%"

                                               style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">

                                            <tr style="border-collapse:collapse">

                                                <td align="center" valign="top" style="padding:0;Margin:0;width:560px">

                                                    <table cellpadding="0" cellspacing="0" width="100%"

                                                           role="presentation"

                                                           style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">

                                                        <tr style="border-collapse:collapse">

                                                            <td align="center" style="padding:0;Margin:0;font-size:0px">

                                                                <img class="adapt-img"

                                                                     src="https://esoqfe.stripocdn.email/content/guids/CABINET_f49d55a2da6d6c822e6af5f3b56d8f03/images/email_header_xsc.gif"

                                                                     alt

                                                                     style="display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic"

                                                                     width="560" height="187">
                                                            </td>

                                                        </tr>

                                                    </table>

                                                </td>

                                            </tr>

                                        </table>

                                    </td>

                                </tr>

                                <tr style="border-collapse:collapse">

                                    <td align="left" style="padding:0;Margin:0">

                                        <table cellpadding="0" cellspacing="0" width="100%"

                                               style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">

                                            <tr style="border-collapse:collapse">

                                                <td align="center" valign="top" style="padding:0;Margin:0;width:600px">

                                                    <table cellpadding="0" cellspacing="0" width="100%"

                                                           role="presentation"

                                                           style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">

                                                        <tr style="border-collapse:collapse">

                                                            <td align="left" bgcolor="#ffffff"

                                                                style="Margin:0;padding-top:15px;padding-bottom:15px;padding-left:40px;padding-right:40px">

                                                                <p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:poppins, sans-serif;line-height:17px;color:#002f6c;font-size:14px;text-align:center">

                                                                    <span>Welcome to Qatalyst,</span><br>To finish signing up,please verify your email by making use of this verification code. The verification code will be valid for the next 1 hr.<br><br><br><span style="font-weight: bold; font-size: 2.5em;">{####}</span><br><br><br>Thanks!<br>Team Qatalyst
                                                                </p>
                                                            </td>
                                                        </tr>

                                                    </table>

                                                </td>

                                            </tr>

                                        </table>

                                    </td>

                                </tr>

                                <tr style="border-collapse:collapse">

                                    <td align="left" style="padding:0;Margin:0;padding-left:20px;padding-right:20px">

                                        <table cellpadding="0" cellspacing="0" width="100%"

                                               style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">

                                            <tr style="border-collapse:collapse">

                                                <td align="center" valign="top" style="padding:0;Margin:0;width:560px">

                                                    <table cellpadding="0" cellspacing="0" width="100%"

                                                           role="presentation"

                                                           style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">

                                                        <tr style="border-collapse:collapse">

                                                            <td align="center"

                                                                style="padding:20px;Margin:0;font-size:0">

                                                                <table border="0" width="100%" height="100%"

                                                                       cellpadding="0" cellspacing="0"

                                                                       role="presentation"

                                                                       style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">

                                                                    <tr style="border-collapse:collapse">

                                                                        <td style="padding:0;Margin:0;border-bottom:1px solid #cccccc;background:none;height:1px;width:100%;margin:0px"></td>

                                                                    </tr>

                                                                </table>

                                                            </td>

                                                        </tr>

                                                    </table>

                                                </td>

                                            </tr>

                                        </table>

                                    </td>

                                </tr>

                            </table>

                        </td>

                    </tr>

                </table>

                <table cellpadding="0" cellspacing="0" class="es-footer" align="center"

                       style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;background-color:transparent;background-repeat:repeat;background-position:center top">

                    <tr style="border-collapse:collapse">

                        <td align="center" bgcolor="#ffffff" style="padding:0;Margin:0;background-color:#ffffff">

                            <table class="es-footer-body"

                                   style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#333333;width:600px"

                                   cellspacing="0" cellpadding="0" bgcolor="#333333" align="center">

                                <tr style="border-collapse:collapse">

                                    <td align="left" bgcolor="#ffffff"

                                        style="Margin:0;padding-bottom:15px;padding-top:20px;padding-left:20px;padding-right:20px;background-color:#ffffff">

                                        <table width="100%" cellspacing="0" cellpadding="0"

                                               style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">

                                            <tr style="border-collapse:collapse">

                                                <td valign="top" align="center" style="padding:0;Margin:0;width:560px">

                                                    <table width="100%" cellspacing="0" cellpadding="0"

                                                           role="presentation"

                                                           style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px">

                                                        <tr style="border-collapse:collapse">

                                                            <td align="center"

                                                                style="Margin:0;padding-top:5px;padding-left:5px;padding-right:5px;padding-bottom:20px">

                                                                <p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:poppins, sans-serif;line-height:14px;color:#002f6c;font-size:12px">

                                                                    You received this email because you joined or

                                                                    created a workspace in Qatalyst.<br><br>Entropik

                                                                    Tech<br>#HumanizingExperiences</p>

                                                            </td>

                                                        </tr>

                                                        <tr style="border-collapse:collapse">

                                                            <td style="padding:0;Margin:0"><p

                                                                    style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:'trebuchet ms', 'lucida grande', 'lucida sans unicode', 'lucida sans', tahoma, sans-serif;line-height:17px;color:#333333;font-size:14px"></p>

                                                            </td>

                                                        </tr>

                                                    </table>

                                                </td>

                                            </tr>

                                        </table>

                                    </td>

                                </tr>

                            </table>

                        </td>

                    </tr>

                </table>

            </td>

        </tr>

    </table>

</div>

</body>

</html>"
}
