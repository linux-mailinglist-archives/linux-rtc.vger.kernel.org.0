Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B788C62F26A
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Nov 2022 11:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241669AbiKRKWF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 18 Nov 2022 05:22:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241651AbiKRKWE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 18 Nov 2022 05:22:04 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255CD8FFAD
        for <linux-rtc@vger.kernel.org>; Fri, 18 Nov 2022 02:22:01 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id g7so7500563lfv.5
        for <linux-rtc@vger.kernel.org>; Fri, 18 Nov 2022 02:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eRlfpTg375i+5zqJCLGinL+O/zsDyPhezs53zNobHyA=;
        b=EoWxvzC6av//hkf7kXQqMlmT21HOLcPZH9boydPxmvsFyQ+6s3vzozVG8wTiRpDl10
         IvZ05TQeqyjhSDIsUJXW6pRjkFcdIVSSOPnOaGapTQMB3ha37NYd8cEW3ibStFYw43UV
         LZ5U/+LP/cZ37eRZYiL+JYMdVdmnGT7fUNvdTzhdrMsCpU9FKorT2zAICYANW4MLJOlE
         LRpyENzPbLqwVd2boOcS/8ozHBG53+ebp3IN7ltWZr/zvsPh2sIJVgTuBCC6xFmirqVc
         RhCMe7teqsEQukXq2Vv269BVfDp51XQx+es6qVbbgS03MJGGcb5nfhpgDhMWxgXqXuV5
         Qlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eRlfpTg375i+5zqJCLGinL+O/zsDyPhezs53zNobHyA=;
        b=Bo7QSUfua2TMWHf1Nk5aon+DVa+cC6DaUoJRsoqZqwAYnADU+6kFS9qzXpnbDqmnvD
         uBWZxRnFTlpDtGVpEBQmIMLn8QQke5oFwmlGboVfIGjLgTh8Nsl4vD4Oz8qA7F4+mr5w
         seSuMRSp4GPdBsi2atlPp6TYjL95Z6QbWZLvM4Gq3XBmde47yrfrlBv2Y2v6TbQ9ntOq
         a/tWC8K5GqTmXFoIToGxNHxW1TYMCfThwEnYxhnU011mfkP0NF3MdaotgTC8Mt1dTxA8
         uBEOWlmIxPGt4w7a0tCKRMtd1QrnKGbFLSEvWbU6VUQcyAxXhbksfiEq9o2alihT9TlW
         gj8w==
X-Gm-Message-State: ANoB5pnk9h21SJq//j41D+YuozqQd2dJIzUdEYbk5NGtl/fTqeDKFbeq
        40INgvX7YQSpffS9hvhgBrgy4Q==
X-Google-Smtp-Source: AA0mqf6cxLd/iKhLSrNdXHgfxOkVao/c+6eUwyr7Wy1UMJAm6fgCV3omFj1Z90R0cMVNBGg0MxLZNQ==
X-Received: by 2002:ac2:558c:0:b0:4a2:4b78:a8e8 with SMTP id v12-20020ac2558c000000b004a24b78a8e8mr2432763lfg.292.1668766919300;
        Fri, 18 Nov 2022 02:21:59 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n5-20020a05651203e500b00498f570aef2sm604604lfq.209.2022.11.18.02.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 02:21:58 -0800 (PST)
Message-ID: <b46253e0-6678-0a69-1522-83a559835669@linaro.org>
Date:   Fri, 18 Nov 2022 11:21:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 1/4] Documentation: ti,tps6594: Add DT bindings for the
 TPS6594x PMIC
To:     Matt Ranostay <mranostay@ti.com>, vigneshr@ti.com, robh@kernel.org,
        a.zummo@towertech.it, linus.walleij@linaro.org, lee@kernel.org,
        brgl@bgdev.pl
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20221118092218.480147-1-mranostay@ti.com>
 <20221118092218.480147-2-mranostay@ti.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118092218.480147-2-mranostay@ti.com>
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

On 18/11/2022 10:22, Matt Ranostay wrote:
> Add documentation for the TPS6594x PMIC including its RTC and GPIO
> functionalities.
> 

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

The comment was about proper subject prefix. Drop also redundant, second
"DT bindings" from the subject.


> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  .../devicetree/bindings/mfd/ti,tps6594.yaml   | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> new file mode 100644
> index 000000000000..81613bcef39d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,tps6594x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TPS6594x Power Management Integrated Circuit (PMIC)
> +
> +maintainers:
> +  - Keerthy <j-keerthy@ti.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tps6594

tps6594 is the model name? So what was previous tps6594x used also in
title? This does not look correct.

> +
> +  reg:
> +    const: 0x48
> +
> +  ti,system-power-controller:
> +    type: boolean
> +    description: PMIC is controlling the system power.
> +
> +  rtc:
> +    type: object
> +    $ref: /schemas/rtc/rtc.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      compatible:
> +        const: ti,tps6594-rtc

Same problem.

> +
> +  gpio:
> +    type: object
> +    unevaluatedProperties: false
> +    properties:
> +      compatible:
> +        const: ti,tps6594x-gpio


Not fixed.



> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic: pmic@48 {
> +            compatible = "ti,tps6594";
> +            reg = <0x48>;
> +
> +            rtc {
> +                compatible = "ti,tps6594-rtc";
> +            };
> +
> +            gpio {
> +                compatible = "ti,tps6594-gpio";

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).


Best regards,
Krzysztof

