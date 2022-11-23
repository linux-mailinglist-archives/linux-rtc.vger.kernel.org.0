Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C976356C6
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Nov 2022 10:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237871AbiKWJdk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Nov 2022 04:33:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237875AbiKWJc5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Nov 2022 04:32:57 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05EC83E089
        for <linux-rtc@vger.kernel.org>; Wed, 23 Nov 2022 01:31:32 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id x21so20681198ljg.10
        for <linux-rtc@vger.kernel.org>; Wed, 23 Nov 2022 01:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmSScFfQP7gjn36UjcrrCVl/irU8fYs0o8hBILATD4g=;
        b=VO8b5tFz3Q0hgY84gmJn8Q+rWpYTqsiAld6weNgX5X0a8WDwyiSBGnjPf2TVFX5Wvg
         QLhIYg6BW7v26b+cl0Nr8ztsB3JtLaIOnfLA08xJOaoUAAQNL4ho0Tslr5X/vk3DhbKN
         GViXWSKTT0/LCZAoCznab1vaAwE11gY7aNiKd/xvahe+X6cD9neOMmYZFVB2hTmhd5gp
         PD2ieN54U5NIMZER1gnGrXC2NM4SGO2Pr7ipf0Lf9+nwYYXf50m5LIkVfDewNUC8ZSRA
         kWrI8LO6ELXjQnG1H5xkxLJvdqAtz8sjVzxIBxV2OxweLM36NG87ahvuv6708Gtl5p60
         8csA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OmSScFfQP7gjn36UjcrrCVl/irU8fYs0o8hBILATD4g=;
        b=2Zf3TRg68f7hXOypLoL1/2S96+7I1g8AeYi7Zf81AF+esDZOUyTThTCNnZWGm9wFdQ
         J/AB712BlQTGJHxBH+EghIIS9qe2kuvStlJb4mRMpCTCY9O996OtXz1sX4E4NI+gfsjt
         CPlq4Rb//CpsPv61vUgjcqoyd9I9VNT7p1HKGKIW13sMDmUI6Tb3hc5gQjMpdO0xkZAy
         kLOAmbabl8dyEIAQAPcVFczJrOvWQzk5gly5nrfWG9odYyQFG/fldJcVySJxUtMHCjuj
         RTc7ENjos38N5HgO6Y7B9NN3d0D2XnvcdAEywTvIpXZI1lw1SSjUFlTm6T0jrzOt++Sk
         WZxA==
X-Gm-Message-State: ANoB5pleQ3lok7//3H9vPCI6vX1D0nZZDLHAjaJOGo79mh1KHy5wi24t
        NZf6GF44ZY7mZ8I9fXEqliuTnw==
X-Google-Smtp-Source: AA0mqf5COKFBIpkYr6gRx80qhFuAQ3bc4C3eG0r4k0lel11Bj+I1KRLPWrHA+BCX4DMVZ/FfyXv/Jw==
X-Received: by 2002:a05:651c:160f:b0:278:d847:1a8b with SMTP id f15-20020a05651c160f00b00278d8471a8bmr7959424ljq.17.1669195890364;
        Wed, 23 Nov 2022 01:31:30 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n3-20020a2e7203000000b0027781448499sm2130579ljc.85.2022.11.23.01.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 01:31:29 -0800 (PST)
Message-ID: <6af753e4-cf4d-cfa1-a339-abafdce2d472@linaro.org>
Date:   Wed, 23 Nov 2022 10:31:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
To:     Jacky Bai <ping.bai@nxp.com>, Rob Herring <robh@kernel.org>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
 <166914594571.442076.9834259216884759566.robh@kernel.org>
 <AS8PR04MB8642AB09DB82DE58B60421BA870C9@AS8PR04MB8642.eurprd04.prod.outlook.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AS8PR04MB8642AB09DB82DE58B60421BA870C9@AS8PR04MB8642.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/11/2022 08:54, Jacky Bai wrote:
> Hi Rob,
> 
>> Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
>> bbnsm
>>
>>
>> On Mon, 21 Nov 2022 14:51:41 +0800, Jacky Bai wrote:
>>> Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).
>>>
>>> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
>>> ---
>>>  .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 103
>> ++++++++++++++++++
>>>  1 file changed, 103 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m
>> dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Error:
>> Documentation/devicetree/bindings/mfd/nxp,bbnsm.example.dts:28.27-28
>> syntax error FATAL ERROR: Unable to parse input tree
>> make[1]: *** [scripts/Makefile.lib:406:
>> Documentation/devicetree/bindings/mfd/nxp,bbnsm.example.dtb] Error 1
>> make[1]: *** Waiting for unfinished jobs....
>> make: *** [Makefile:1492: dt_binding_check] Error 2
>>
> 
> This error should be related to the 'interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;'
> Do we need to change it a magic number define?

You should include a proper header. Look at other bindings.

Best regards,
Krzysztof

