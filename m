Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F68F625D80
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Nov 2022 15:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234362AbiKKOwJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Nov 2022 09:52:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234636AbiKKOv5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 11 Nov 2022 09:51:57 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880A159FE2
        for <linux-rtc@vger.kernel.org>; Fri, 11 Nov 2022 06:51:54 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id g7so8672375lfv.5
        for <linux-rtc@vger.kernel.org>; Fri, 11 Nov 2022 06:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WpJrWqQ4CmduKv0xmnoR71zLFn6VuVuiVCxb/WoP7jw=;
        b=fqxlXcq+FU5VCkPezsP78XhBSunFUXqWZOGoLYNGWvIlsFzDrxH+fffvMyy8/zyQz7
         7aVn6RAHyDHtwmUbiie5n7b5fsdBa0s64JmTGm+mqRM+bt10Rk7/XHhXwCdAx51WOnmR
         SZv2DFEna/mE8TJ6qpoMczqimg2TQFH7kvC3Cn/oo+D0bbOD3buxxpMGHGqqymqNNVBN
         Z0mOmBaaa+8sWxTCDXyxI7JJqC8HsZYwe+jiF/FccH+v3o7Q/4CdWSZb7/buaw0X7Q2K
         mJOVSQXYMZ5wYhCyS6tOE25ezrGtn3tNSKeU+yRCAGAYULNK6vWB7wxSS11k1vJPIMZ0
         9fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WpJrWqQ4CmduKv0xmnoR71zLFn6VuVuiVCxb/WoP7jw=;
        b=xRTdujLwPjt14tk+rI1B/Unb1DcJgy4ymr/9eEoqueSzm24Grct9ZW3xdz6ROzign/
         O77AAkvWzOzTQvivQGZ2PlcMq8cvNLiw35KtWAoj/bAhFrbEybN1WG59HJmUsEOAYiCg
         ytUeK6Qc80XTLCd4mJKsqaZnaKem+lmqUM6k2uuJ5XFLKT/l2acY9Th8mzISOtvRW9kr
         LOOsy+r1a3hEUOYoAQZKUK6W+V/xO9snfeyTOlsFoOMzpFY0PVkXuNMdPoYgqLdH+23m
         aw1RgK8EEmERteyoujj7ZqZCOzuvglV6EKGMTvwyy4tztLjSdsEQH55YhVJyWJsgsdWe
         01hQ==
X-Gm-Message-State: ANoB5pnCJBPPcK63xFcPEGSA+wH2Y0QpTZSESoJRjqZvwHnco9Bf6Epm
        9sZxqWXOjbZ5sf6c6BS0rHJxoQ==
X-Google-Smtp-Source: AA0mqf6s1mgFbp0tWuMwPtCgw1cwtoLS3J09NnMzCfNlJmqztP9DDfkjd2V5z39BtLIJeTuIt490jQ==
X-Received: by 2002:ac2:48b4:0:b0:497:ca2:4e74 with SMTP id u20-20020ac248b4000000b004970ca24e74mr868206lfg.488.1668178312891;
        Fri, 11 Nov 2022 06:51:52 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id w26-20020ac2443a000000b004acbfa4a18bsm360465lfl.173.2022.11.11.06.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 06:51:52 -0800 (PST)
Message-ID: <4be61c49-c16a-0725-3b90-216ac808eaa1@linaro.org>
Date:   Fri, 11 Nov 2022 15:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 4/9] dt-bindings: mfd: mediatek: Add bindings for
 MT6357 PMIC
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        Fabien Parent <fabien.parent@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Chen Zhong <chen.zhong@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-4-5d2bb58e6087@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005-mt6357-support-v4-4-5d2bb58e6087@baylibre.com>
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

On 08/11/2022 19:43, Alexandre Mergnat wrote:
> Currently, almost all MT63XX PMIC are documented mfd/mt6397.txt.
> Unfortunately, the PMICs haven't always similar HW sub-features.
> To have a better human readable schema, I chose to make one PMIC schema
> to match the exact HW capabilities instead of convert mt6397.txt to
> mediatek,mt63xx.yaml and put a bunch of properties behind
> "if contain ... then ..."
> 
> - add interrupt property
> - change property refs to match with new yaml documentation
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 102 +++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> new file mode 100644
> index 000000000000..7b421f21d3f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6357 Multifunction Device Driver

Multifunction Device is Linux specific, drop.
Driver is not hardware related, drop.

Instead describe the hardware. It's PMIC right? So call it a PMIC.

> +
> +maintainers:
> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +
> +description: |
> +  MT6357 is a power management system chip containing 5 buck
> +  converters and 29 LDOs. Supported features are audio codec,
> +  USB battery charging, fuel gauge, RTC
> +
> +  This is a multifunction device with the following sub modules:
> +  - Regulator
> +  - RTC
> +  - Keys
> +
> +  It is interfaced to host controller using SPI interface by a proprietary hardware
> +  called PMIC wrapper or pwrap. This MFD is a child device of pwrap.
> +  See the following for pwrap node definitions:
> +  ../soc/mediatek/mediatek,pwrap.yaml
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6357
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  regulators:
> +    type: object
> +    $ref: ../regulator/mediatek,mt6357-regulator.yaml

Full path, so /schemas/regulator/......

> +    description:
> +      Child node that specify the regulator.

Improve your descriptions. "Child node" - it is obvious, it's an object.
"Specify" - no need.
"the regulator" one regulator?

> +
> +  rtc:
> +    type: object
> +    $ref: ../rtc/mediatek,mt6397-rtc.yaml

Ditto

> +    description:
> +      Child node that specify the RTC.

MT6357 Real Time Clock

> +
> +  keys:
> +    type: object
> +    $ref: ../input/mediatek,pmic-keys.yaml

ditto

> +    description:
> +      Child node that specify the keys.

MT6357 ...

> +
> +required:
> +  - compatible
> +  - regulators
> +
Best regards,
Krzysztof

