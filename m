Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3549A6F6585
	for <lists+linux-rtc@lfdr.de>; Thu,  4 May 2023 09:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbjEDHLE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 4 May 2023 03:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjEDHLD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 4 May 2023 03:11:03 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1500026B5
        for <linux-rtc@vger.kernel.org>; Thu,  4 May 2023 00:11:02 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso134760a12.2
        for <linux-rtc@vger.kernel.org>; Thu, 04 May 2023 00:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683184260; x=1685776260;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1/n5t8cbAz/vTg5FkETYVpfmK/xJOmvhikwe5AgFf0=;
        b=E8jm+UUSVE3+c4PIoyP/U6pd168gH8yKP/q8sy+KWWbcxzpSfPCfzZR6JgOCsxna8P
         wemgyOJfX5DlmZFCdrAbcKArBp0D0gdSDkLIk8rnRVc5jzqK5RFKgpar3CGmw+hXlTWl
         sRDt898GEWCSKpt19h9wvQwqizQ9+KKRiywafhvb35W7p8eAzcrsGkbgSO0nOwwRlQEG
         MGoLWuwijtkbYwl/ZYg2ebydDQHzw17as8pLgk1h0PpIen2bHb4LsgUCIXpQu8lWBVPN
         orJXlVVhRlRn6c8HRtDtVENBlWLYv9CMagcpYWIme3wJYDklxtxI8BUVSoucCIoxPjQB
         0BBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683184260; x=1685776260;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g1/n5t8cbAz/vTg5FkETYVpfmK/xJOmvhikwe5AgFf0=;
        b=QRYGKh2vQBsFcGisSysFdWPubXs3o1gU3P6JWQgohdwORI90WyEqRFAmwHB2GGACLJ
         cyZsIc8ClRLOPzsWjaPwGdzVEJfSXEiJHB3+nAyPlQfIF3wH8ps2OOst+0dPxVKkfUvA
         ZY/uj6+Fcc5GOHsOZ9vOX4mYJc6B1Hh51N6kird0OeHRWKbYt4tT4GmW+AoSxAOsE7wD
         WCuqXyHtfK5EFiAW62bTBthBpKubfWDLpOjot2XDNs9rfsUAQT7HN5+pt6t+uh2FNmTF
         M5BvaU5O9/MlXWBxdSBqR9G1TWyJnVCXF/Meaf4Kti8IR/XOSd0fUJl7VN9llRMIahJC
         F0IA==
X-Gm-Message-State: AC+VfDwsBZ1YUoM82cB0DQ20PVFXsqLQ1uFQrV0nx7qAU8oD2fAvy8Ua
        3qiueyB8+IG3E7q6vEFebedHnQ==
X-Google-Smtp-Source: ACHHUZ5dI1Sl1PKEhM/0Um5KIiHcB5ACuNCKI4muv2v6NQ/5wC9ngpxjyHRSh27lnFATl5h/bUaJ1w==
X-Received: by 2002:aa7:d90c:0:b0:50b:f8c0:d793 with SMTP id a12-20020aa7d90c000000b0050bf8c0d793mr635452edr.27.1683184260533;
        Thu, 04 May 2023 00:11:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id r5-20020aa7d585000000b0050696c2d2f6sm1543284edq.88.2023.05.04.00.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 00:11:00 -0700 (PDT)
Message-ID: <db7ae5f9-393a-b892-dd6f-08c4f25ce7a8@linaro.org>
Date:   Thu, 4 May 2023 09:10:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH RFC 4/6] dt-bindings: rtc: isl1208: Document built-in RTC
 device on PMIC RAA215300
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Trent Piepho <tpiepho@impinj.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-5-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230503084608.14008-5-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/05/2023 10:46, Biju Das wrote:
> The Built-in RTC device found on PMIC RAA215300 is similar to the isl1208
> IP. However, RTC is enabled by PMIC RAA215300 and the polarity of the
> external oscillator is determined by the PMIC revision.
> 
> Document renesas,raa215300-isl1208 compatible and renesas,raa215300-pmic
> property to handle these differences.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/rtc/isil,isl1208.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> index 04d51887855f..888a832ed1db 100644
> --- a/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> +++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.yaml
> @@ -18,6 +18,7 @@ properties:
>            - isil,isl1209
>            - isil,isl1218
>            - isil,isl1219
> +          - renesas,raa215300-isl1208
>  
>    reg:
>      maxItems: 1
> @@ -40,6 +41,10 @@ properties:
>          <0> : Enable internal pull-up
>          <1> : Disable internal pull-up
>  
> +  renesas,raa215300-pmic:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the pmic device with isl1208 built-in RTC.

No. You don't need cross-linking. We do not represent one device as two
and then fix this by cross-linking them. The existing binding does not
have it, so it should be a hint for you.

Best regards,
Krzysztof

