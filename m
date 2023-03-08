Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDEE6B0205
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Mar 2023 09:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbjCHIuR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 8 Mar 2023 03:50:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbjCHIt6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 8 Mar 2023 03:49:58 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0AB29C9B3
        for <linux-rtc@vger.kernel.org>; Wed,  8 Mar 2023 00:49:56 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id a25so62884742edb.0
        for <linux-rtc@vger.kernel.org>; Wed, 08 Mar 2023 00:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678265395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wVVtVtZgRNBBIQVdh518Hd5cjsnCYjRPbk6bHT1f5tE=;
        b=CVV1/oJBGmp/+zLg1dEyKjzLFSesM3iV5M8okw1unWvTZPJOPfmdhbbJFcYNBukwsG
         ZqdN1aoQE9Ot6KV7mBS1LuubNgzwXr1BV/9MtkgOm+Q0k4kbIREoCHwN0/QP8iRwYwkD
         EaqQFKx3wRAzKLyAP2btK7ThdEHxV1MSO8qayQVzUV9PFP6EhP17L+XQVWLIQPrVrEOW
         5EGjP5Vp2TcSO+3diEPIL2GNFakmCmwgfWYw3wSgfuf9xZppb0s/eILWzzQ1kuku/7dj
         99odahCZnwnTVt2pYxoJonwBjSPNIMgf9lyVBJT8zQiJcN8DlfzZaFsIRlAyAeubtIm4
         G94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678265395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wVVtVtZgRNBBIQVdh518Hd5cjsnCYjRPbk6bHT1f5tE=;
        b=GEBNaSdimxQLr+Ft9JzsmAQ5hw+siDZ0cQXc+6qRGGJCU/+xzO7lwAriOzSghE6mnb
         +/OpE7CZ177NWA/u2msI264p5os/6GRKQ/aa6moGMhdnJ/y9ATCpMW+oqLtQt2vXVHaq
         zs4hbYZlXXv+0IrPHTKpylnth7MSPM8eOHxOve49cifrNm4f6YmvHMjTGxdSXfrUDkC/
         xls0O6mfcCVMsM3gWaBaznwvEismJaz00z5kCLE0CvTB15X7WVGfYHoyqYdr/GGi34S7
         4CA/9p7hIY+3fxXnqRMGqaYxTG1DoEhJ1idvZv5ixCcZTZ8lMxpLmzHR9eh2blmS/OuB
         fXZg==
X-Gm-Message-State: AO0yUKVOtnq1mTIoShHl+QxmtCN0jR4cd3iOmqu2ey88zB78riEzSQMQ
        hy3jK9dw8QN3A7HHy6jl8LJUYQ==
X-Google-Smtp-Source: AK7set/36krXeuSeDnySLKEZyx6orba1aKs7BuVbr+Qp+QTRSVU8CzdechgO6Gul0nSA4S2Uw4FXUg==
X-Received: by 2002:a17:907:787:b0:8b1:7de3:cfb0 with SMTP id xd7-20020a170907078700b008b17de3cfb0mr22025175ejb.2.1678265395145;
        Wed, 08 Mar 2023 00:49:55 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:bba:fbfa:8aec:a133? ([2a02:810d:15c0:828:bba:fbfa:8aec:a133])
        by smtp.gmail.com with ESMTPSA id op20-20020a170906bcf400b008ca52f7fbcbsm7144792ejb.1.2023.03.08.00.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 00:49:54 -0800 (PST)
Message-ID: <df35ed19-74d3-5eea-8efb-588417a417f2@linaro.org>
Date:   Wed, 8 Mar 2023 09:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] max77663-rtc: pass rtc address from device tree node
 if exists
Content-Language: en-US
To:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20230308083759.11692-1-clamor95@gmail.com>
 <202303080844360ced8b82@mail.local>
 <CAPVz0n2XErDOCERV+XO3ek4_15hiwTasy4agLZLijqx2z67UnA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPVz0n2XErDOCERV+XO3ek4_15hiwTasy4agLZLijqx2z67UnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/03/2023 09:46, Svyatoslav Ryhel wrote:
> ср, 8 бер. 2023 р. о 10:44 Alexandre Belloni
> <alexandre.belloni@bootlin.com> пише:
>>
>> Hello,
>>
>> the subject is not correct, please use the subsystem style
>>
>> On 08/03/2023 10:37:59+0200, Svyatoslav Ryhel wrote:
>>> MAX77663 PMIC can have RTC on both 0x63 i2c address (like grouper)
>>> which is main address but on some devices RTC is located on 0x48
>>> i2c address (like p880 and p895 from LG). Lets add property to be
>>> able to use alternative address if needed without breaking existing
>>> bindings.
>>>
>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>> ---
>>>  drivers/rtc/rtc-max77686.c | 8 +++++++-
>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
>>> index b0250d91fb00..218177375531 100644
>>> --- a/drivers/rtc/rtc-max77686.c
>>> +++ b/drivers/rtc/rtc-max77686.c
>>> @@ -691,6 +691,7 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
>>>  {
>>>       struct device *parent = info->dev->parent;
>>>       struct i2c_client *parent_i2c = to_i2c_client(parent);
>>> +     int rtc_i2c_addr;
>>>       int ret;
>>>
>>>       if (info->drv_data->rtc_irq_from_platform) {
>>> @@ -714,8 +715,13 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
>>>               goto add_rtc_irq;
>>>       }
>>>
>>> +     ret = device_property_read_u32(parent, "maxim,rtc-i2c-address",
>>> +                                    &rtc_i2c_addr);
>>
>> This property needs to be documented
>>
> 
> max776xx pmic has no yaml to document

Of course it has, otherwise on what did I work?

git grep max77686


Best regards,
Krzysztof

