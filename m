Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5F9150C484
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Apr 2022 01:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbiDVWgc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Apr 2022 18:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233150AbiDVWgP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Apr 2022 18:36:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1E222E954;
        Fri, 22 Apr 2022 14:52:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E4EAE61F08;
        Fri, 22 Apr 2022 21:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CC4C385AF;
        Fri, 22 Apr 2022 21:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650664338;
        bh=SiAUjoz3T+1aeVALD2Eh+giKN0JVMqZN76YryIJ4mt8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JZlHS9SnrcUwTN/8SirsExgdtVW06cE0Tb9Ajn3T+CmGlQ8/99Cjok2tbbdXMSX6I
         unOwrG3SN2csgsIcinwjjBZx3GTIxzgbb+v4Fex8cj0XJz5wi5ztxP2iKBTnGMZmEN
         xgnXpklcG6WExd4GDNi21Jjj2n/3K7UiDNa7vQwFx0AE/8QmCJPjhMncwbi6Nkz1U5
         uISD3pMZIVmI5AbcpmJJOyf5gG2FrNGDLL85lv57phdoz8pXq8i8Ap4iz20oK0h9sD
         BwRNMtdqatNr6husm399n58uFqRMjbQwgOyVxcTU4HSaKfgP+5tJzh/wg351eXGa9z
         AWGy6x7+ryIWA==
Received: by mail-pl1-f177.google.com with SMTP id c12so13644612plr.6;
        Fri, 22 Apr 2022 14:52:18 -0700 (PDT)
X-Gm-Message-State: AOAM531qgsmZvAQTF0XyClNQxwawZDDQMucznU3aX5ztSydwMrVS7+8t
        5j/oOPjSDxw7XfRvDta6SwaXiFhMYafbUd+WSA==
X-Google-Smtp-Source: ABdhPJxwTRWYr1mK8u4TOSQmwU1J9n4B/PUTMMO4yVY9LMlSYIg2sLv98fHfLXLaS6h423zejzhIyKAdFgTdwgHJxgQ=
X-Received: by 2002:a17:902:b694:b0:153:1d9a:11a5 with SMTP id
 c20-20020a170902b69400b001531d9a11a5mr6374024pls.151.1650664337751; Fri, 22
 Apr 2022 14:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-185e3a61-0634-4671-adfd-a1cc223920cf@palmer-ri-x1c9> <0f99ec7b-0c2f-cf6c-162d-af615eb73373@conchuod.ie>
In-Reply-To: <0f99ec7b-0c2f-cf6c-162d-af615eb73373@conchuod.ie>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 22 Apr 2022 16:52:05 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJpd1dBNmWcsbLQZAWj=0am_98ztonOxEgGjXBGddfiNA@mail.gmail.com>
Message-ID: <CAL_JsqJpd1dBNmWcsbLQZAWj=0am_98ztonOxEgGjXBGddfiNA@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] More PolarFire SoC Fixes for 5.18
To:     Conor Dooley <mail@conchuod.ie>
Cc:     Palmer Dabbelt <palmer@rivosinc.com>, atulkhare@rivosinc.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Apr 22, 2022 at 2:59 PM Conor Dooley <mail@conchuod.ie> wrote:
>
> On 22/04/2022 20:39, Palmer Dabbelt wrote:
> > On Wed, 13 Apr 2022 00:58:27 PDT (-0700), conor.dooley@microchip.com wr=
ote:
> >> Hey all,
> >> After the clock driver for the PolarFire SoC was accepted I started wo=
rk
> >> on the onboard RTC & found out that the reference clock for the rtc wa=
s
> >> actually missing from the clock driver.
> >>
> >> While restructuring the clock driver to add support for the rtc
> >> reference, I also noticed that there were some problems with how the F=
IC
> >> clocks were being used. The FIC clocks are the cpu side inputs to the
> >> AXI fabric interconnections & are not the clocks for any peripherals.
> >>
> >> This first three patches in this series fixes the problems with the FI=
Cs:
> >> - the fic clocks incorrectly had the AHB clock as their parents
> >> - the last fic, named differently to the others, had not been set as
> >>   a critical clock
> >> - some peripherals on the fabric side were incorrectly using the cpu
> >>   side fic clocks, resulting in incorrect rates.
> >>
> >> The second part of the series fixes the missing rtc reference clock.
> >> There are three main changes:
> >> - Changing the reference clock in the dt to the external 125 MHz
> >>   oscillator rather than using the output of an internal pll. This has
> >>   the added benefit of not requiring changes to the device tree if thi=
s
> >>   part of the bitstream changes.
> >> - Adding a new clock into the driver that sits above the existing
> >>   configurable clocks & has the external reference as a parent. The ne=
w
> >>   clock provides the parent for the AHB/AXI clocks which formerly came
> >>   from the device tree.
> >> - Adding the rtc reference clock to the dt bindings, device tree and
> >>   clock driver at the configurable clock level, alongside AXI and AHB.
> >>
> >> I kept series separate from [0] since that's tied to the CONFIG_PM stu=
ff
> >> & fixes a specific problem.
> >>
> >> Changes since v1:
> >> After speaking with Krzysztof, I have merged the rtc reference changes
> >> [1] with these fixes for 5.18. This was done since the relevant driver=
s
> >> and bindings only arrived in v5.18 & there'll now be no issue with
> >> breaking the ABI.
> >> Backwards compatiblity with the device tree from before 5.18 will be
> >> broken by these changes, but the board did not boot then anyway... If
> >> that is not okay, please lmk.
> >>
> >> The patch renaming sys_base was dropped since that's not a fix.
> >>
> >> Version 1 would not apply without [0] & that should be fixed too.
> >>
> >> Thanks,
> >> Conor.
> >>
> >> Changes since v2:
> >> - Wrapped text in dt-binding changes at 80 cols
> >> - Ordered the clock defines numerically in the binding header
> >> - Fixed the Fixes tag on the last patch and added the second tag
> >>
> >> [0] https://lore.kernel.org/linux-riscv/20220408143646.3693104-1-conor=
.dooley@microchip.com
> >> [1] https://lore.kernel.org/linux-riscv/20220411072340.740981-1-conor.=
dooley@microchip.com
> >>
> >> Conor Dooley (9):
> >>   clk: microchip: mpfs: fix parents for FIC clocks
> >>   clk: microchip: mpfs: mark CLK_ATHENA as critical
> >>   riscv: dts: microchip: fix usage of fic clocks on mpfs
> >>   dt-bindings: clk: mpfs document msspll dri registers
> >>   dt-bindings: clk: mpfs: add defines for two new clocks
> >>   dt-bindings: rtc: add refclk to mpfs-rtc
> >>   clk: microchip: mpfs: re-parent the configurable clocks
> >>   clk: microchip: mpfs: add RTCREF clock control
> >>   riscv: dts: microchip: reparent mpfs clocks
> >>
> >>  .../bindings/clock/microchip,mpfs.yaml        |  13 +-
> >>  .../bindings/rtc/microchip,mfps-rtc.yaml      |  15 +-
> >>  .../dts/microchip/microchip-mpfs-fabric.dtsi  |  16 +-
> >>  .../microchip/microchip-mpfs-icicle-kit.dts   |   2 +-
> >>  .../boot/dts/microchip/microchip-mpfs.dtsi    |  10 +-
> >>  drivers/clk/microchip/clk-mpfs.c              | 191 +++++++++++++++--=
-
> >>  .../dt-bindings/clock/microchip,mpfs-clock.h  |   5 +-
> >>  7 files changed, 211 insertions(+), 41 deletions(-)
> >
> > Thanks.  These generally look good to me, but I don't see acks from eve=
ryone.  I'm perfectly fine treating these as fixes and taking them through =
the RISC-V tree, but looks like it's mostly clk stuff so
> >
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> Ye, hopefully they go via clk. Stephen replied to v1 or 2 so
> I figure they're in his queue :)
>
> >
> > in case someone else wants to take it.  I've put these over at palmer/r=
iscv-pfsoc-clk but haven't merged that anywhere, I'll hold off until at lea=
st next week to give everyone time to chime in.
> >
> > On a somewhat related note, I'm getting some DT schema failures
> >    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/m=
icrochip/microchip-mpfs-icicle-kit.dtb: /: memory@80000000: 'clocks' does n=
ot match any of the regexes: 'pinctrl-[0-9]+'
> >            From schema: /home/palmer/.local/lib/python3.8/site-packages=
/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/memory.yaml
> >    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/m=
icrochip/microchip-mpfs-icicle-kit.dtb: /: memory@1000000000: 'clocks' does=
 not match any of the regexes: 'pinctrl-[0-9]+'
> >            From schema: /home/palmer/.local/lib/python3.8/site-packages=
/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/memory.yaml
> >    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/m=
icrochip/microchip-mpfs-icicle-kit.dtb: soc: syscontroller: {'compatible': =
['microchip,mpfs-sys-controller'], 'mboxes': [[15, 0]], 'status': ['okay']}=
 should not be valid under {'type': 'object'}
> >            From schema: /home/palmer/.local/lib/python3.8/site-packages=
/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/simple-bus.yaml
> >    Looks like none of them are new from this patch set, though.  Atul's=
 been chasing down various DT schema failures so they might be fixed alread=
y.
>
> Ye, I do know about those. I meant to try deleting the clocks
> property but didn't get a chance, just been busy. It's not
> related to this series nor does it matter if it makes it prior
> to 5.18 so I was going to submit it on its own.
> The other is in my list-of-things-to-ask-Rob/Krzk-when-I-know-
> for-sure-what-my-question-actually-is...

microchip,mpfs-sys-controller doesn't have MMIO registers, so it's not
on a MMIO bus (aka simple-bus). Move it to an appropriate location
(top level if not part of something else).

Rob
