Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCD46523D1
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Dec 2022 16:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbiLTPmQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Dec 2022 10:42:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233919AbiLTPmD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Dec 2022 10:42:03 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F87F1D327
        for <linux-rtc@vger.kernel.org>; Tue, 20 Dec 2022 07:41:54 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id p36so19141652lfa.12
        for <linux-rtc@vger.kernel.org>; Tue, 20 Dec 2022 07:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GmxYlT7kbjnz4+BVQwx2qKSD93nETDOWxYPXk9LSEM=;
        b=XnsLBt4ps1D+61v0ofse1b8h+uIWRHtilrXEW4QvN0YGPQ+5+ZYD9FR1I3MrGn9W29
         GXtSviSe88KpCXY1DlTLhaUaPhirF1MD0Z2owrRrgxq44lw676WM0dwdmTBH9nwVFrnA
         KqKl6MHriDRop6lwpOjFf4ErX/V1myeC86gd8aylFk1UU6+qUaVSNplFhRgccVO8ZzZE
         E2s6wrj6gryr5VvIoGGqABJOfwV8/NQ42TNPA1bQjFzvFpj9fSlSE5inMIGDC6P/IUbL
         2YTKd3FYizk2gxrSXMsp9TsM50RAUlSXRDM/da1uPfrUEFnUij0Yod0K4pY660pJBFs8
         fHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GmxYlT7kbjnz4+BVQwx2qKSD93nETDOWxYPXk9LSEM=;
        b=hYXB43+eME54xUNR6WQu7LH7oNg/QN4b4leEVmkUhbe6yYgRg8y4kVlLfcuvn4BpfQ
         rQW5GQ1XRGQBKrcyQZPUl2SjvqchJtq+DDs8ZZ+42PpFTHmk7AHCyjclZa/GTogSM4+u
         3InNblKZrPHXqSgD1S36+M4rxL8D5st9qzmQa04k0v7EBITMbeBRpmOSdkMp1rVX2j1r
         AASJlVAEVl6iWs5r9TL4nA2FXuZ4Rb/gg/SQzR++c0oOjY8LLzkwAL+0xeMVIMvlSrT0
         P2WxLsPWcN+7L5+urb3SIDCx43anlM6t15ytr8dLTWxMTQ7Lvi654vbA62Y/2eALV1i4
         Cwgg==
X-Gm-Message-State: AFqh2kqnukxuqVD7xEA1dYEXzGPz0Pbk7jVKln78T0sEbu0cVJCGho1B
        3iKmZ7OuAIzVT69gpAovboRQmw==
X-Google-Smtp-Source: AMrXdXv1ba+0TU3kdys49Fhn3+guIumwisQzB2GtaibE4pbtVEh0A5tsAWeEH0Cw+C/sV6OH73SRKQ==
X-Received: by 2002:a19:8c45:0:b0:4b8:c214:a345 with SMTP id i5-20020a198c45000000b004b8c214a345mr7480562lfj.26.1671550912687;
        Tue, 20 Dec 2022 07:41:52 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c20-20020a056512325400b004b57d186aaasm1499600lfr.249.2022.12.20.07.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 07:41:52 -0800 (PST)
Message-ID: <6ce8b03d-8e50-a896-89e5-7b475057737d@linaro.org>
Date:   Tue, 20 Dec 2022 16:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] dt-bindings: rtc: pcf2127: remove pca/pcf2129 from
 trivial RTC devices list
Content-Language: en-US
To:     Hugo Villeneuve <hugo@hugovil.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     bruno.thomsen@gmail.com,
        Hugo Villeneuve <hvilleneuve@dimonoff.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221220152237.1125178-1-hugo@hugovil.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220152237.1125178-1-hugo@hugovil.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 20/12/2022 16:22, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> pca/pcf2129 devices can also have the 'reset-source' property, so
> remove them from the trivial RTC devices list.
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

