Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51B3665989F
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Dec 2022 14:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbiL3NVT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 30 Dec 2022 08:21:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiL3NVR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 30 Dec 2022 08:21:17 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75AB3178B4
        for <linux-rtc@vger.kernel.org>; Fri, 30 Dec 2022 05:21:16 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id cf42so31722931lfb.1
        for <linux-rtc@vger.kernel.org>; Fri, 30 Dec 2022 05:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZyWzaa2pduRhSQBKOKbq0PCK530JW7KjKWUAlL19weA=;
        b=TfvGpm9QO6wozdlap9gK6rlsUzOWd+tbSc6FehZ0Ojtfwpwb9YOUXr2ygzNjchVNNf
         OP6WVGOP2NoOsbZ+f0lo6RATRckGWhjP8Ag4cOOym2Gd3wj78IFw6o37iUOfVjFjW7Zu
         kfUrvuOrZvpSJUF3lJvbomC+TjZySGbEE6Tl8+pSmlZon3GnRU4dtheM+RbKdvvY9wJp
         oQoQudWgfbtYhg0prbmu1hWB2JG8RBYJ/BgrLrQGiCVIs1rQ72cwAPbD6acjCGHggglj
         hMiSV15zfd3j2llG0Cx99tC2ylEwc/tnahWrbkNh+UfgOPFgavFSTdWQAmRmCY3NlN8n
         SXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyWzaa2pduRhSQBKOKbq0PCK530JW7KjKWUAlL19weA=;
        b=M/LfhfCX7hDfEztOGHZSuCseViKXSynGbS+nrMCsT/IO+oqH0ZETHnWsB8vbytgPck
         /7MWCLOoEPR/Oxy8nA0gt9BCo3Ps5Hv6b5ZECt43gC76UZd6X9fNcTfg5LWo0kPAFQhG
         N6TNngOIo1vklmfyEmihgm5gQJLltG6bJPtjKcJCvANzyHORLPblNU3H7z86OGDUgWfZ
         qczEmPDSTdWr5Bw2jsOluXKXHz1625n+Q3980Kf6Y5AHblJk9Jow+bOWMoye8erZ7owF
         3v44pkROgIcTyDW4JgX5BbwuRBGEIzA5qBcYQ7mKWbsOQ60V75b+/OjWGn+Dr8wuBNcs
         Oacw==
X-Gm-Message-State: AFqh2krk6uQ41+1x1F1+JiDxkId82JFFm6u+saeUGUgjAl8UigZ+urNE
        8KqdWbmrZsl6IyEUBLyo+qhdyi3Hke7UtpHa
X-Google-Smtp-Source: AMrXdXtmG7lDs3r0QtSi7I8bvwUMNgjoUJWrIq7/pYmv2MOs6rewBuIdoljaOMoM7eeUWLD4FyV4IA==
X-Received: by 2002:a19:f613:0:b0:4b5:83ba:8c5a with SMTP id x19-20020a19f613000000b004b583ba8c5amr11147777lfe.53.1672406474855;
        Fri, 30 Dec 2022 05:21:14 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id l28-20020ac24a9c000000b004b50b4f63b7sm3452181lfp.170.2022.12.30.05.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Dec 2022 05:21:14 -0800 (PST)
Message-ID: <bcb38702-2e32-9414-2940-04f529edca02@linaro.org>
Date:   Fri, 30 Dec 2022 14:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: rtc: Add rv3028 to rv3032.yaml dtschema
Content-Language: en-US
To:     Wadim Egorov <W.Egorov@phytec.de>,
        "upstream@lists.phytec.de" <upstream@lists.phytec.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Cc:     "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>
References: <20221228140610.938686-1-w.egorov@phytec.de>
 <19f62c10-de9f-88ee-70c3-279efbbcef0b@linaro.org>
 <08d74257-5f8b-31ae-8077-2c73c1430c0a@phytec.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <08d74257-5f8b-31ae-8077-2c73c1430c0a@phytec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/12/2022 12:09, Wadim Egorov wrote:
>>> +
>>> +maintainers:
>>> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
>> This should not be maintainer of subsystem but maintainer of device
>> (unless it is the same person?).
>>
> Hi Krzysztof,
> 
> who would be the maintainer for this RTC?
> I am not able to find a maintainer.
> 
> Can I keep Alexandre Belloni as the maintainer since there seem to be no 
> maintainer for the RV3028 RTC.

I guess it is fine. Alexandre contributed a lot to the driver, so
actually he might know it.

Best regards,
Krzysztof

