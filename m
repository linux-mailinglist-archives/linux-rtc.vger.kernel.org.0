Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8232C633679
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Nov 2022 08:59:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbiKVH7w (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Nov 2022 02:59:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbiKVH7v (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 22 Nov 2022 02:59:51 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7708E1D0FE
        for <linux-rtc@vger.kernel.org>; Mon, 21 Nov 2022 23:59:50 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id x21so17021994ljg.10
        for <linux-rtc@vger.kernel.org>; Mon, 21 Nov 2022 23:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jWIqopC5oQPso26xwMM2ZxOzw/xY+hIxzsNT5oqWCuo=;
        b=eh14eu1+LOLsZ5dkoMts4lwZOZ1xQkKwMvfWlkfSgjYh5ypNrWQpUB841VQPPOxyF6
         kxJ2v4CZvM6yZPHOTBR+nR3rOFGgdhdfOWE8ILvNS/QQ9LDu3PJkeC4QwIhio9AT3WbJ
         +V/b1sMdJh/9Q+nYZrFGIev4G38Jpl+ceSbQSex1eG4nxsu2hlfZdeV6XkIob+O4haKi
         u/AGkny/rZUqXSjl5+/kXsy04hqW6L0noshfsaVpmGrs2DWL+dK18OS1NMeblNSJ99hd
         EN5KL882dv+NhQBLwYWGPLBQYWkbS2G8L/Doe5YRvxJ5ECzbof+ppjcCe4s5k4cI+NkX
         sgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jWIqopC5oQPso26xwMM2ZxOzw/xY+hIxzsNT5oqWCuo=;
        b=P8eq+u20+qtipBAYI+3no18wrNXLKFvD+DQoliZpHsPSHib0BpcDr9N77AE972Yk5d
         ID8qS7qUmY0iaLUeDFb9MdltwMF8/nFvwcTU+YPB519xcvCZ6vfhiQvEXpvH/vF92klA
         FXLL3mWDrioSJn8Mg06GvYb0shvZG+g1t/JIRxpPn1OAbVLCRzQaicj670rCL1FOEy/T
         t24ZJ7DQqOg9Y+LV16ijLG00VP/KRQiqrWr/yfvyMGp/3XZnm2EU4bYj1EANW2vwEosT
         SorBKXa5FFcQD5V+7iQvL8F/fs32cTc2ceLNtenoxHmmyG/D+waDIiIqh4fVLRQ8CAKi
         mMjg==
X-Gm-Message-State: ANoB5pm4AVTs97XahB3NlHCnuxAT4862QAPlLj2PRRA8meJ/AHNfwXsQ
        bnF5nrxyf+QT3gw4vX/fdoDYuQ==
X-Google-Smtp-Source: AA0mqf6c25W2Jn92KK0myrgYdN6FS+g00Ifx7uFwXtc+3uia6hrGuTpxDqSirCDHAlAivqx5WDlzVw==
X-Received: by 2002:a2e:9e8a:0:b0:277:13a1:187e with SMTP id f10-20020a2e9e8a000000b0027713a1187emr6674438ljk.498.1669103988853;
        Mon, 21 Nov 2022 23:59:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m3-20020a056512114300b004afac783b5esm2334790lfg.238.2022.11.21.23.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 23:59:48 -0800 (PST)
Message-ID: <a7e1e1c4-cad9-988e-7a8e-32941d59214f@linaro.org>
Date:   Tue, 22 Nov 2022 08:59:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Content-Language: en-US
To:     Jacky Bai <ping.bai@nxp.com>, "lee@kernel.org" <lee@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
 <1d93e843-d7bd-a4f7-bb99-4270d9333fa1@linaro.org>
 <AS8PR04MB8642CE4F0DF34A998FBDB50E870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AS8PR04MB8642CE4F0DF34A998FBDB50E870A9@AS8PR04MB8642.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/11/2022 11:30, Jacky Bai wrote:
>> Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
>> bbnsm
>>
>> Also few nits:
>>
>> On 21/11/2022 07:51, Jacky Bai wrote:
>>> Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).
>>
>> Subject: drop second, redundant "bindings".
>>
> 
> Do you mean the redundant 'bindings' in below title line?

No, I meant subject.


Best regards,
Krzysztof

