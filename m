Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88686766D71
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jul 2023 14:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236621AbjG1Ml7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 28 Jul 2023 08:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236632AbjG1Ml4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 28 Jul 2023 08:41:56 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BDB135AF
        for <linux-rtc@vger.kernel.org>; Fri, 28 Jul 2023 05:41:54 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99bcc0adab4so301079266b.2
        for <linux-rtc@vger.kernel.org>; Fri, 28 Jul 2023 05:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690548112; x=1691152912;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oZA4aHFjQ7Ch7a3QY8j0IeMoQGnQDYHCMHMl4h+0UZQ=;
        b=HJHrKSL94p1ht6xizgAd5MCYor6X5/6qQnde2YChwhfIIBucbUffnfxVdtQmGuulFs
         0BU0gCd4Etkk8SomlP3DPdlmB5Hb84P3lfkvhg8Ukto8pqv58q9EHqMy4BmA6KmlOb4r
         NaRJZuWAbdShniRz9xp0ShV1BufKr0S8B1DoEdEGzuelPEYKJi/4IOmDcmOB1c/fbMHI
         79+ZpIbwXTXfL75HAU2tUp1GhBmasT9h0FG4tH0pcfbIHmvkaIWcLXbjrrt1MO9dIBWk
         A0Iv7iFlopD/zTPtxXzI1Zlsc62JkXlYeU2sSlMyZg+V2s1WIVhSyw/RIGhWkxy/RDOC
         sd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690548112; x=1691152912;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZA4aHFjQ7Ch7a3QY8j0IeMoQGnQDYHCMHMl4h+0UZQ=;
        b=JXttWie50U9JSgHc/24wUFY/yaYxMd4tHQinkbou9o7yQHoI9EDzhlf2TTECLv8cMz
         rVtiBINdTHHuczzVGw3DnnJG7AyMkdWSyZRP3viFztpBaE/bVR66K5ifMoLKgbOAiU91
         7cDhhOpkHJcYcldW4rbiWOQjVNeKuTMsyGwJu1B7lCztEivRQyn+S6NqhM1g93yT37MU
         caywA5mdsKfaya6hA5m32UBDZqyDFh7VNN/5cpITtzMsN8gdcH+8Vg+Cif+hOzX3Irds
         d6wWl1pWqf62vFbJI5GKfYnPjNQ80y6Cuy8kxZ2bVU7oukOsYATHBfLiwv56KsIzUyFY
         OoSA==
X-Gm-Message-State: ABy/qLYk0Cp8Y5sjcHkFHQVJn8283/KefhZtrQwgC5spUvc5KtmIMStu
        k436cOqqBTmEWp9AEcE98WP+KQ==
X-Google-Smtp-Source: APBJJlGa5JkcSktIsx2FKNquSsQjbHl7+Ww2Ljx0aQ4og5B/6Wpg/DpZAJreUlrUAg0GcEaD5X4epg==
X-Received: by 2002:a17:906:3f16:b0:99b:d977:c00c with SMTP id c22-20020a1709063f1600b0099bd977c00cmr2021150ejj.45.1690548112678;
        Fri, 28 Jul 2023 05:41:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id sd26-20020a170906ce3a00b0099bc08862b6sm2044794ejb.171.2023.07.28.05.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 05:41:52 -0700 (PDT)
Message-ID: <3d6d583d-0db8-7de5-cec6-105128cd011f@linaro.org>
Date:   Fri, 28 Jul 2023 14:41:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 23/50] dt-bindings: rtc: at91rm9200: add sam9x7
 compatible
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, nicolas.ferre@microchip.com,
        claudiu.beznea@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230728102710.266457-1-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728102710.266457-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 28/07/2023 12:27, Varshini Rajendran wrote:
> Add compatible for SAM9X7 RTC.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../bindings/rtc/atmel,at91rm9200-rtc.yaml     | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

