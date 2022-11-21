Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F163631CAE
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Nov 2022 10:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbiKUJSd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Nov 2022 04:18:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbiKUJSa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Nov 2022 04:18:30 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694042F3A1
        for <linux-rtc@vger.kernel.org>; Mon, 21 Nov 2022 01:18:28 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id c1so17882860lfi.7
        for <linux-rtc@vger.kernel.org>; Mon, 21 Nov 2022 01:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UpSTdsDOMig0TNjIkUYB/wrzKSkG9D66w0IJbB6U/L8=;
        b=bApH5BU/CyiIRvct4YDbvqTVCEV70kdWkmqgMJIk7WUxUqddxTpExh15Jlpbu6cjnW
         vFKmn2cvtmh/sA1Nsrz9iOlzEMlqShm3hAE/lGxFm+r1oaoq9PgR09XYq32Q3GIRrOft
         RyksDCeziJJ1CfBjUcWaEvruL6wNuWp/tU1nsruofL5MxJCmk/+zwPw7bhhe9DvWmimC
         29l/Ldha+zN7XxADJJWKrlmapzGJranuayTniQ5qEjHvxKoJiVjM6FYmCLb5KF5I7Y95
         v4oW26NDXOzYjVNS0v8gCp1aYxdxiNo4GPMYFsz4Bn9aLyhh7tALdfT8OWoLK8gSNOf3
         Gkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UpSTdsDOMig0TNjIkUYB/wrzKSkG9D66w0IJbB6U/L8=;
        b=tqTTYE8y8anWJ/Q6/izCjkvijvZ9ScR1fpVheO+3BFG5fnwEwIzdxRb5Wr2huQx6XH
         oTMesNqiPJcOTJ1Lv04VEr9nDRW6sDRPaSjA6lM8QtDkXgjYn0mu7SFbtQsR9ddSXktK
         LEidU89KcXrQMHf/WUtsSRblqxHQk3EUUuy3M/65bbU8gKLeebsQ9lI8zSusrJLP4CTg
         o/yKAMQ73Kj/RwEKRbuP5Fw5/9cP+sKv0eUcAWlf/J7Dx3Q7JbAnmgNdnLUC+WOSVGHy
         Ugyz6eMMrt2fblyN2flzRbDYK3d3rXLVaAIHZIB3wkL2xfnm0A9wCikqP9ciQc/tD/2W
         YRjA==
X-Gm-Message-State: ANoB5pmxm4kZ9QfOrmCuN7p9YEEzcObuYkRySxnx+8NhQwe/8JT+hjRO
        J4DdiL7yEwdlMwvbtIvJcNR1nQ==
X-Google-Smtp-Source: AA0mqf5zHNaXnko3gkuaISLPSTETD4rWCwavxCCeqOH2Rj9oIO5q8inPQkwpIu8NTPrYi5Qn9HGi2w==
X-Received: by 2002:a19:5f0a:0:b0:498:f195:5113 with SMTP id t10-20020a195f0a000000b00498f1955113mr2161735lfb.159.1669022306801;
        Mon, 21 Nov 2022 01:18:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p7-20020a2eb7c7000000b002770e531535sm1412589ljo.55.2022.11.21.01.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 01:18:26 -0800 (PST)
Message-ID: <1d93e843-d7bd-a4f7-bb99-4270d9333fa1@linaro.org>
Date:   Mon, 21 Nov 2022 10:18:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp
 bbnsm
Content-Language: en-US
To:     Jacky Bai <ping.bai@nxp.com>, lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121065144.3667658-2-ping.bai@nxp.com>
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

Also few nits:

On 21/11/2022 07:51, Jacky Bai wrote:
> Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).

Subject: drop second, redundant "bindings".

> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> new file mode 100644
> index 000000000000..b3f22b0daea6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/nxp,bbnsm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP Battery-Backed Non-Secure Module bindings

Drop "bindings"

> +
> +maintainers:
> +  - Jacky Bai <ping.bai@nxp.com>

Best regards,
Krzysztof

