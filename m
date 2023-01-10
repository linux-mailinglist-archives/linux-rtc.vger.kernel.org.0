Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B44CC664115
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Jan 2023 14:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233574AbjAJNCI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Jan 2023 08:02:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232715AbjAJNCH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Jan 2023 08:02:07 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFFBA52742
        for <linux-rtc@vger.kernel.org>; Tue, 10 Jan 2023 05:02:06 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id bn26so11680478wrb.0
        for <linux-rtc@vger.kernel.org>; Tue, 10 Jan 2023 05:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bXYjCeQ9QtsFL8nXtTdmpHyzQI1y6u5sI6jbDwGL5SM=;
        b=R1uVAm7JLu/x7Lcqhyz1YRS0ajuGV+VRK6KwnsG6kAlPe769mSDTbTeD2u9Ej0Gwz/
         y0GdsZqdcqu/D/o38hLxTZjmvQ2WA5PeK3M0gqoEN4RhHU6IPVphbDXuroDxP768adbI
         wfN8JY7SgaBJAqEwF7k7qNw2LARDOPORXIts9AYzGsj28IhsQ8uoKMYo6/KSCQk0lYMr
         kTguF3dXyIqd14IU8qg5iaUV6+AipPgVUPDqyluJtIWeNbsDcg7vIVNKHPkPzH8IuaKy
         I6uoAnibychZmN+VHdCYei2UQzkJdAOuv+DltFdeXXxLk16OaMfnyNy4p+gkvR4V8tYd
         rFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXYjCeQ9QtsFL8nXtTdmpHyzQI1y6u5sI6jbDwGL5SM=;
        b=v0hEoiUiSpk8L1cZrwRX3KS9cEYx5t9LFWZFgxGBTOTBN59d0VA9K/IkCOi6VSrSQX
         SLodY0VnC2uhK7Ci1O5nWaXmvZnTr/DkfW6ZP8gbaPQ49El0ViVPyBQYKNfLD71AGPK3
         EGVwsI+tNymtMMjJre0l8NFhovva0eH6z30L2hQyg2rffDuLAA8NlBlGqNaOtYQs2o1K
         MDKLCPJ/BDA7twCUois8ELzeZ+w6ov+zGcid/zoXBHLG/eFT+F6uT/iEfBNF52Ryx+rk
         4BE14x5iLrjCFaJjGZXCXe7/s3NhTO05c7k+qoe5k6XwlimkarmoPOOfbfrClj6bvzmi
         Xe/w==
X-Gm-Message-State: AFqh2kr7k1gqdFI9StLIoVdCWimtFazYINJYAAMYpHtFFdXeW00Pah4W
        l9eq0AX4O9E1KlPfCL/Imb1Y6g==
X-Google-Smtp-Source: AMrXdXtl75e7E+BZquNgpJ2OWcid0C63zHWVvYENd5qmfR3H73H+RWSvhij+LCTdGK5AYuCUMxeFyg==
X-Received: by 2002:a05:6000:888:b0:2aa:438a:2165 with SMTP id ca8-20020a056000088800b002aa438a2165mr16521627wrb.24.1673355725298;
        Tue, 10 Jan 2023 05:02:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t17-20020a05600001d100b00241d21d4652sm11078676wrx.21.2023.01.10.05.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 05:02:04 -0800 (PST)
Message-ID: <b0189f64-59f1-6ba2-489c-383bd953cf2a@linaro.org>
Date:   Tue, 10 Jan 2023 14:02:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/3] dt-bindings: m41t80: add xtal load capacitance
Content-Language: en-US
To:     Dennis Lambe Jr <dennis@sparkcharge.io>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Atsushi Nemoto <anemo@mba.ocn.ne.jp>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20230104052506.575619-1-dennis@sparkcharge.io>
 <20230104052506.575619-3-dennis@sparkcharge.io>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230104052506.575619-3-dennis@sparkcharge.io>
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

On 04/01/2023 06:25, Dennis Lambe Jr wrote:
> The ST m41t82 and m41t83 support programmable load capacitance from 3.5
> pF to 17.4 pF. The hardware defaults to 12.5 pF.
> 
> The accuracy of the xtal can be calibrated precisely by adjusting the
> load capacitance.
> 
> Add default, minimum, and maximum for the standard rtc property
> quartz-load-femtofarads on compatible devices.
> 
> Signed-off-by: Dennis Lambe Jr <dennis@sparkcharge.io>
> ---
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

