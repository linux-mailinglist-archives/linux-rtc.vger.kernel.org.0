Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE704771222
	for <lists+linux-rtc@lfdr.de>; Sat,  5 Aug 2023 22:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjHEU2N (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 5 Aug 2023 16:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbjHEU2N (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 5 Aug 2023 16:28:13 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD0F13E
        for <linux-rtc@vger.kernel.org>; Sat,  5 Aug 2023 13:28:08 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so430431266b.3
        for <linux-rtc@vger.kernel.org>; Sat, 05 Aug 2023 13:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691267287; x=1691872087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MlSPgf1aBHoZYljbDuR4J5sqHvOmTbVQ5HwmM3guOPo=;
        b=PBzjvDdJnhtYbcfWLJUQd/p8N3kV6fGyJO+MYG1jKZdmpzcVRxEuQNO5awxEd/W9rj
         6SZ4guHI0F5PgePrcOLWZcjdfvQBUuMsj6pu+FyGWiUnGmSEYzmM7F0vaMZ6vNdhSa15
         MARrdpPMjW87ZsGobs/fYheLXhOyiTtcSOGiuTL2HequqTuQvwEPls6DCH9wjlaxKv0w
         CxdoSXdIhwb8iYkBcwNYFqyeFI0QW3SCO3bouA4vZHqTagEFiInRf229Hu5kWIxBfZKk
         MDE8slg7Ik+QXX9x7HxPubWh8TvSgTgJ8sW2LHvuaRKM9wo1UgCY235TGpPpr54+58fw
         R5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691267287; x=1691872087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MlSPgf1aBHoZYljbDuR4J5sqHvOmTbVQ5HwmM3guOPo=;
        b=AzZ7gSpK+S2ewBpT99+qJgB3JT6d2Ta4zVeQ2VFosoNHtVMkQUhWLU8K4gIutrbG9I
         EShGtx59Jyh+EJlJKbI9pOy36r+x2gtyihJP9LrnZcz9pypC25NjVtzfpNUxdA185Sew
         CGLHEUpkCnraqKx1WVyXJLuBjD49RtcbFLUy3PuK0Np23gJKo54DPo7pj2DFhjplNWIC
         EPtKwsWUitCZq2qkWJaIFekgmDhk9Uw7Arnzx/WGXDIFDq8zE5VBf1NKjRv6mzrf3fTp
         zKzsRKsDKjlnl1qNs3A7iIl9lOwGmJLX4Y5hCds0D31A0FclGL7esxU3Jr+PxVGh/AG2
         VApw==
X-Gm-Message-State: AOJu0YwNvP+ojTbF+eHZ8IOqAQKPBC8MCH77wIOPdpgw4o5Bt4Bb3X2S
        wbDKzluaUvdkxsIrI315L0qfMw==
X-Google-Smtp-Source: AGHT+IETqdCk7Vn/JusRmLodPXTC/VacN7qz7bYknS0qmKPmw+vlnR5YTj6jry+n3/NUb8jVYpij3w==
X-Received: by 2002:a17:907:7757:b0:99b:499d:4635 with SMTP id kx23-20020a170907775700b0099b499d4635mr4406237ejc.75.1691267287382;
        Sat, 05 Aug 2023 13:28:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id bg8-20020a170906a04800b00992afee724bsm3056276ejb.76.2023.08.05.13.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 13:28:06 -0700 (PDT)
Message-ID: <ad4dfefc-f18a-5462-eb6d-fdee161f87b3@linaro.org>
Date:   Sat, 5 Aug 2023 22:28:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] dt-bindings: rtc: Add Epson RX8111
Content-Language: en-US
To:     Waqar Hameed <waqar.hameed@axis.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     kernel@axis.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1691158774.git.waqar.hameed@axis.com>
 <864b398918e99773f6cbd5ffe5b1f0dc33e4d6d1.1691158774.git.waqar.hameed@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <864b398918e99773f6cbd5ffe5b1f0dc33e4d6d1.1691158774.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/08/2023 16:19, Waqar Hameed wrote:
> Epson RX8111 is an RTC with timestamp functionality. Add devicetree
> bindings requiring the compatible string and I2C slave address (reg).


> +
> +maintainers:
> +  - Waqar Hameed <waqar.hameed@axis.com>
> +
> +description: |
> +  RTC with timestamp functionality.
> +
> +  https://support.epson.biz/td/api/doc_check.php?dl=app_RX8111CE&lang=en
> +
> +properties:
> +  compatible:
> +    const: epson,rx8111
> +
> +  reg:
> +    const: 0x32
> +
> +required:
> +  - compatible
> +  - reg

Just add it to trivial-rtc.yaml. You miss here more things than trivial
is providing, so...

Best regards,
Krzysztof

