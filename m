Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9ED7657797
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Dec 2022 15:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbiL1OPe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Dec 2022 09:15:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiL1OPd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Dec 2022 09:15:33 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED0AF006
        for <linux-rtc@vger.kernel.org>; Wed, 28 Dec 2022 06:15:32 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bt23so7131501lfb.5
        for <linux-rtc@vger.kernel.org>; Wed, 28 Dec 2022 06:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bb5VE92HvqMkvu07M8W8ScVtWEViswCGwiVBS6hECLw=;
        b=dN7IxG7cy/bBlfHTRcGjHlMBNp/UJuntApnzsYBUBqen5rlWnrkyFMkkJ7Ipwmm5Xg
         kqakSsj0O3VIdlLmdRY9w8CZQZzAj4oqbktgvoO/pIL9gT4m8wfb6Tj/4fjx6Crwm7Iy
         5cWmLr+zU33dBYVg/SapmDyBVsN7AhjfJH5IzbOk9XQOdvqLBDTYnHFQ6zjaAz2CuKCW
         l9tOrwb22pupVbLYhLXljHzmM0P/alt8NhL/z8d3KsrxLb7UxTZONNJJYvCTrIIDzKSq
         GeyQs7uh2RdLvYqLrD8n2YjiSFUumd4ZkyCEFxPxFSEYEKYF8WYaOWNdxwyZTgJK6Oyv
         5X3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bb5VE92HvqMkvu07M8W8ScVtWEViswCGwiVBS6hECLw=;
        b=QTukMqwU8KuCcBSaVcCatluLqup7W1yy8VJs754KOC5neNsrUgyz+jdysvXJFDR8Hp
         wk6oiS9v3OrJ8iP6UZfitAGUNjrg5iRXMqhcyYp8eW1OVn8hyj81jd7BX9TW1mYlfc93
         Mmt4Tn00A68n+4XsMHqcxoyduvn/JOYcmt5jPJNC0KtUlvUHRGLowP/ZOFQ99YwN8ZSi
         yYNhz9zDbIacQLAxseVH9AlpEH8lUKzAp0za7t/MXUrbdH0lK0UwqVkvPZgAkfnU8Gi6
         GMw2S2kXzrjqRcSsZkVSylOffdVhlXEy1rfXtw/Ad2WIcHq6hsz9ma/6WptUPTMR6UaH
         E9oA==
X-Gm-Message-State: AFqh2kqKQkKXHwcyrV7Yolr0szaNhbEFkYTETgbT65WlROKz3vmrO3WI
        CULOPrGuyiRP6wXjEDabrDGEGg==
X-Google-Smtp-Source: AMrXdXs8/1DQweb5+u7i3noBbHWDP6z3qmoidCfl+Lc9QpHZQv89xjG0UTEqN2NfZK9yp0rpHkuNFQ==
X-Received: by 2002:a05:6512:3415:b0:4b5:947e:68f3 with SMTP id i21-20020a056512341500b004b5947e68f3mr5012555lfr.1.1672236930943;
        Wed, 28 Dec 2022 06:15:30 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f17-20020a056512361100b004caf42eb04csm2565348lfs.138.2022.12.28.06.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 06:15:30 -0800 (PST)
Message-ID: <19f62c10-de9f-88ee-70c3-279efbbcef0b@linaro.org>
Date:   Wed, 28 Dec 2022 15:15:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: rtc: Add rv3028 to rv3032.yaml dtschema
Content-Language: en-US
To:     Wadim Egorov <w.egorov@phytec.de>, upstream@lists.phytec.de,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it
References: <20221228140610.938686-1-w.egorov@phytec.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221228140610.938686-1-w.egorov@phytec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Your subject is a bit incorrect. You do not add rv3028 to rv3032.yaml.
Also drop redundant "dtschema". Instead "Extend rv3028 bindings"


On 28/12/2022 15:06, Wadim Egorov wrote:
> Move RV3028 RTC bindings from trivial-rtc.yaml into microcrystal,rv3032.yaml.
> RV3028 can have a trickle-resitor-ohms property. Make it known to dtschema.

I don't understand what is here made known to dtschema, so maybe drop
last sentence.

> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
>  .../bindings/rtc/microcrystal,rv3028.yaml     | 56 +++++++++++++++++++
>  .../devicetree/bindings/rtc/trivial-rtc.yaml  |  2 -
>  2 files changed, 56 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
> new file mode 100644
> index 000000000000..4abe4756bc9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3028.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/microcrystal,rv3028.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip RV-3028 RTC
> +
> +allOf:
> +  - $ref: "rtc.yaml#"

Drop quotes.

> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>

This should not be maintainer of subsystem but maintainer of device
(unless it is the same person?).

> +
> +properties:
> +  compatible:
> +    const: microcrystal,rv3028
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  start-year: true

Drop, it's coming from rtc.yaml.

> +
> +  trickle-resistor-ohms:
> +    enum:
> +      - 3000
> +      - 5000
> +      - 9000
> +      - 15000
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

Instead:
unevaluatedProperties: false


Best regards,
Krzysztof

