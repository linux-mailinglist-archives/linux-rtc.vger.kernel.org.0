Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F35C72DB41
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jun 2023 09:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233711AbjFMHmb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Jun 2023 03:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240551AbjFMHl7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Jun 2023 03:41:59 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F251171A
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jun 2023 00:41:40 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-977cc662f62so765522066b.3
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jun 2023 00:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686642097; x=1689234097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0vdyLlGs9owD+oUsAmShQLCYlzvHJsrYCpSNUZFwkA=;
        b=u2rzvUXT3SLsFJgwFZDSqL6dwgNug4CFN/mCqBYAXL6Zgy6niUUG2i2k0RA7kGoiF+
         fXldLLL/E+rfo7tvJg72tPHCI1wA4zIDyaYFwPukivh6FmIKu1kqrpFdBzQn7I8pDdVU
         +as1eXYNkh/qAXFTtv2VB4rD/xqr0UcgfEJ0W8bi7/BtYGr9/nIxGCSKzGigK4NdHARY
         DX/E3Pjsq4cIGfby2Xd2BVoQ48Wl++UWLop4U+OU259rUlumdO1T3kvdyy84Lkgndswp
         YI7OHYjjoJKJ9VJjVV9KvymG1W2JupT3WZlweCIz6oWfzdNNZgvvFgAlI5mHQODtxiZ0
         mJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686642097; x=1689234097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M0vdyLlGs9owD+oUsAmShQLCYlzvHJsrYCpSNUZFwkA=;
        b=LpInVWP6n8CT+/ovtBZjih6p+4y1WCaaAjpZIWovwp239JUg9rFTAnl9QsxdjnxFQQ
         Gtju1aZfNkGLtfGg3Re6XiOqm8bIldCO2O25p8yL8O4agK07jCQRpaBrz+xIugeZYvHD
         72YzkoOD5+xlJpIluNCHwhqrgDGFCnwf2S9vxNWaAkeit2sLY2RIf215NseOn1yNOEp2
         xl0HfL3CNpAI7B/XPQhO1UbR/S4a4MHDPqScdsoJkaS+pwVVf51xfhuPd5XMz/Z+WpZc
         LKPrugoonv20YNKG/cwroeOynESARDFiY/7uMO4v2JXd9wSvcCCvmPAQ8qmfCvC7YzEQ
         5Ebg==
X-Gm-Message-State: AC+VfDz/WDC/ieZWHz/9m8DburV/h+DnI7wj4Mry73/kuff0p32ZgH0T
        XAeWnof6ezLdgCFBgvDaOX3uYKlBbDcwletw6eM=
X-Google-Smtp-Source: ACHHUZ6EEVTFh4ZrCXQg5qi5iW6B/nUnAJOjL5qQ6LOfF+7fDVjHpXW/2d+YPMlcbfdbx4NAgZ+9Gw==
X-Received: by 2002:a17:907:97c5:b0:982:45ca:ac06 with SMTP id js5-20020a17090797c500b0098245caac06mr75151ejc.60.1686642097717;
        Tue, 13 Jun 2023 00:41:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n27-20020a056402515b00b00502689a06b2sm5977603edd.91.2023.06.13.00.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 00:41:37 -0700 (PDT)
Message-ID: <60e10ef3-6cbc-7d87-c25d-30fb1248d572@linaro.org>
Date:   Tue, 13 Jun 2023 09:41:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/8] dt-bindings: rtc: isl12022: add #clock-cells property
Content-Language: en-US
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
 <20230612113059.247275-8-linux@rasmusvillemoes.dk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230612113059.247275-8-linux@rasmusvillemoes.dk>
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

On 12/06/2023 13:30, Rasmus Villemoes wrote:
> The isl12022 has a dual-purpose irq/f_out pin, which can either be
> used as an interrupt or clock output.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---


> +
>    isil,trip-level85-microvolt:
>      description: |
>        The battery voltage at which the first alarm should trigger
> @@ -35,6 +38,13 @@ required:
>    - compatible
>    - reg
>  
> +if:
> +  properties:
> +    '#clock-cells'
> +then:
> +  properties:
> +    interrupts: false

https://elixir.bootlin.com/linux/v6.2-rc3/source/Documentation/devicetree/bindings/net/qcom,ipa.yaml#L174



Best regards,
Krzysztof

