Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDA973C912
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Jun 2023 10:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232761AbjFXIXy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 24 Jun 2023 04:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbjFXIXj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 24 Jun 2023 04:23:39 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB6F1992
        for <linux-rtc@vger.kernel.org>; Sat, 24 Jun 2023 01:23:36 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51d7e8dd118so543836a12.1
        for <linux-rtc@vger.kernel.org>; Sat, 24 Jun 2023 01:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595015; x=1690187015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iw/ywJG51HUTwkPghusRkjWUXteVCmP/Fv5gaFgQqkU=;
        b=IsOfPPALsc6kgiSVlUoR59ZJkgFCtFF5TGUwt1sbTFoWRMQOqCvWPTIR5S4VBZ7wwO
         U+Tfcj6D2UZWfSg6R9maL5SVaczzgRsCGFn3w3hx97Rmn0RbCb+dz8mN7fo1OhBYO1YQ
         54oNjUFMACNKqmgtbF97PqAckUG/2az/K+ImnC3CequpWgOAVohV3SkCnVPNu1hfXpIY
         qSBKOgbw6rHxDUkAQDvMik5GXkFpd4yw9FALSXz9sR/ZAgWV+QM0FhTv8QIuM4SSMc+2
         /nbK/R/EUUxlTLqExeuaZfJ7NLx2+2g0GulfxjKCtNGXlBg5sxnH4072KmidxffszrB8
         88VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595015; x=1690187015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iw/ywJG51HUTwkPghusRkjWUXteVCmP/Fv5gaFgQqkU=;
        b=eq4EV4nH7lvQNSSfOgToXLMYncIqVmVr9MW7/6k9npyYSzo05hLb5fnLUJjgwNe3fc
         gPyi/Cn7/7DZKUuZXh6Tr/1vuDm4S4eZRDcO9LsSLujlayfqABif6plcKy4X7K+5qTcV
         o2vCBS3KXJX6VxFaQBX07CHbBwGYwtBXcwnHWkYSYcbGvOZfVrBAA6Ie0HDSi7nfTSNj
         Uomfs28XKOvB9h42QqaTmZ32hvHcTZwVteySC+t0yFjC1bjvhLmjHWUO5AVeZk3+xtvX
         4TAY+zr/9wpNLtHhjCUoKZ8aDk65YSIg+6j16EPKO+0g8IV1s7wwg4ss7WwqGPMTVzp/
         +MsA==
X-Gm-Message-State: AC+VfDzprJoA3m1QxgsiaMk039YgE4VlIXTIVfTk4Y5ZT2SoOLW5xnMJ
        n1AdEj2Lj7Ab+6rO28cpAQELkw==
X-Google-Smtp-Source: ACHHUZ43qIJ7DSZr3vq3pOJ8EpVNA3z/s2kop3/I0gBWTVNNyPwlCA/pGa/4aeeS2b9dek8ZmCoz3A==
X-Received: by 2002:a05:6402:550:b0:51a:543b:2c8c with SMTP id i16-20020a056402055000b0051a543b2c8cmr11889190edx.35.1687595015160;
        Sat, 24 Jun 2023 01:23:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id m16-20020aa7c490000000b005187d2ba7c1sm419224edq.91.2023.06.24.01.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:23:34 -0700 (PDT)
Message-ID: <e7f7eab2-7fbc-99ae-641b-075ff0610127@linaro.org>
Date:   Sat, 24 Jun 2023 10:23:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 19/45] dt-bindings: mfd: at91: Add SAM9X7 compatible
 string
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
        tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
        ulf.hansson@linaro.org, tudor.ambarus@linaro.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        linus.walleij@linaro.org, p.zabel@pengutronix.de,
        olivia@selenic.com, a.zummo@towertech.it,
        radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
        gregkh@linuxfoundation.org, lgirdwood@gmail.com,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, sre@kernel.org, jerry.ray@microchip.com,
        horatiu.vultur@microchip.com, durai.manickamkr@microchip.com,
        andrew@lunn.ch, alain.volmat@foss.st.com,
        neil.armstrong@linaro.org, mihai.sain@microchip.com,
        eugen.hristev@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
        balamanikandan.gunasundar@microchip.com,
        manikandan.m@microchip.com, dharma.b@microchip.com,
        nayabbasha.sayed@microchip.com, balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-20-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-20-varshini.rajendran@microchip.com>
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

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Document sam9x7 DT for flexcom.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-flexcom.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> index 9d837535637b..449e0af93a13 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> @@ -5,7 +5,7 @@ controller and an USART. Only one function can be used at a time and is chosen
>  at boot time according to the device tree.
>  
>  Required properties:
> -- compatible:		Should be "atmel,sama5d2-flexcom"
> +- compatible:		Should be "atmel,sama5d2-flexcom" or "microchip,sam9x7-flexcom"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof

