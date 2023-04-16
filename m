Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4110D6E3A8F
	for <lists+linux-rtc@lfdr.de>; Sun, 16 Apr 2023 19:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbjDPRdo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 16 Apr 2023 13:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDPRdn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 16 Apr 2023 13:33:43 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457EE30FD
        for <linux-rtc@vger.kernel.org>; Sun, 16 Apr 2023 10:33:36 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id xi5so58394232ejb.13
        for <linux-rtc@vger.kernel.org>; Sun, 16 Apr 2023 10:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681666414; x=1684258414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hr4sCeQla+eaEpjaF4AQP0D0MlU+2odQ5sAy4A+PCY0=;
        b=XgirmbUw4U2cxiuYQHTKTuHaRKy7CocNxLXAKlnqPaaqutrCM3h1diaybz3UaUXjcz
         l3lzWXxz/iB70nhIqwhy1DIuvZSfcEIk0NKeXZjDfWyRZdeu45FV1rU4JZlK4qWxc1Ev
         qaobEA9R6heVjmk3p/86GmbSouRNSvrpArE9k220z0zsnRxYrcG0e/bymZvmtBJWw+0r
         jz1BzSTBwgEwgOuGqy0QDZP14TmX1bqaEj7Em6uFLYPyhRsVfNgqvp+29cpcr0nMK4BN
         R+BFGSXfX/891dBvppv5WZlLNDNkHkdKp+u/m2aEZzHeQ1fvh58Gk0wbpzPjw3h0PX89
         CDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681666414; x=1684258414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hr4sCeQla+eaEpjaF4AQP0D0MlU+2odQ5sAy4A+PCY0=;
        b=BuP41JfEzlVK5GOct2di7pFO6XTqN2XukqW3gKzffhM5EjfYYCXlSL84dWRYRSffo7
         OYak0xJ0DpvyEXYK3Xdkcg8kS+CSETVgX+z6QET7Zo2+BD0aCFc9gwp6Ll5qoXg97Ntl
         BLZ9yfu1o/16hSCcCtLxyXfvckf4DVQ/2KSzpPfwAKJbdzxWGuk2tJ9qDu1On22sMBIt
         QzOFBzBc7ng6PfGp+eLmlIEWe0P5iT8B+P7TkqkeTqkyHrIbNC4O9bT/2uBT/B4H+uaC
         zqRosbE7Sl/DDMDb/TMYqYv4RCHPrGucDDpxl/dKe7LdM3gWAxEVX8v7zCLRY1yQUJn+
         mXAw==
X-Gm-Message-State: AAQBX9ctbtNo7x1ZKc42BsBFGMa+mXhZRK4oZBa2zaEs55O7DbuFKdDW
        Iwne0LkUKu+zhTyNVEgmPeSghw==
X-Google-Smtp-Source: AKy350ZKMw7Z86LdcmkNX7vdTVn0BL9KWnwpwevn4POP/KaTAQLRqu/+pILoMfXhDC07BxkbXQlggg==
X-Received: by 2002:a17:907:c00f:b0:94f:2a13:4df6 with SMTP id ss15-20020a170907c00f00b0094f2a134df6mr3899223ejc.36.1681666414671;
        Sun, 16 Apr 2023 10:33:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id n25-20020a17090625d900b0094e62aa8bcesm5324293ejb.29.2023.04.16.10.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 10:33:34 -0700 (PDT)
Message-ID: <2d785047-3d54-f796-8e31-19409e197e08@linaro.org>
Date:   Sun, 16 Apr 2023 19:33:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 7/7] MIPS: Loongson: Enable LS2X RTC in
 loongson2k_defconfig
Content-Language: en-US
To:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>
Cc:     linux-rtc@vger.kernel.org, linux-mips@vger.kernel.org,
        loongarch@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>, keguang.zhang@gmail.com,
        WANG Xuerui <git@xen0n.name>
References: <cover.1681370153.git.zhoubinbin@loongson.cn>
 <6c4e9e4c2da51ecbd6a05ec2a973bc06a282d58f.1681370153.git.zhoubinbin@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6c4e9e4c2da51ecbd6a05ec2a973bc06a282d58f.1681370153.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 13/04/2023 09:58, Binbin Zhou wrote:
> This is now supported, enable for Loongson-2K systems. Other systems are
> unaffected.

I don't understand what do you want to say here. How defconfig change
could affect other systems?

> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Squash with previous defconfig change. There is no point in enabling
options one by one.

Best regards,
Krzysztof

