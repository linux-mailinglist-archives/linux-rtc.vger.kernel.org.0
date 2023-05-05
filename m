Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 585836F887A
	for <lists+linux-rtc@lfdr.de>; Fri,  5 May 2023 20:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233285AbjEESKy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 May 2023 14:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233234AbjEESKv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 May 2023 14:10:51 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61CB01E9B7
        for <linux-rtc@vger.kernel.org>; Fri,  5 May 2023 11:10:44 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-965ddb2093bso171629366b.2
        for <linux-rtc@vger.kernel.org>; Fri, 05 May 2023 11:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683310243; x=1685902243;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQBt9O9556cUDwM/8n6L+XNwPkEzkVWxHyZle1gkXm0=;
        b=dhCOOHqjNDYtwBV3y73eG5mx+qh8+rmCCbutjJWAHpGAuo3a1SADNxeP7V6Ej4h9O9
         GRqFToP2+KM9688fe0iJg6slfqOGXJxkL4cNLxNnxbG6oeG/2hKLy/Jb7UeqfSVDR5MB
         fW0WGcWirra+BdzZDuYZcYUuB3rEDiVxH8XCLgOjQZ8ghU/AEOXxMg+HxeRQjfRJzduS
         ymW5eF5bXMX/goxPRjvg0Px9eeHwH6PDNPz12dGdqsIWgkgjhaIdRH+nC8Q11QRNljcV
         tqRtsROP7PV9wJzfuUtszTYN3vooF3cWh332P4iLzkRZHVaWmkeni38bXNidH6MnDFiO
         0o/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683310243; x=1685902243;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQBt9O9556cUDwM/8n6L+XNwPkEzkVWxHyZle1gkXm0=;
        b=lMrhvK4irZUAytm66lm3YEtjuTyG6giWwVToY91w2cdaiCsTZbxdSZ+0w3D48JqkLG
         6lTp2hlBNSzohp/qu1IkYJHg8rkGrLn8dneylz20cuuGw3BHaajgwIsXrC/8Dy2yXtZu
         mBJahiWvJFvQmVx7l0xVsgqp1xTh1scoMf4zZaxGKUJpzDAcW5yTOjt8k/nkrO61V1gN
         aFmi52BFZgqpte2AAEFyLPpcaD+PIXG7scN65UU84c7v5vHiEscnoT3AMhbW/irzqiJN
         LG91WChs9o2pvM9QSeDasZNjwJWEjM7rDsoB8bWpeGWkcsL2o9Go6S1ie4Wiq305JcYB
         BTNg==
X-Gm-Message-State: AC+VfDwT3IiXdnhpvyWjmnZzdDDwWBYYJ2EolR1QjzXgUAx0l4Hrxhpy
        k4zw2bvF/ioy0G+kxo88TqJxMg==
X-Google-Smtp-Source: ACHHUZ4CkUu61HPatWQxUGhsYIa4QfVRdHuzWrcLP3IPxF7Im7eghSPNTBdRv5T7vdAgjVLiF3c/nw==
X-Received: by 2002:a17:907:3207:b0:957:48c8:b081 with SMTP id xg7-20020a170907320700b0095748c8b081mr1435683ejb.24.1683310242848;
        Fri, 05 May 2023 11:10:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id t26-20020a17090616da00b0094ee700d8e4sm1233010ejd.44.2023.05.05.11.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 11:10:42 -0700 (PDT)
Message-ID: <a55c7ac8-1037-4509-a16e-83c7894b1a4d@linaro.org>
Date:   Fri, 5 May 2023 20:10:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3] dt-bindings: rtc: isl1208: Convert to json-schema
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Trent Piepho <tpiepho@gmail.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20230505091720.115675-1-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230505091720.115675-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/05/2023 11:17, Biju Das wrote:
> Convert the isl1208 RTC device tree binding documentation to json-schema.
> 
> Update the example to match reality.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thank you for your patch. There is something to discuss/improve.

> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/isil,isl1208.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intersil ISL1209/19 I2C RTC/Alarm chip with event in
> +
> +maintainers:
> +  - Trent Piepho <tpiepho@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  ISL12X9 have additional pins EVIN and #EVDET for tamper detection, while the
> +  ISL1208 and ISL1218 do not.
> +
> +properties:
> +  compatible:
> +    oneOf:

It's not oneOf, but only enum.

> +      - enum:
> +          - isil,isl1208
> +          - isil,isl1209
> +          - isil,isl1218
> +          - isil,isl1219
> +

With above fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

