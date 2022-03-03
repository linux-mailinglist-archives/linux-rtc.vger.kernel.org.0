Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7034CC040
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Mar 2022 15:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbiCCOsj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Mar 2022 09:48:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234087AbiCCOsi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Mar 2022 09:48:38 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA44E4F9CE
        for <linux-rtc@vger.kernel.org>; Thu,  3 Mar 2022 06:47:51 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CC2BB3F4C1
        for <linux-rtc@vger.kernel.org>; Thu,  3 Mar 2022 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646318869;
        bh=CxzFP3tGzxrqCnnX51QcUCT9fYSeSWG8X2huDv3i2u4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Sw6E7EmsThSZL4Sx1Ua9Sg3ug5yYs+IYOrJZTonmuAye6Z+pMLlfcwaim5osWnrvp
         dzCZnZusFGYcC35rOGXcGxnNvDfdLTIIJtplsOcsDrfyQp43ErfESWkw3DFR8zco4Y
         /u0ePZDniAqBz1y1CVEI9d041valKzL0oASXjEpv6fteo1quWznze6E2xKK7G17fTh
         up+NMctwAnAw53TcOVPR2iQ62Db+DRno97Epix02KevdcGt3GeEdxVEOrhkomoQbx9
         whuKGQvX7hjx5VpuIy9fwdXxB+tX/I17hxBDq+IrmDXezM3EU1U4R2wTCyOFMmDwir
         sTtE2MD4rnpKw==
Received: by mail-ej1-f69.google.com with SMTP id o22-20020a1709061d5600b006d1aa593787so2881102ejh.0
        for <linux-rtc@vger.kernel.org>; Thu, 03 Mar 2022 06:47:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CxzFP3tGzxrqCnnX51QcUCT9fYSeSWG8X2huDv3i2u4=;
        b=wwavj7X0YHpurTo2JlqDmYfUqFkcEuwFqW+ilfnZ/ajNJ/xWhnG+HtIoDYS8mh8Nnz
         McaJrztu26Nr6LFxfGdD9bEcAekTxiDstIIuO7knP+6lj8h/7+YuhjajvcmsMaUYAfRX
         UX60gVCuXtsTJhjGLwDA3mO7PAUbeWCmFHll4XkZIC1bcqxGP5naMrE+NyqFPaUO3dMM
         Af1hdn2lDYU3Nj1lBKK6+djWX1hGZqxUt6tDKUSk3KLrkT14x5vLTUzwsz0GH/B9wGol
         4JyBvYJH53n93jOxl3pK9SzU/YMc2C3mJSSMg/IVW+9F0VUF/1mjuocywjd06OZ/qZMe
         EZMg==
X-Gm-Message-State: AOAM5338fY0A5cTpjt1QGpag2nSvRy8gkzeyy5zP0I1Vbkj6uyJ+s5P3
        Pb8dZ2MkK4fh3/S1lcnaq6+QEyykKVoSIQ/gSaM/xU0T56u8askXnZG+2sIOhtW9NnignLtQXW8
        n+URJUaRB7/GvpvP1chtraOYCQRH5DgGuo5mO6w==
X-Received: by 2002:a50:da4b:0:b0:40f:28f0:c2c0 with SMTP id a11-20020a50da4b000000b0040f28f0c2c0mr34599593edk.374.1646318869571;
        Thu, 03 Mar 2022 06:47:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgdcMT370bTQ0EzwypM8MzX+F1/sOFiaay++W+IjgNwLT95VAPst9y79sRHA7O5pCw2Q1isA==
X-Received: by 2002:a50:da4b:0:b0:40f:28f0:c2c0 with SMTP id a11-20020a50da4b000000b0040f28f0c2c0mr34599577edk.374.1646318869389;
        Thu, 03 Mar 2022 06:47:49 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id gs39-20020a1709072d2700b006d3ed4f51c6sm818854ejc.0.2022.03.03.06.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 06:47:48 -0800 (PST)
Message-ID: <be111013-a726-629e-2ce8-fcab9d26a3a2@canonical.com>
Date:   Thu, 3 Mar 2022 15:47:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/5] ARM: dts: at91: Use the generic "rtc" node name
 for the rtt IPs
Content-Language: en-US
To:     Sergiu Moga <sergiu.moga@microchip.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        nicolas.ferre@microchip.com, claudiu.beznea@microchip.com
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220303140626.38129-1-sergiu.moga@microchip.com>
 <20220303140626.38129-4-sergiu.moga@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220303140626.38129-4-sergiu.moga@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/03/2022 15:06, Sergiu Moga wrote:
> As the DT specification recommends, the node names should be of a
> generic nature. Thus, the most appropriate generic node name for
> the at91 rtt IPs is the "rtc" node name.
> 
> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
> ---
>  arch/arm/boot/dts/sam9x60.dtsi | 2 +-
>  arch/arm/boot/dts/sama7g5.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
