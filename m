Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89E5B760FE8
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Jul 2023 11:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233380AbjGYJ5h (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 25 Jul 2023 05:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbjGYJ5c (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 25 Jul 2023 05:57:32 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1CF10EF
        for <linux-rtc@vger.kernel.org>; Tue, 25 Jul 2023 02:57:31 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-992acf67388so784907266b.1
        for <linux-rtc@vger.kernel.org>; Tue, 25 Jul 2023 02:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690279049; x=1690883849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wC6uOAAWWshiU7HM0RaHJ6XLqbUAShyDQVdsD3q4R3A=;
        b=mVZGMZlCiF1F6HADarxCSEJ1MaLMUtXiR3oM2qyw2oGwaGxxU7SwWx4LwS3BmlM3Bv
         ytMZ4w23uqOjuxcrrQM47eHvV4QXgFGAUoc4enoBm7nt7QMgcNB7tCVduRauDCN3uLc4
         M1D1RGNM+k21uF4lgcSf+0UCq/47yuxXI4ZbBv6LV1BPjRyUNfXu3Jv42aN2OEu34Mqs
         KKZGZ3LMkUO/0/+E+mCG3x4EhYaQbg4gVzjbjTtvd3KudbzY3uPdSyt7ApuWzO599Hfx
         scuMwYTBeVjHFfoJjHW1KVup4wWNXJ6A5LhlwkD3YcbnPra2xfDdtONBPUCGBrZITYK6
         uxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690279049; x=1690883849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wC6uOAAWWshiU7HM0RaHJ6XLqbUAShyDQVdsD3q4R3A=;
        b=iwTM+IRR/za1enPiNCfdSz3zqgeU8u2TVg5za17pCePgOH11R+N3/YWMD07FyKoAk3
         8+0S6z8zGM7blOVnjjzFDZcFh/4q/uCB4SwD0tuBiV+JCXYeG6hKY+o3Ord9ZAhYlxau
         63nuFuYt5vHZl6ALe86Dd5QNo5zPPpkJe+8l+3iGNWubGWV5icH4UVu3r9DvgJkgRATe
         mPRuJQTt8LbNxBRd5yUL9Ixd4CMaiX/KX56tr1wZstO83uJq0cmd6+MG3MW1wtId6I68
         rwoqyOLqwLrFlTIopotov/qUtcn97kUsa0E8nGCgiclX2UpDkjryaTT5asqBLGiyBWAO
         h6ig==
X-Gm-Message-State: ABy/qLbljFq+wGt/EZCohseSmMnZ8oXMzt1YZccVCelFm2n/NP5Dfp4z
        aX64+XG224xFNutYGaK7tgXgIe6zOo1Gjq1aAYc=
X-Google-Smtp-Source: APBJJlEPuZg32/18BhFO9sCz6xyx84ncx78sRSeoQ4NSWs2kTf61C9KzuN6EfDO1IbzjsJhDu7dLpg==
X-Received: by 2002:a17:907:75cc:b0:99b:4890:812d with SMTP id jl12-20020a17090775cc00b0099b4890812dmr11202687ejc.16.1690279049518;
        Tue, 25 Jul 2023 02:57:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id lv19-20020a170906bc9300b00989257be620sm7853476ejb.200.2023.07.25.02.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 02:57:28 -0700 (PDT)
Message-ID: <6f899f68-a44e-ef50-4236-007a73eb0431@linaro.org>
Date:   Tue, 25 Jul 2023 11:57:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: Add Nuvoton ma35d1 rtc
Content-Language: en-US
To:     Jacky Huang <ychuang570808@gmail.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        soc@kernel.org, mjchen@nuvoton.com, schung@nuvoton.com,
        Jacky Huang <ychuang3@nuvoton.com>
References: <20230725094030.32877-1-ychuang570808@gmail.com>
 <20230725094030.32877-2-ychuang570808@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230725094030.32877-2-ychuang570808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 25/07/2023 11:40, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> Add documentation describing the Nuvoton ma35d1 rtc controller.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  .../bindings/rtc/nuvoton,ma35d1-rtc.yaml      | 48 +++++++++++++++++++

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

