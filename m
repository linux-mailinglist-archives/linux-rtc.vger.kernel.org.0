Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2316506BA6
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Apr 2022 14:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352017AbiDSMF1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Apr 2022 08:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349804AbiDSMDZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Apr 2022 08:03:25 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA02C27FDF
        for <linux-rtc@vger.kernel.org>; Tue, 19 Apr 2022 04:59:09 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id b15so20932630edn.4
        for <linux-rtc@vger.kernel.org>; Tue, 19 Apr 2022 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6oA1XojTBV3oA9r/HKQ3Tl1fWWX+00CTBT2nxTWPymY=;
        b=hDR9Sem7MlKGIbYOPdZKzDLQQoA1Ps1MPKQgOl4DfL9ZhR6uk4ow7cmRujEgHca4+z
         LHrJQUqfAnG+GYinLCxhNo021USDj7Ay+o6y0eMUirw3v0TDkylvC1rrYu3R7sew6U7T
         VtcSna4j2XI0YFrEtXDsTUt4V2Wk+cKcq0laOt/lrz/5RB+epAI9zeWa+5t83oL5XEdp
         ejNyYqxtaDaInpvPZUufRCcnRaAx7mYhj2rVmbty5tG9Ez4ZjDArimtgstQTFnThs2PK
         qkEowriCnuaEJzFjB25g2rYeXlCrryjPVUyCzonmIymb09b/1bJhE5oHJOxkH4jQTQFC
         09mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6oA1XojTBV3oA9r/HKQ3Tl1fWWX+00CTBT2nxTWPymY=;
        b=YLecC5MmxOOfD/hTkeICnAK4vHqbhOilwy4OsZNh8rvPs7cA4/A/RqcW6o+bkezHBg
         JLL3DO5BBjYWJ0oPKr2zBkV2itHC316APRHcM0Pwuw4OcokGx2ij56ztw00AI29rj5+M
         PIenaXxG88IxdjuwPIr89pgw+gxkf1c41bEi1wmPfUXkqPtAforamSFxwyoMEg5ZC7C5
         rz1HOXT3Xf3+6wPziJi9e6F4PIeItwXHsASktdY7CXnV3bcMgrVn9+BTcN69IK2MwOCZ
         98mBL24/EnyXfnZPMzHt5pthN6iU4scPeefQUrP1NRxO3U4+o7qVnRr9sq7Oivr+zFCj
         YGDw==
X-Gm-Message-State: AOAM5318yx6Ju4f3Bo6O/ICOV4lijmD8CAyT3Wp+gnl88f2xcZpuLQMB
        ZXbjBuOZSy8+CTPRDJ8Ysxs63Q==
X-Google-Smtp-Source: ABdhPJxS7yTBdB7NfvlxHjWxaLfiWZFzcz7EPz+lZ+OBcndTA1+SohbMymqQSLWiLrTaqWI7UtT/Lg==
X-Received: by 2002:aa7:c489:0:b0:41d:78a0:5b32 with SMTP id m9-20020aa7c489000000b0041d78a05b32mr16985415edq.305.1650369548476;
        Tue, 19 Apr 2022 04:59:08 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p9-20020a05640243c900b0041facb9ac9esm8111757edc.1.2022.04.19.04.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 04:59:07 -0700 (PDT)
Message-ID: <4f31fc70-c227-f69f-8fbe-6fa8a1113258@linaro.org>
Date:   Tue, 19 Apr 2022 13:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com,
        sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        palmer@rivosinc.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
 <20220413075835.3354193-6-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220413075835.3354193-6-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 13/04/2022 09:58, Conor Dooley wrote:
> The RTC reference and MSSPLL were previously not documented or defined,
> as they were unused. Add their defines to the PolarFire SoC header.
> 
> Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
