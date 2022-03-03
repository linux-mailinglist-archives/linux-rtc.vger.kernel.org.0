Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAF8F4CC045
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Mar 2022 15:48:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234168AbiCCOsx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Mar 2022 09:48:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233688AbiCCOsw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Mar 2022 09:48:52 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D399A4F9CE
        for <linux-rtc@vger.kernel.org>; Thu,  3 Mar 2022 06:48:05 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4C43D3F5FF
        for <linux-rtc@vger.kernel.org>; Thu,  3 Mar 2022 14:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646318884;
        bh=LAs/6LRRxzJHgIKQxtRjIVV9shF4X2KxxwHj1qUD7Ok=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=bSeUsOcLobdFeN2L2yn5BruGH6hYZOpdVi4LnH5uAIUbAfkrGjBF0Pb+fTwvsTRKM
         MU3zCbnl4oWB2Sl4sUmtlJRloe+YWg4K2YBtWzrsWD6aILSk979Ier/aOKOSwK3MuB
         rdJJx3bUNGboW6iwduifKcasgWNBtWBhW5IUpXxLsfc/tE4lZzuqowkAvvoq3/oyg4
         syFodSJV3sUH/2/zHcb0GoqRfcSNY9iFSgiotS4pF6wwXzFDEPQGMcbzj9TCdHXdLY
         /OlbD5Ec15JNL4rqODg9Uj99NKHPHm2afcPUHQPEw4c0aYT4hqm88Zp4HNHOEETt8U
         tIrv8YvKd9G5A==
Received: by mail-ed1-f72.google.com with SMTP id bq19-20020a056402215300b0040f276105a4so2980409edb.2
        for <linux-rtc@vger.kernel.org>; Thu, 03 Mar 2022 06:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LAs/6LRRxzJHgIKQxtRjIVV9shF4X2KxxwHj1qUD7Ok=;
        b=jd+Nia+jQsTCS8k2Aa1PIgpiv7OyibEic5MAPvpALSZ4G/JObSQZsnDFyL1LESsq1p
         rQ7fdzcD7+0E4Exfx1orXoSlaaR5uFt6A9GvON0AY+nOLsWVsQh2Rw5/OGr6Vho6O4Gq
         Oo1gTkvXEixaKSUR14JH/rB1Ymb6ueEhpDy93BYt81pUHiYGfBCUTfE24qZlb8pF6+gd
         L1raX716NjILWGnMlbwiY6P1rH39bxC/YIPOzY4BiHikcmAfMI1iD5WhtghOS/ruig8s
         QUYokv3kE5N1h/b5WQJQvYFw1A6w6HWYG6bDcCMmi2bf5/CLpsWuj6OKGHx3GnOad1dL
         sVlA==
X-Gm-Message-State: AOAM531enep2pAuehTqMxRvu0gQOuG75rDn1f31wUrDR14RwTiFiReRd
        7N8ph6WaAZf0+0wwVwsXCZ9P4Qe9M5ZYIZ/XIqwVFFGlM3eWnKEM/R/2GnIHKa4RF39Qdi7yC9o
        KfyhXyaAuv1yx1E/IGvKeyqEfZr1Z1suMLQFiWw==
X-Received: by 2002:a17:906:32d8:b0:6ce:d850:f79 with SMTP id k24-20020a17090632d800b006ced8500f79mr26432626ejk.414.1646318882043;
        Thu, 03 Mar 2022 06:48:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwytkSR6dilP11S7DvOKJ5JW0P4codQZvsoymdmrg/Gth5TjrMaHSqxiOJpzo0DrsZkMEGHIA==
X-Received: by 2002:a17:906:32d8:b0:6ce:d850:f79 with SMTP id k24-20020a17090632d800b006ced8500f79mr26432613ejk.414.1646318881892;
        Thu, 03 Mar 2022 06:48:01 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id pg27-20020a170907205b00b006d6e5102ca2sm778506ejb.97.2022.03.03.06.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 06:48:01 -0800 (PST)
Message-ID: <7a71f580-28dc-def2-c693-70c4b0e9aee2@canonical.com>
Date:   Thu, 3 Mar 2022 15:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 5/5] dt-bindings: rtc: at91: Add SAMA7G5 compatible
 strings list
Content-Language: en-US
To:     Sergiu Moga <sergiu.moga@microchip.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        nicolas.ferre@microchip.com, claudiu.beznea@microchip.com
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220303140626.38129-1-sergiu.moga@microchip.com>
 <20220303140626.38129-6-sergiu.moga@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220303140626.38129-6-sergiu.moga@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/03/2022 15:06, Sergiu Moga wrote:
> Add compatible strings list for SAMA7G5.
> 
> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
> ---
>  Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/d


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
