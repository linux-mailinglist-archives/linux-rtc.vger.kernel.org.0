Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD7D629323
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Nov 2022 09:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbiKOIRj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Nov 2022 03:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiKOIRf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Nov 2022 03:17:35 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58281E73D
        for <linux-rtc@vger.kernel.org>; Tue, 15 Nov 2022 00:17:33 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id a15so16503017ljb.7
        for <linux-rtc@vger.kernel.org>; Tue, 15 Nov 2022 00:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GYVEqyWRIb5M8DvqDeUYgwKR6PMorbc+DxpJvheRTc=;
        b=TqJCj+iF0xcmojTDBuDLqr1AeL6bJ9jOa5Q+rGhcue0HiucpyMr4LZxSGn3fUOgaWN
         MB546udpmn7GTMK6FamliZ6yOM0xFmEaWZ0FAaB8W4Be+RG4HRSwvt+z/ae+viDoe1d+
         Qu7Ho6EjyR7PZeIMtvE9rLe97vl5MesO8sFGAR3oSQGTsZ5MaYGGtFjOOAVnGRM07NVA
         UMf92qW+MN7DXOI+1+r2OIb8dwug4ssjZYHyDrtftTuN5USXfRGFq2pZIi/ITtr8c41o
         GimrzIiUDLZfP8ZrkDLf3BV5vuktAr1HRDJxRJn+SjR41SNt4C5HgciPnj3LgiXPMUVy
         3yeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GYVEqyWRIb5M8DvqDeUYgwKR6PMorbc+DxpJvheRTc=;
        b=B2ODb8sdoSmd5wGXJ8yPuQA+T6/0LYbEYCgMh1TAq39luqvK/5LdvdM3wrA8NB3jsP
         +yPrHjWy8MOYnCMZv0Z45B50fllNRm1/eHQ+6b35pC2Aw6atdVaVT4I8QLOpeqPBqHDI
         /o4UYqzmX06Pfumk/SN5wyAO9wElLmtmh9HNUwMzm1xjGo+aGEkVOxFx9vZdtRmiJW99
         Dx1GmNOUcweMOdVcinsVMbedkwwnGrMY3ueMIcOFOOiq+d+3VPJnSvWs6DOAXMUkgqO/
         qUGxxJtemJ9m+JIFMAru9dmHi08+67oyV3jsTNpLpliyfo6gj0i4MC5tvHa19Lb0wjNp
         JdNg==
X-Gm-Message-State: ANoB5pnoKA76FgCyFHiwszuGV4YOoIyZzIFl7Ir0y6INS/KyYc0JbcaT
        GBTFHbdtVeDbJunxhfDhssnFJg==
X-Google-Smtp-Source: AA0mqf5MXWb0JfEc/1mOlUnuRhtFp0aaBS83d/Ar8w4XBbipn6uUq0jtPrZD5niyiXlKAQweBcxJ6A==
X-Received: by 2002:a05:651c:490:b0:277:5f7e:9cad with SMTP id s16-20020a05651c049000b002775f7e9cadmr5055715ljc.420.1668500252199;
        Tue, 15 Nov 2022 00:17:32 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b0048b003c4bf7sm2112048lfr.169.2022.11.15.00.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 00:17:31 -0800 (PST)
Message-ID: <09495553-e563-e12b-056e-bed95531ab6b@linaro.org>
Date:   Tue, 15 Nov 2022 09:17:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Content-Language: en-US
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rob Herring <robh@kernel.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Fabien Parent <fabien.parent@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Chen Zhong <chen.zhong@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Pavel Machek <pavel@ucw.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
 <20221109222916.GA2985917-robh@kernel.org> <Y2wwUOJ0KZdt1tZ6@mail.local>
 <adf8bc44-4cbc-af2a-4ec8-1859a98146d7@linaro.org>
 <Y3LHxDIzfZWhnQJN@mail.local>
 <37dc4e39-8033-a40f-edd7-4bd30f841e23@linaro.org>
 <Y3NIRbyirJjT7xay@mail.local>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3NIRbyirJjT7xay@mail.local>
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

On 15/11/2022 09:05, Alexandre Belloni wrote:
>>> I checked and it doesn't support it but this needs to be fixed.
>>>
>>>> What about rest of rtc.yaml schema?
>>>>
>>>
>>> wakeup-source would make sense but the driver doesn't support it yet.
>>
>> The question is about hardware - does hardware support waking up the
>> system via interrupt? This is usually a domain of PMICs which still are
>> powered on when system sleeps.
>>
> 
> I'd say that it is possible that a PMIC is able to wake up the system
> with or without having an interrupt wired to the SoC so wakeup-source
> makes sense. We don't need it if it is interrupt only.

Then I propose to reference the rtc.yaml.

Best regards,
Krzysztof

