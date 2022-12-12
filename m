Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61292649A83
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Dec 2022 09:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbiLLI5d (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Dec 2022 03:57:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbiLLI5c (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Dec 2022 03:57:32 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44164F3E
        for <linux-rtc@vger.kernel.org>; Mon, 12 Dec 2022 00:57:31 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id y25so17402765lfa.9
        for <linux-rtc@vger.kernel.org>; Mon, 12 Dec 2022 00:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LXScs9rztSpSkNJbictXJleoicIE9mkkluz/f8rPEuI=;
        b=evszpntVaflCXd4CGXUCTJsFAKUtGM2d5iQZ4WhP2TVqSsqVrwxUgSpH5z8Oq82SI2
         xGonyC70r1Np3X7PJ6SBTCc8enF08988DsryyvFqpYnFYN1KPUprx03KAD4Zc1SZVppV
         TRr1Pnr9ZPFVjpBlo/eBv8ncOO3kElArAJxg6FbzNvykWuVStd3aF+VgG3JzXMm+n9Bb
         nizrGaO8PIFp4SFM/CXWk3yjUI7GGOveNUWgV+K2FzVBMBwDj+tfHyCGjKALYI9qe2+W
         ZyjyUEjc6MkZdCm5dliqevS0B5TBQfEDvkM0idcY/gFDu48pGLDBySQsHAbzhrROcxKn
         Sakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXScs9rztSpSkNJbictXJleoicIE9mkkluz/f8rPEuI=;
        b=cyyRywYaYCiDIjgthwAzBvg6Fgq03Zn5mZ/2103TKM+sTds9mF0t0wEcxPdQxjhT7N
         PjPiUPHHh6VtsvZQvCOpRU/ealB8lB5KHBYo0oHPbEQza+AQKiYGyXrldiFaXg4glrX2
         I9R5MuNIRQV7jMEh8jRnwrpogKw+9R1JuLRSHkOnDaTJWDqQ4ibRiNRbzHOJa753Hjfr
         Xd8UzhFGpppH3g4Di7tZnjmTjwrvsLqj23R3VWN6vp7HtKqI12VRL6XDRwNCeRisQVt5
         aCfpcKuWVNId6M2XF4/H5a9CFTm9Ur2DkG+cqWhmDuz23WVapovOwA6wEBbJx17AEu38
         PjFQ==
X-Gm-Message-State: ANoB5pkY1dWMv5ozuiAWcvHSe17Bu7Ab4UgtXNKG0xe2WZ8VNHl/jXlM
        M5uEMIyVv/3zHwTcmL749OsctA==
X-Google-Smtp-Source: AA0mqf5jImk0G0RSAS+KhYzDbVKkOT9DpX38l0bz8lRsruXfyA5vqggWpIv9IiMGwQ00klhm6n+XTg==
X-Received: by 2002:a05:6512:298f:b0:4b6:ee97:36d2 with SMTP id du15-20020a056512298f00b004b6ee9736d2mr440283lfb.40.1670835449630;
        Mon, 12 Dec 2022 00:57:29 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z10-20020a19504a000000b0048b0696d0b1sm1569757lfj.90.2022.12.12.00.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 00:57:29 -0800 (PST)
Message-ID: <3ebdec68-be1e-fd93-e909-2acd0b400e92@linaro.org>
Date:   Mon, 12 Dec 2022 09:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 1/2] dt-bindings: rtc: m41t80: Convert text schema to
 YAML one
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org
References: <20221211205124.23823-1-marex@denx.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221211205124.23823-1-marex@denx.de>
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

On 11/12/2022 21:51, Marek Vasut wrote:
> Convert the m41t80 text schema to YAML schema.
> 
> Add "#clock-cells" requirement, which is required by clock-output-names.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

