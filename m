Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2C856818F
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Jul 2022 10:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbiGFIbO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 Jul 2022 04:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232210AbiGFIbN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 Jul 2022 04:31:13 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3A911835
        for <linux-rtc@vger.kernel.org>; Wed,  6 Jul 2022 01:31:11 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id y16so24610510lfb.9
        for <linux-rtc@vger.kernel.org>; Wed, 06 Jul 2022 01:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kJlBuhqhOzd0cw19B5MSNUienE+rxoyfgQRF5YloyRQ=;
        b=vfCGV/r4RooX1A58M8Kverj/TmlPNJJYjK2CsPUnI5z/Y3C8hLiyJaPjF92b4x8O3G
         ISLDsBNH++XdBMMoGRjI/UJc++5b1Wp/jAcs4izpYtCHV+DhZnjwZVlSNm/feEbQQrpG
         bpfzo9+RS0B4kCadI/TQ0SP7yOjGMx4UGcvghVU6XgWzdp7HDZHIu1ZXvAdViCmSge5V
         pTl5hAmuWnx08n8JwQo9ZBtyxepfjGA59pe+n9bgFmWcjla7LYcBrmpBYgH/Sn1zT1mI
         t8HRlsQbx+1FwYfMWcs0UBq0h1kWLMVKKC17kahLND8Zw2zkOiQC7Es6aPh3mIxiMvGO
         3+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kJlBuhqhOzd0cw19B5MSNUienE+rxoyfgQRF5YloyRQ=;
        b=MqGsD5RCb2nPTh9UXaKiDhXIkAlEBQTdGx4ys8a47pLNk267q6K1KIJm3lTMNNoOSt
         FnH8h41qkUgzjnF7SKYkkhyZGp7HS1BcPQ9CMReQttsbn8S8dGWGQIobewAH4J8E8ysU
         m9lV8xk26mgYKKkWMiVza76m/p/jZhSA/6dS8pKXRrbfwDsKdIt76UgVxarDM9BUqCCT
         Dd0fKzETxk8f/lRsf0YtEHzkE0kQq1OkW8OMEbXdahGqDz0Qasz7NvwnpSBX4eZrv8EB
         E0953oVssyAAH3PBR6MdRXU6J02Tn1DMUTvIKousNmPiIueyXLwmfWXSLiOVO5Axb3Nt
         rN4g==
X-Gm-Message-State: AJIora9WdKGsoXZqmuaxqtXHKGjq2aMNnE4kZxvzRy7dSQx8ofz4VPlJ
        buMPP7bLf9Ku2p/z7E8uqrTJ8A==
X-Google-Smtp-Source: AGRyM1seaYpWG3/Midti5gjjNOyfc1xhulXE1oaWF75nMcaOJmUi4M1pLBCyB905foBBw1WcyfmDTQ==
X-Received: by 2002:a05:6512:1151:b0:481:1675:f343 with SMTP id m17-20020a056512115100b004811675f343mr24826083lfg.280.1657096269917;
        Wed, 06 Jul 2022 01:31:09 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id w20-20020a05651c119400b0025552d57beasm6055878ljo.89.2022.07.06.01.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 01:31:09 -0700 (PDT)
Message-ID: <a3d74360-deb7-8baf-2871-57535b102bb0@linaro.org>
Date:   Wed, 6 Jul 2022 10:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 02/15] dt-bindings: pinctrl: imx: Add fsl,scu-iomux
 yaml file
Content-Language: en-US
To:     "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Viorel Suman <viorel.suman@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Liu Ying <victor.liu@nxp.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Ming Qian <ming.qian@nxp.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Abel Vesa <abel.vesa@nxp.com>
References: <20220704161541.943696-1-viorel.suman@oss.nxp.com>
 <20220704161541.943696-3-viorel.suman@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220704161541.943696-3-viorel.suman@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/07/2022 18:15, Viorel Suman (OSS) wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> In order to replace the fsl,scu txt file from bindings/arm/freescale,
> we need to split it between the right subsystems. This patch documents
> separately the 'iomux/pinctrl' child node of the SCU main node.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I think Rob's robot warning can be ignored for this case.

Best regards,
Krzysztof
