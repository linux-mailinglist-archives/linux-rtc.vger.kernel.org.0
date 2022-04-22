Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC5450C0E1
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Apr 2022 23:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiDVVF0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Apr 2022 17:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiDVVFZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Apr 2022 17:05:25 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFFF31E0DE
        for <linux-rtc@vger.kernel.org>; Fri, 22 Apr 2022 13:00:45 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id m15-20020a7bca4f000000b0038fdc1394b1so8652223wml.2
        for <linux-rtc@vger.kernel.org>; Fri, 22 Apr 2022 13:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5zGZiMitS1evgY9qIYenBHSrFm6S3d/BLWaCHm4n4f0=;
        b=1ImwZnzv/pW4MYKDl7BNUFvreWwbrSTg0DMQTP4+TSk5IK+AkNdFJyixtjirDgA3f+
         NJCUBPDMZrT7O0sNprnYcjiTPtwDG0ef8tBtsH8e21qrzxeNAXuV0OSq5jtwqxWhNxzo
         qPA3vWsBdP4djkk0IQ5cIrb/r/yGmeyL/R5EZAf+TTic4/JAbT2BLdpJLppvxLXRdAfN
         Dl/PhHMhjcxa0UtTrH2h4ZwPaFlqqGxeco7raSz9VbkTYOcbHUDlieH9P0v48qTkoRM6
         MDUWYx0e3kBJ7RafnzceQVJtqyMH+Mm59cYr7ei7tf8+E1TLthrSJaNtUPeqoy7vBJmz
         fGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5zGZiMitS1evgY9qIYenBHSrFm6S3d/BLWaCHm4n4f0=;
        b=Stg76ik3MYhr+znSiuTwZasbDRob/P8UkvXQsOvRT7hyVsUdzqELsZbwGsy3TcF/zA
         p691EEEoIfTWlGnV+xV/H2D+Lp8BmeNA/Y04zBJQ0hrAR7WgUWAmUCKAoyo52wuivFR3
         aKy3BEu+6c5+ADFAS/moHCuHfD56yACQhZeWc8UqwddNW2KbUvLFwcGLgsOF3Zn4sV5k
         M/CH/7Vqtt11koyW34SWUzIciAPjBUDVAG1OCVOJS1XCkqVN+T0qAVIQJh0QoRreYmyH
         ML3Jqp9vl9VG1/TYwm4UC2GHZFRxDv7jgoumi5eotDntxMpHSTm/tN8YU7B2S70Rzg6K
         D2Wg==
X-Gm-Message-State: AOAM533o3atd6xy6YyCOhKJd5K+P8lpPjjrCbMyfb+mgUNb2ngoXnjPX
        mB57Hq9NkPR7ZY9srvaONaesuQ==
X-Google-Smtp-Source: ABdhPJxafWASbjCLREtp5weepR8B65VITkUSrM/NS4txPAdZiUIXRh8lCcv0VRgQxZRDr4eaie+oSA==
X-Received: by 2002:a05:600c:1d12:b0:391:3cf6:243e with SMTP id l18-20020a05600c1d1200b003913cf6243emr5559100wms.137.1650657551183;
        Fri, 22 Apr 2022 12:59:11 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.209.28])
        by smtp.gmail.com with ESMTPSA id az20-20020a05600c601400b0038ffb253bb3sm6160948wmb.36.2022.04.22.12.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 12:59:10 -0700 (PDT)
Message-ID: <0f99ec7b-0c2f-cf6c-162d-af615eb73373@conchuod.ie>
Date:   Fri, 22 Apr 2022 20:59:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 0/9] More PolarFire SoC Fixes for 5.18
Content-Language: en-US
To:     Palmer Dabbelt <palmer@rivosinc.com>, atulkhare@rivosinc.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, aou@eecs.berkeley.edu,
        Paul Walmsley <paul.walmsley@sifive.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, daire.mcnamara@microchip.com,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
        conor.dooley@microchip.com
References: <mhng-185e3a61-0634-4671-adfd-a1cc223920cf@palmer-ri-x1c9>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <mhng-185e3a61-0634-4671-adfd-a1cc223920cf@palmer-ri-x1c9>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/04/2022 20:39, Palmer Dabbelt wrote:
> On Wed, 13 Apr 2022 00:58:27 PDT (-0700), conor.dooley@microchip.com wrote:
>> Hey all,
>> After the clock driver for the PolarFire SoC was accepted I started work
>> on the onboard RTC & found out that the reference clock for the rtc was
>> actually missing from the clock driver.
>>
>> While restructuring the clock driver to add support for the rtc
>> reference, I also noticed that there were some problems with how the FIC
>> clocks were being used. The FIC clocks are the cpu side inputs to the
>> AXI fabric interconnections & are not the clocks for any peripherals.
>>
>> This first three patches in this series fixes the problems with the FICs:
>> - the fic clocks incorrectly had the AHB clock as their parents
>> - the last fic, named differently to the others, had not been set as
>>   a critical clock
>> - some peripherals on the fabric side were incorrectly using the cpu
>>   side fic clocks, resulting in incorrect rates.
>>
>> The second part of the series fixes the missing rtc reference clock.
>> There are three main changes:
>> - Changing the reference clock in the dt to the external 125 MHz
>>   oscillator rather than using the output of an internal pll. This has
>>   the added benefit of not requiring changes to the device tree if this
>>   part of the bitstream changes.
>> - Adding a new clock into the driver that sits above the existing
>>   configurable clocks & has the external reference as a parent. The new
>>   clock provides the parent for the AHB/AXI clocks which formerly came
>>   from the device tree.
>> - Adding the rtc reference clock to the dt bindings, device tree and
>>   clock driver at the configurable clock level, alongside AXI and AHB.
>>
>> I kept series separate from [0] since that's tied to the CONFIG_PM stuff
>> & fixes a specific problem.
>>
>> Changes since v1:
>> After speaking with Krzysztof, I have merged the rtc reference changes
>> [1] with these fixes for 5.18. This was done since the relevant drivers
>> and bindings only arrived in v5.18 & there'll now be no issue with
>> breaking the ABI.
>> Backwards compatiblity with the device tree from before 5.18 will be
>> broken by these changes, but the board did not boot then anyway... If
>> that is not okay, please lmk.
>>
>> The patch renaming sys_base was dropped since that's not a fix.
>>
>> Version 1 would not apply without [0] & that should be fixed too.
>>
>> Thanks,
>> Conor.
>>
>> Changes since v2:
>> - Wrapped text in dt-binding changes at 80 cols
>> - Ordered the clock defines numerically in the binding header
>> - Fixed the Fixes tag on the last patch and added the second tag
>>
>> [0] https://lore.kernel.org/linux-riscv/20220408143646.3693104-1-conor.dooley@microchip.com
>> [1] https://lore.kernel.org/linux-riscv/20220411072340.740981-1-conor.dooley@microchip.com
>>
>> Conor Dooley (9):
>>   clk: microchip: mpfs: fix parents for FIC clocks
>>   clk: microchip: mpfs: mark CLK_ATHENA as critical
>>   riscv: dts: microchip: fix usage of fic clocks on mpfs
>>   dt-bindings: clk: mpfs document msspll dri registers
>>   dt-bindings: clk: mpfs: add defines for two new clocks
>>   dt-bindings: rtc: add refclk to mpfs-rtc
>>   clk: microchip: mpfs: re-parent the configurable clocks
>>   clk: microchip: mpfs: add RTCREF clock control
>>   riscv: dts: microchip: reparent mpfs clocks
>>
>>  .../bindings/clock/microchip,mpfs.yaml        |  13 +-
>>  .../bindings/rtc/microchip,mfps-rtc.yaml      |  15 +-
>>  .../dts/microchip/microchip-mpfs-fabric.dtsi  |  16 +-
>>  .../microchip/microchip-mpfs-icicle-kit.dts   |   2 +-
>>  .../boot/dts/microchip/microchip-mpfs.dtsi    |  10 +-
>>  drivers/clk/microchip/clk-mpfs.c              | 191 +++++++++++++++---
>>  .../dt-bindings/clock/microchip,mpfs-clock.h  |   5 +-
>>  7 files changed, 211 insertions(+), 41 deletions(-)
> 
> Thanks.  These generally look good to me, but I don't see acks from everyone.  I'm perfectly fine treating these as fixes and taking them through the RISC-V tree, but looks like it's mostly clk stuff so
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Ye, hopefully they go via clk. Stephen replied to v1 or 2 so
I figure they're in his queue :)

> 
> in case someone else wants to take it.  I've put these over at palmer/riscv-pfsoc-clk but haven't merged that anywhere, I'll hold off until at least next week to give everyone time to chime in.
> 
> On a somewhat related note, I'm getting some DT schema failures
>    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@80000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
>            From schema: /home/palmer/.local/lib/python3.8/site-packages/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/memory.yaml
>    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@1000000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
>            From schema: /home/palmer/.local/lib/python3.8/site-packages/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/memory.yaml
>    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: soc: syscontroller: {'compatible': ['microchip,mpfs-sys-controller'], 'mboxes': [[15, 0]], 'status': ['okay']} should not be valid under {'type': 'object'}
>            From schema: /home/palmer/.local/lib/python3.8/site-packages/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/simple-bus.yaml
>    Looks like none of them are new from this patch set, though.  Atul's been chasing down various DT schema failures so they might be fixed already.

Ye, I do know about those. I meant to try deleting the clocks
property but didn't get a chance, just been busy. It's not
related to this series nor does it matter if it makes it prior
to 5.18 so I was going to submit it on its own.
The other is in my list-of-things-to-ask-Rob/Krzk-when-I-know-
for-sure-what-my-question-actually-is...

Thanks,
Conor.
