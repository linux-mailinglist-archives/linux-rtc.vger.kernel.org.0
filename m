Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3250660649D
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Oct 2022 17:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiJTPdY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Oct 2022 11:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbiJTPdX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Oct 2022 11:33:23 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2011B1554
        for <linux-rtc@vger.kernel.org>; Thu, 20 Oct 2022 08:33:18 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id f8so133458qkg.3
        for <linux-rtc@vger.kernel.org>; Thu, 20 Oct 2022 08:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HUxkh6qlwBPEzlvP9/xhAHaR3FqYhNfBKYj/tNf7PA=;
        b=HJklLCQLdYFpnP5xyffmVbRdWBwhkQ/6rqkWdwlyJt7dry8F+hezpx/EXR0kue7fhH
         rrm/qTmP9B6OtQwcpdvWKvrBMM7GhX6PxRsl1xp5ewMVDHAEMXHzpCHWhLpNwESLfrV3
         vFZDOpxbmhc7NjasI9J0rxeOoeg45VL929G7jak40RlJRBgkghMLheHa++PJn7ITC0tQ
         A/8WJKMghNEyvWpR8L0CCIb6Ai7CdNikMW09XhY5XapQyRAib/dZjbH7Qoi8tKQnA/CR
         CcFzX4RMKS+WJeWXllDnzRctiaeWaPWz9MFyrMf/+TcALg6ZTx6d4j7COimXzDjLvqs0
         wqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7HUxkh6qlwBPEzlvP9/xhAHaR3FqYhNfBKYj/tNf7PA=;
        b=M/LmxLXQq6SkDCtyvnZHTSn7OHBS9ak5W8vzAKEyP4p/FfrGohDlH5GQmj+I4uBIHD
         QcKCx2YRgnkrar2mn9AQ/KbQR53m9tNWHW0jpHE7mA+UhMPvhU0r5XDMU/DnC65Tx604
         wbKCXS90SrLXJpudhxV9wUGGHaA++tX1lBd+qwAEm+6KnZ2UUhZ8tyBNbo72N7ROm2v0
         EpQeoIuXWwANU0rQzIFqjafYQst8IJTrulpNr6Ch5rrfCVM43jicK6YnKFUXgw3nCu6D
         Hr1eSoDhkRWOsSQpoVGmHPxXz1UyLSVosjvsdaQsIOaARs65oYAkvGOGLZzatW5lBk/n
         rh1Q==
X-Gm-Message-State: ACrzQf19Xj+s0tFL0rynevcMMspYLhq9jZ3+2XC1FQiuJo/AUrsd/PPd
        V+nziTbsu5bc5ICPDCUM+20KixLGb4N/0g==
X-Google-Smtp-Source: AMsMyM7fbfzfUbQBTjbq0KwtSpFbinTm7Ze4xD696dbgFpTmqpYHuP0DOiT72Wu1R1/5TKojB+yxcQ==
X-Received: by 2002:a37:5d2:0:b0:6ee:7931:825a with SMTP id 201-20020a3705d2000000b006ee7931825amr9581420qkf.591.1666279997876;
        Thu, 20 Oct 2022 08:33:17 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id hh6-20020a05622a618600b00343057845f7sm6064722qtb.20.2022.10.20.08.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 08:33:17 -0700 (PDT)
Message-ID: <dee7f119-551f-3163-7148-aeb822a0be38@linaro.org>
Date:   Thu, 20 Oct 2022 11:33:10 -0400
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
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
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

Thank you for your patch. There is something to discuss/improve.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        rtc@68 {
> +            reg = <0x68>;
> +            compatible = "adi,max31329";
> +            clocks = <&clkin>;
> +            interrupt-parent = <&gpio>;
> +            interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
> +            interrupt-names = "INTB";
> +        };
> +    };
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        rtc@68 {
> +            reg = <0x68>;
> +            compatible = "adi,max31331";
> +            #clock-cells = <0>;
> +            interrupt-parent = <&gpio>;
> +            interrupts = <25 IRQ_TYPE_EDGE_FALLING>, <26 IRQ_TYPE_EDGE_FALLING>;
> +            interrupt-names = "INTA", "INTB";
> +        };
> +    };
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        rtc@69 {
> +            reg = <0x69>;
> +            compatible = "adi,max31341";
> +            #clock-cells = <0>;
> +            clocks = <&clkin>;


Drop the last example - it's basically the same as first, without
interrupts.

With that:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

