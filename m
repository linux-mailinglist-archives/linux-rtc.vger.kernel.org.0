Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEE06049A5
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Oct 2022 16:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiJSOr3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 19 Oct 2022 10:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiJSOrL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 19 Oct 2022 10:47:11 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33D4193463
        for <linux-rtc@vger.kernel.org>; Wed, 19 Oct 2022 07:34:18 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id de14so11477235qvb.5
        for <linux-rtc@vger.kernel.org>; Wed, 19 Oct 2022 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vDB5k4w9Nrimwa6bfe7vGx28PGhXZqRaVOrj+g1S1+o=;
        b=TU2nkFx3sV4Z42wKZfEmu4cF0mBsiW36dyAGC1c6axQGVI+U6sqzTi+3+Q16y352cQ
         hmv9ohn52g1yHqQxZU8mhX3kpV/X4SNXOuABzmym4CDf3+32f4wpJbr2jdEmV0Vc+PMq
         r0E3qm45mrzUFasazIT8WCS+PSccx78cA1SnQ0vlRL719LBU46+ZcZ7Z7vLK48QqvVm5
         enV8D6RfUm27wfJz6ycORbgCBfSxKro/g0LWrLhaBiumW3ZF1sefS/wwef1pmkWN3SU2
         OhetK4iimfMEkPD8fniFfQa+GCwV8rq+MzJPRRWA1mmx+YTWOrBziklxESdgVaM85OWe
         yqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDB5k4w9Nrimwa6bfe7vGx28PGhXZqRaVOrj+g1S1+o=;
        b=GraSO1ox9PkXXkAShE7v83X7LtUHOHLIRrjRJl9aO2bBnGr2UgY7N9UQKfoC2MQ7ga
         g23xqmkWoH/bLvqJymVkRaUtiTnZ3vopln6KdWVdOLYAmTgDe2iTzYpJ4TTuQEtCVxeS
         jz67ifpiACsXQPKmWhCt3lpsWrcmPpVUKEs9nryNa1yuwWvwe03DPTyS16KOauyVzqAm
         Zoh7rIoPKQdWQ08uv8vxy4U4oWT6YRgyAgBPr8WWyuHIHDV7rHZM2S34Cs22/ONNCVCK
         DKWkgUBT/chdtOoua9r8iWjnjPe8b7g+hpuEigWic/E1f7u9KqOXeCJUtcnlRAv+LjiP
         hnoQ==
X-Gm-Message-State: ACrzQf1aGX2tMKWoxlxu6nmHOWA0Q2MvSWGjPLSMfcAnc4YH+YiHqE2D
        Ym+kuAGW60X453YAIN3LreAQjg==
X-Google-Smtp-Source: AMsMyM6RlQFofNXPRmQ9/EbwSwPYRuf1EIY7RXrfGjDeKu6T2Wc3g1yx/VmnDJPrJKvHvbdYpJMDsA==
X-Received: by 2002:a0c:9c8b:0:b0:4b1:ac82:5c50 with SMTP id i11-20020a0c9c8b000000b004b1ac825c50mr7057179qvf.15.1666190056795;
        Wed, 19 Oct 2022 07:34:16 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id q2-20020a05620a0d8200b006cf9084f7d0sm4944260qkl.4.2022.10.19.07.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 07:34:16 -0700 (PDT)
Message-ID: <3d07998b-f02a-036c-af66-883671ac1730@linaro.org>
Date:   Wed, 19 Oct 2022 10:34:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/2] dt-bindings: rtc: add bindings for max313xx RTCs
Content-Language: en-US
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>
References: <20221019133910.282-1-Ibrahim.Tilki@analog.com>
 <20221019133910.282-2-Ibrahim.Tilki@analog.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221019133910.282-2-Ibrahim.Tilki@analog.com>
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

On 19/10/2022 09:39, Ibrahim Tilki wrote:
> Devicetree binding documentation for Analog Devices MAX313XX RTCs
> 
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> Signed-off-by: Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>
> ---
>  .../devicetree/bindings/rtc/adi,max313xx.yaml | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/adi,max313xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/adi,max313xx.yaml b/Documentation/devicetree/bindings/rtc/adi,max313xx.yaml
> new file mode 100644
> index 000000000..1aa491799
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/adi,max313xx.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2022 Analog Devices Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/adi,max313xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices MAX313XX series I2C RTC driver

Drop "driver" unless it is some hardware-related term.

> +
> +maintainers:
> +  - Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> +  - Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>
> +
> +description: Bindings for the Analog Devices MAX313XX series RTCs.

Drop "Bindings for"

> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,max31328
> +      - adi,max31329
> +      - adi,max31331
> +      - adi,max31334
> +      - adi,max31341
> +      - adi,max31342
> +      - adi,max31343

This looked familiar... and indeed it is.

https://lore.kernel.org/all/a382fdee-3672-50b8-cd58-85563b9d9079@linaro.org/

Where is the changelog? What are the differences? How can we understand
what is happening here?

Best regards,
Krzysztof

