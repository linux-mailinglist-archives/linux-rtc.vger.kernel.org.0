Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1C4571357
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Jul 2022 09:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbiGLHoF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Jul 2022 03:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232428AbiGLHoD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Jul 2022 03:44:03 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E5D18345
        for <linux-rtc@vger.kernel.org>; Tue, 12 Jul 2022 00:44:02 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t25so12547659lfg.7
        for <linux-rtc@vger.kernel.org>; Tue, 12 Jul 2022 00:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IcFrG7t1EG6LUI4c3DzqfIRW/OXm84QSXfjqhXP1IYs=;
        b=iZao2i3gruwi0t0F9xRxQ9CIzUnn7yKtBShxLSHZCUyxi7vmQHEoKW4fRB4VQ/EPUr
         RgDINDZVpq0Lbgvm7+f3rIn4wmhb11HVo/zS20X1AkyWeZZC9cRQmgdFDReS3k6TfbKt
         uAs33ywFzgz6MT2l9yG6MRBz4pZAM+VwbBsiJG/7ukMJNLKsGBeOsbPc2hNUGs9FSuXO
         UJH5ZJkmbirbHQPXyEU+iDCO1AJ3cRws5oJdGriJALuKCiTkQBp1kpHBdZ1MmSvSURGH
         h7QXLZkwzxVs81XKBVPMnDZGJGP9qwiq23z8zWw6J0wLaZdJ27umIuBQxptqiiTXvUJk
         prsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IcFrG7t1EG6LUI4c3DzqfIRW/OXm84QSXfjqhXP1IYs=;
        b=nS/roAa7g08TWe9EcdWKM7yT/w3y888p+dkKyZUEVU+nZj5XuRaupckn72wycBb6a1
         C8qAtNCR26yxVKml2mqXmrTuR8KnPxgOSP6LuOvQD/kJ3rpgQBxTYDJSKebKYAwn1rRu
         uIpAE2SLZP6qnBog6vj9vcMCqzd5nIPbkDs9gs+m/OVjZI9c181Ddd0r48W8bSZrvlQJ
         MA3DzS210dlwiuQibR0Uv6K5zhYgsSzbSUU+SjIbeldfgLnsk3ZHKUuWTMg2lvmeqm1v
         eg3rxWUv4eHZIVuWlPA61EVE2RWEWDoo2lcciV3U38w6S8JNY0ENgAVcZaSJK1BiCd1q
         G3/g==
X-Gm-Message-State: AJIora+Rj/a0kiqQ/wbUii1pb1/XGZu0PdxNvMxuPACQx2gE06Qn3Dg3
        7Z8al43ngoFPJUeMLRjlvx1FBQ==
X-Google-Smtp-Source: AGRyM1vH1RckPSHeD9P9D+rwKoIv7LbZk2zdF3MOx+FgD60g2vYvqUjSBlEphiWuGj45r7x+fu3/jA==
X-Received: by 2002:a05:6512:e9b:b0:489:e034:cfc9 with SMTP id bi27-20020a0565120e9b00b00489e034cfc9mr4978432lfb.366.1657611841048;
        Tue, 12 Jul 2022 00:44:01 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id c19-20020a197613000000b0048110fd06c4sm2027346lff.53.2022.07.12.00.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 00:44:00 -0700 (PDT)
Message-ID: <b9268cfe-2428-65c9-979b-522e4a43f955@linaro.org>
Date:   Tue, 12 Jul 2022 09:43:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 2/3] ARM: dts: nuvoton: Add nuvoton RTC3018Y node
Content-Language: en-US
To:     Mia Lin <mimi05633@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, ctcchien@nuvoton.com,
        medadyoung@gmail.com, KWLIU@nuvoton.com, YSCHU@nuvoton.com,
        KFTING@nuvoton.com, JJLIU0@nuvoton.com, mylin1@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220712030509.23904-1-mimi05633@gmail.com>
 <20220712030509.23904-3-mimi05633@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712030509.23904-3-mimi05633@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/07/2022 05:05, Mia Lin wrote:
> Add nuvoton real time clock RTC3018Y in I2C node
> 
> Signed-off-by: Mia Lin <mimi05633@gmail.com>
> ---
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> index 3dad32834e5e..589aadb67688 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> @@ -202,6 +202,10 @@
>  		reg = <0x48>;
>  		status = "okay";
>  	};

Missing blank line.

> +	rtc0: rtc@6f {
> +		compatible = "nuvoton,nct3018y";
> +		reg = <0x6f>;
> +	};
>  };
>  
>  /* lm75 on EB */


Best regards,
Krzysztof
