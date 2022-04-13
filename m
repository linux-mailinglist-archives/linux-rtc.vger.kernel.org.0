Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDF824FF00D
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Apr 2022 08:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbiDMGqw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Apr 2022 02:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233035AbiDMGqv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Apr 2022 02:46:51 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 424CF2BFD
        for <linux-rtc@vger.kernel.org>; Tue, 12 Apr 2022 23:44:30 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id s18so2017546ejr.0
        for <linux-rtc@vger.kernel.org>; Tue, 12 Apr 2022 23:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6abcq3O1EPjgdyhvzwdMxIPAFt88vyijjAyZY43AuF8=;
        b=Wt62uSnDI6mF9aPfsYg8UJ2HGrg13xt4FC/mICdOpCq+n3WzWL7WjLN7seYgvq57sY
         LVpsm8o669ydMUIUtWhsQ3dIj2Nopm1UpYoC0vJKxjvN42vEWon0906aC+SfmSaWwgLk
         PcjmD70YuXsolSi5ncH5XTV1fL0abGJcszxWlQ8WSsKLJpt2dCPTqZRIlx/4TCUgBrEr
         xozL2+xwDAzTVqn7puWbHaYoq3GlURch1LALTwGRkqdV3inqZgIi2/NwJWdrOw6+IZ2R
         JXgBfgsx/v2aoOj1JYEntsqDN3uTDoTntDZ8Z8GiD7Tzrgo9Cqs0r6b6kzXe0231nYwR
         9Egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6abcq3O1EPjgdyhvzwdMxIPAFt88vyijjAyZY43AuF8=;
        b=R3t/oz5XlBvPiPxf3g7nplCYQeGlLijJ7gKDjPeC3ZjpdE0c6xySkVoR1aqAOVW+bp
         V9V+tSb4qH/Grut+OyebI9zFM+IbLnjI+dZo3OUQuzoyNRYm25aEjFyDr6zro8jbXU2K
         QDFyMq1/ktcy6F/Y22q15ms+DBDDvD7pQDMR7aEkvezZIH/UkNApLXBl+0ONpaHGqn88
         ttm/6il3qjz1YWHCTomwhNIgG85IQgjGA06/ZSRhu5NvcSDEkp9d0gEeo1qx9lIKvYKj
         TBULYjVchEaGD2MbrC8MzGC3WQkb5bU9Rxipd8K7CS0JAlAMLNtH95/QTb4gqWcUPbYQ
         vh2Q==
X-Gm-Message-State: AOAM5304xkWpaV7aPeisNbxIQNdSMf5TWELZmoq7URkvwD51/4GkApuv
        u6JrvHd54yv7dNP3t4tbk2pifg==
X-Google-Smtp-Source: ABdhPJweDresjgbp+7Botd2PLPWg/Px8U48d3x0QNr+ZrvuJBrlwIfDunDoMxl8QXTsz9V7vhps5vQ==
X-Received: by 2002:a17:906:d108:b0:6e8:7765:a70b with SMTP id b8-20020a170906d10800b006e87765a70bmr15802157ejz.436.1649832268884;
        Tue, 12 Apr 2022 23:44:28 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id qf21-20020a1709077f1500b006e84ee40742sm5918659ejc.218.2022.04.12.23.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 23:44:28 -0700 (PDT)
Message-ID: <e289c59c-96fe-38f0-8be3-7c1ba416817f@linaro.org>
Date:   Wed, 13 Apr 2022 08:44:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
Content-Language: en-US
To:     Conor Dooley <mail@conchuod.ie>, Conor.Dooley@microchip.com,
        mturquette@baylibre.com, sboyd@kernel.org, aou@eecs.berkeley.edu,
        paul.walmsley@sifive.com, palmer@rivosinc.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     Daire.McNamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-6-conor.dooley@microchip.com>
 <d49f38e7-5fd9-4e9a-cc20-2c839eb53712@linaro.org>
 <2e1b0207-dfb3-4cc5-d306-d2b0c6ed8cfd@microchip.com>
 <25feb189-4d97-f9b1-518e-69aae9a274e0@linaro.org>
 <74695e55-0b59-9236-be19-b02060ad4177@microchip.com>
 <ba518d4d-0f92-0d34-029c-c477c84db81d@linaro.org>
 <f2c0c8ba-bdfd-faeb-cdff-ed3fe5215029@conchuod.ie>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f2c0c8ba-bdfd-faeb-cdff-ed3fe5215029@conchuod.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/04/2022 20:29, Conor Dooley wrote:
> The way it's implemented is a bit interconnected and none of the three
> blocks would satisfy a "self contained" constraint. Eg. The rtcref
> divider's control reg sits between two registers responsible for the
> CLK_CPU -> CLK_CFM clocks but it's input clock mux is in the same 
> sub-block as the MSSPLL.
> 
> I guess its better put that each of the three are sub-blocks of a self
> contained clock controller for the mss core complex. There are several
> other clock domains on the chip which would have distinct clock
> controllers & may be added to this header in the future, if letting
> Linux control them makes any sense. For example, clocks in (and used for
> the clocking of) the fpga fabric.
> 
> This controller is a single node in the device tree. Sounds like
> reordering it numerically makes the most sense then - I'll resend
> tomorrow if that's okay.

Yes.


Best regards,
Krzysztof
