Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2FFD73C934
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Jun 2023 10:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbjFXI0c (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 24 Jun 2023 04:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjFXIZ6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 24 Jun 2023 04:25:58 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A687935AE
        for <linux-rtc@vger.kernel.org>; Sat, 24 Jun 2023 01:24:27 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-98e0c1d5289so3826766b.2
        for <linux-rtc@vger.kernel.org>; Sat, 24 Jun 2023 01:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595048; x=1690187048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jNp0SuVUZqVVXCRqHhi3K5MkR/+Yy6bkXmBLVP0jnFg=;
        b=jhYOBsx3HADGCmeOqC6OjCZWNkO5/KTJfDVpw9J6lmEYmzL5HiXwDoc239Cv1lfpAf
         jZ1XFPIoeL3qlalJCxA0FhaGi7vzgisq9Z8HOrSMSOCtij2l1Vf8wC622ZWBSEI6w9Bv
         tb/zKAvq6RYZE0HuVOvxnBDwjvM9Co7tSVBLYpcHDPpAVMhQKB/QyiaZKtzCg35YId42
         690WWPFxeJmJW8HpMj1yM1JCQEfATMKKorKORK21ugqiPL/Y7AYQYIQA3iuYHH2rG9hn
         wKyxDMr3m+KLB5VpzAfFpv9YauEKhIHvu67lLHXen5m4ofDu7Y0eX56xxmPGhBa8yEhc
         WSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595048; x=1690187048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jNp0SuVUZqVVXCRqHhi3K5MkR/+Yy6bkXmBLVP0jnFg=;
        b=coyi8BTZJ6e3+CUGb07zqvTFGd43E49M4K9aS7WXT9BxvYXcf+TmPIDeSWem/p2U5I
         KllBejPPc3XKvn1sg3oqTsJj0gm+OEkAcAV4H4XXEdEu3lEqaEtKG71BkBlRPaAVYhe5
         ngdLyjPS4dQyNbOG6Hj9dDbZSAtiZzpdZof952bxvy5uVcf+p/wTftRq03xa2Qhe5SIw
         QIeqTwlkz5msoBB138vrzzajL1K48Eubv/xs0SCF6zRI1aCy44pF67aBIJpXb9Ts9Qj+
         U2xTpF4igKaKLp+YjNi7M2rEth4xtwzccqMHQIddFJrHYtC65FzJG5thuZig1R+MD6MD
         9N3g==
X-Gm-Message-State: AC+VfDyiUrtQeqP976alteNPCnJapnAExTWvC4O79U6b2GosYO/FlhYd
        2gay4niQ0JCvValbmQMe+/Dxfw==
X-Google-Smtp-Source: ACHHUZ4gGdNTR0CSjAVHFIlEksa5SJdwiZGS08Kq1pYOdg+zg0I6klkaiPnVTZufYDi7QamMvR/5Yg==
X-Received: by 2002:a17:907:9706:b0:988:bad4:e403 with SMTP id jg6-20020a170907970600b00988bad4e403mr14932362ejc.55.1687595047903;
        Sat, 24 Jun 2023 01:24:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id qp7-20020a170907206700b0098d0c01d9aasm621791ejb.87.2023.06.24.01.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:24:07 -0700 (PDT)
Message-ID: <f1a8a04b-4620-5bea-1542-0e425a95182e@linaro.org>
Date:   Sat, 24 Jun 2023 10:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 21/45] dt-bindings: atmel-matrix: add
 microchip,sam9x7-matrix
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
 <20230623203056.689705-22-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-22-varshini.rajendran@microchip.com>
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
> Add microchip,sam9x7-matrix to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-matrix.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-matrix.txt b/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
> index 89d05c64fb01..75378839fc7f 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
> @@ -14,6 +14,7 @@ Required properties:
>  			"atmel,at91sam9x5-matrix", "syscon"
>  			"atmel,sama5d3-matrix", "syscon"
>  			"microchip,sam9x60-matrix", "syscon"
> +			"microchip,sam9x7-matrix", "syscon"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof

