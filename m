Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 001071DEBD2
	for <lists+linux-rtc@lfdr.de>; Fri, 22 May 2020 17:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730016AbgEVP2r (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 May 2020 11:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730464AbgEVP2r (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 May 2020 11:28:47 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA9EC05BD43
        for <linux-rtc@vger.kernel.org>; Fri, 22 May 2020 08:28:46 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h17so10538526wrc.8
        for <linux-rtc@vger.kernel.org>; Fri, 22 May 2020 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RE02VevKPga5GawhGamW95ZE1kXVYxGQzWhCIbMIzNY=;
        b=MMWImdE/2ZE9LDYQnaGCIARyM962IGLuiw6eGA/jljxOaR7yh5pCQt+3wfvYRSnfOp
         k5JKNPBeS69Vv4hi1byp7pnaA42f2saUD3rcNGfywZnGGpjwbapkrf/6bKIN53qVqNEO
         rhdXGWgY4e93wR/0RmGUPVlIalsuTe6sMQE1MZS0cu5t5Qc8ZNM/VRySlOhxfKB+2Gkb
         wJ4Nf4RndEct8/FO2q4BKzMAbtrRS1/9TtSOs0WiR0qB5mcwBixid/P0ECqitXmzRmOP
         tkkkcU98mmsZgoNL7ljU3e7uujxzyRprCWUfqgC1FsPs9fl0G122XUrDsBGIZdWSkmqd
         nT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RE02VevKPga5GawhGamW95ZE1kXVYxGQzWhCIbMIzNY=;
        b=pHgKojLRZGHGfNCohqNztzftvBVC6varFTPuLfwZqNB9inmfeDGJdFNfhewso2yeg0
         GkZaYG6QCGYD22tJi1o/jlSO92Ge7+WADpjij8toVU8HPu+osbctuuN8ZLg2NNDuks/3
         kTOv0ukubNm2+TxJT4u2PhdCmqDbMIFXHdU4wT698VX+axbFG9nFWKOqn8e1eGAMgloe
         Lr+zoOrJfwf4950FcglVApj507VcHx8vcwRoHOxTGXE9t7ncQcTkP1Q79dihVvu3BpSB
         gRhA2jcyWe1fG/MAglH5N0sjckZff740qL4zsECfe0cf9UbHYAVBB6xRoJcnTDShmzs3
         ukZQ==
X-Gm-Message-State: AOAM531rg6xVfI2+920btuG9bbB2agp76yuRxI+5GLOlkpwy4TkFLOnm
        wvtQQDtMyxZc2zFiv6/nXYIh4A==
X-Google-Smtp-Source: ABdhPJxdCf7sw2JHdZ8XQZwe1iL/1ihyu6MfIaO/x8mio0kAv1N7GEStdaiFyyQDolFStnz3Rqs/ew==
X-Received: by 2002:adf:a3c9:: with SMTP id m9mr1159741wrb.405.1590161325014;
        Fri, 22 May 2020 08:28:45 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a82f:eaec:3c49:875a? ([2a01:e34:ed2f:f020:a82f:eaec:3c49:875a])
        by smtp.googlemail.com with ESMTPSA id s19sm6092584wmj.21.2020.05.22.08.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 08:28:44 -0700 (PDT)
Subject: Re: [PATCH v5 0/8] clocksource: Fix MIPS GIC and DW APB Timer for
 Baikal-T1 SoC support
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200521204818.25436-1-Sergey.Semin@baikalelectronics.ru>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <211ab91d-6085-3073-1cbc-2300abade1b7@linaro.org>
Date:   Fri, 22 May 2020 17:28:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200521204818.25436-1-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/05/2020 22:48, Serge Semin wrote:
> As for all Baikal-T1 SoC related patchsets, which need this, we replaced
> the DW APB Timer legacy plain text-based dt-binding file with DT schema.
> Similarly the MIPS GIC bindings file is also converted to DT schema seeing
> it also defines the MIPS GIC Timer binding.
> 
> Aside from MIPS-specific r4k timer Baikal-T1 chip also provides a
> functionality of two another timers: embedded into the MIPS GIC timer and
> three external DW timers available over APB bus. But we can't use them
> before the corresponding drivers are properly fixed. First of all DW APB
> Timer shouldn't be bound to a single CPU, since as being accessible over
> APB they are external with respect to all possible CPUs. Secondly there
> might be more than just two DW APB Timers in the system (Baikal-T1 has
> three of them), so permit the driver to use one of them as a clocksource
> and the rest - for clockevents. Thirdly it's possible to use MIPS GIC
> timer as a clocksource so register it in the corresponding subsystem
> (the patch has been found in the Paul Burton MIPS repo so I left the
> original Signed-off-by attribute). Finally in the same way as r4k timer
> the MIPS GIC timer should be used with care when CPUFREQ config is enabled
> since in case of CM2 the timer counting depends on the CPU reference clock
> frequency while the clocksource subsystem currently doesn't support the
> timers with non-stable clock.
> 
> This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
> base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
> tag: v5.7-rc4

Applied patch 1,2,4,5,6,7,8

Thanks!

  -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
