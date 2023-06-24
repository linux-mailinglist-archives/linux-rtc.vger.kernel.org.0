Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E61173C7F1
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Jun 2023 09:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjFXH7o (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 24 Jun 2023 03:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbjFXH7n (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 24 Jun 2023 03:59:43 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C77E1273F
        for <linux-rtc@vger.kernel.org>; Sat, 24 Jun 2023 00:59:40 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-988c30a540aso158109166b.3
        for <linux-rtc@vger.kernel.org>; Sat, 24 Jun 2023 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593579; x=1690185579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JmZczCbpOdE83RS1Jg0IHZhGZBw+0h6TxJ0xSKGXpQ=;
        b=R3QjgEeu0SyVI2lDD0gF/mGGjC5l0xnsrF0U9MS0AWWSj8UlJYzroCkC1cYsnjqZdl
         BzpLsrAuOKn29IaswtTcZdkJNSfWnQleG3C6ZdH9XWhRbB/SKyi8sCQGlFDwD6xsXGuP
         kmXmMzlN1dUYqxzKx8uwQEcphW3mVPAWM6Ex6Zk41Y1+4AHsy17OsciQHWMC5iqsCIQp
         xgEjDKsBw0XHepXwvs0wO7a1D5N7PoR7VcNjyQ3ZY2nJoTGH/Q/E8I2tlEh4XuPggliv
         39av2i6EtrySSSH4jPALRV1rB4Pltm1L//Y2Dkb6C7rR0iojQsrFOeIKnevRsMXfqE8t
         p0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593579; x=1690185579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JmZczCbpOdE83RS1Jg0IHZhGZBw+0h6TxJ0xSKGXpQ=;
        b=lyvKCowQwJjMY0BIF7A/aYdujm0heb3O3eApBRbjZ2rHFj8kKSjNd/1qIeZkUNWGvw
         kwRmknDWgfwY7shHwhgS/En/A64awhPjTEboMuDkOt7iP4CZv5mepuQxkmlo07RqywYj
         mfiHOlpt+DU9gIbQzPwPqcm5jRah+YwHFvmfSnrOMnsGDl2r1N/9SXQy1zravvRl1kOc
         5CwqetXS4ke28T8yUdnFj4zxeRM8iTml4ud1bvWmfqJ2WwsVFcSpA+npCOJfw5YV0dXm
         MOfe40ubBiQ/uVUxrUg5QBVte3WQFH4HeEwgJI4bybAX9rDzxfuATzNG8X8zQhWwFkdK
         6daA==
X-Gm-Message-State: AC+VfDyHIYzsANp9ikpVOvznBiBsQVFI21JYQzi3/Asvvx4MQMh+z0jX
        YUm2SjwFTVYPk1ZU4smVp1ApRA==
X-Google-Smtp-Source: ACHHUZ7suzN5/2BEJw/pDsP2JF0ZtjamK/L1/904JX+bl8LiLRiewrvSQqyW/+nam/ghVhSAGJ3L/A==
X-Received: by 2002:a17:907:84c:b0:987:783f:449a with SMTP id ww12-20020a170907084c00b00987783f449amr14721000ejb.11.1687593579095;
        Sat, 24 Jun 2023 00:59:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id pg10-20020a170907204a00b0096f67b55b0csm598213ejb.115.2023.06.24.00.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:59:38 -0700 (PDT)
Message-ID: <efec9572-f717-ec26-0f26-a79fcfee27cf@linaro.org>
Date:   Sat, 24 Jun 2023 09:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 15/45] dt-bindings: crypto: add bindings for sam9x7 in
 Atmel SHA
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
 <20230623203056.689705-16-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-16-varshini.rajendran@microchip.com>
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
> Add DT bindings for atmel SHA.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml    | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
> index ee2ffb034325..6a54cb79b6e2 100644
> --- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
> +++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
> @@ -12,7 +12,10 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: atmel,at91sam9g46-sha
> +    oneOf:
> +      - items:
> +          - const: atmel,at91sam9g46-sha
> +          - const: microchip,sam9x7-sha

Same as in other cases, so just to avoid applying by submaintainer: not
tested, broken.


Best regards,
Krzysztof

