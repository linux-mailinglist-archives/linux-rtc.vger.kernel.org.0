Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B41A55AD617
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Sep 2022 17:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238319AbiIEPTF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Sep 2022 11:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238701AbiIEPSn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Sep 2022 11:18:43 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072471FCC4
        for <linux-rtc@vger.kernel.org>; Mon,  5 Sep 2022 08:18:38 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id z29so13491774lfb.13
        for <linux-rtc@vger.kernel.org>; Mon, 05 Sep 2022 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=swhM6AzvTh3Wgq6o5hGnrDmFgtPvuciwbkOwaBUpKl8=;
        b=lZL+fyzvTbG/mJAiV0+TOoVnQmmtjGh33kdIIjy6EAVXpkN4HD92LFEdAMVsXkILh6
         +w8eTWAAFfxmcdfyug2z2rEZEZXj35YNl9RT+GBeZs2fvwoQlJcou9IkRu2SmtwlFsG7
         w1BBxLIzJP6sI51V5FyswGq0rx6uIjl56O8BBmv1Q5Ua71A4vSfmcSPj6fckd3G0C2Wa
         RyoUPooOcsS47q0XgLerOKI7+q/0YAMexR3gtMC7dmhGJW+DXfto4/hc2mCbKsZLQVSO
         UMG0REQ3NsKMNfqb6GblPYmybJ/3VSveN5lROdV0hE88nkBf63LLWJujT9b5hdCgPluY
         OVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=swhM6AzvTh3Wgq6o5hGnrDmFgtPvuciwbkOwaBUpKl8=;
        b=c4zIjUGZMRV43+N2jVwez17mtu3R8IRSinpsBZMDPqbZW41BrfcQ6MO+DP30V/SuMc
         Gy7o1EjX28twHMh6JuWmIojxOoRkApIrBcfnCln/20BWQtAlUdJ46guceh5kUn0JfMB6
         gC3mqP61fY8rF0Uv7p8ZGH6pVGh2QdZdtQGuVRFwP1rLT56qilP+l6+uCadrE43rEQeA
         XA0LtL6k4ObCips1FPhrDmOInmksAN0sw90uit075sF7Wb5tRm619X7EZiHAUM3QlTmf
         QpgBICOjALvu9Wbl7WGACyVbJokLmbI6mWQ932auCGyejkOzVIjMMckp2DOumK9L280y
         QrmQ==
X-Gm-Message-State: ACgBeo2wsWkVIJ24yaaLAruYELIOGb5t+sgquyQ/oj9BuOzUIjkGBN8q
        fZa+a4gOeQhHqAJ5LSArntY9GA==
X-Google-Smtp-Source: AA6agR6Waph4vINF+QqSLLaSgRA4/o6x+7YeW9rnIpKNWQUC3Tbn91ovY2H91LjdYBcOeLc0sWwb2Q==
X-Received: by 2002:a05:6512:110d:b0:494:7626:57a0 with SMTP id l13-20020a056512110d00b00494762657a0mr9821197lfg.302.1662391116342;
        Mon, 05 Sep 2022 08:18:36 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s3-20020a056512202300b0048b064707ebsm26105lfs.103.2022.09.05.08.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 08:18:35 -0700 (PDT)
Message-ID: <0abb9a84-f9cc-8263-8842-74b9bbe86748@linaro.org>
Date:   Mon, 5 Sep 2022 17:18:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 1/2] dt-bindings: rtc: add Maxim max31329 rtc device
 tree bindings
Content-Language: en-US
To:     Jagath Jog J <jagathjog1996@gmail.com>,
        alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220904044708.7062-1-jagathjog1996@gmail.com>
 <20220904044708.7062-2-jagathjog1996@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220904044708.7062-2-jagathjog1996@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/09/2022 06:47, Jagath Jog J wrote:
> Document devicetree bindings for the Maxim max31329 Real Time Clock.
> 
> Signed-off-by: Jagath Jog J <jagathjog1996@gmail.com>
> ---
>  .../bindings/rtc/maxim,max31329.yaml          | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/maxim,max31329.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/maxim,max31329.yaml b/Documentation/devicetree/bindings/rtc/maxim,max31329.yaml
> new file mode 100644
> index 000000000000..757f1ac4fdc2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/maxim,max31329.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/maxim,max31329.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim MAX31329 Real Time Clock
> +
> +allOf:
> +  - $ref: rtc.yaml#

If there is going to be resend, put the allOf after maintainers. In any
case:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



Best regards,
Krzysztof
