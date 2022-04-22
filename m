Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBAFB50C3D6
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Apr 2022 01:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232016AbiDVWOZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Apr 2022 18:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232885AbiDVWNF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Apr 2022 18:13:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA5322407E;
        Fri, 22 Apr 2022 14:00:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AE464B82D82;
        Fri, 22 Apr 2022 21:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68019C385AA;
        Fri, 22 Apr 2022 21:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650661240;
        bh=FwJU4+do9xfssxQ9LD+FcTKxdvYIPYbMbEWSNrxzoCQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TpXs8qW598EiNpBkDknHFjG01azSgBEoX+nXuSBbk4UkYHgtT8TPLGfAhNi85vgoz
         O8A9vbhwyk/g+R93j2ALW3/yXv5LwK9q+cUUvM7unwPp3RBNX3y68BP4+lnyB32nlV
         bqSYq47B6/vtsHWq1UWZDhfcZwyHOqiSr5y0P9rLXzgrM2qyeLKUtHTMV8Rs5Z841w
         +DWMvlWagHbq74ruhtxxcXYEEMgeO2JA/Pw0tQ4P9GEAovT1BDlmLbSUie/upmZk0r
         GS1a5hvuEN25rwEPHN55MsOBs0/KgL3ppb8Op3WLO18Vsz6MKlMDgY/rVGIQPXszzk
         ah1c/jLZ9Gyhw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0f99ec7b-0c2f-cf6c-162d-af615eb73373@conchuod.ie>
References: <mhng-185e3a61-0634-4671-adfd-a1cc223920cf@palmer-ri-x1c9> <0f99ec7b-0c2f-cf6c-162d-af615eb73373@conchuod.ie>
Subject: Re: [PATCH v3 0/9] More PolarFire SoC Fixes for 5.18
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, aou@eecs.berkeley.edu,
        Paul Walmsley <paul.walmsley@sifive.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, daire.mcnamara@microchip.com,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
        conor.dooley@microchip.com
To:     Conor Dooley <mail@conchuod.ie>,
        Palmer Dabbelt <palmer@rivosinc.com>, atulkhare@rivosinc.com
Date:   Fri, 22 Apr 2022 14:00:38 -0700
User-Agent: alot/0.10
Message-Id: <20220422210040.68019C385AA@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Quoting Conor Dooley (2022-04-22 12:59:09)
> On 22/04/2022 20:39, Palmer Dabbelt wrote:
> >=20
> > Thanks.=C2=A0 These generally look good to me, but I don't see acks fro=
m everyone.=C2=A0 I'm perfectly fine treating these as fixes and taking the=
m through the RISC-V tree, but looks like it's mostly clk stuff so
> >=20
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> Ye, hopefully they go via clk. Stephen replied to v1 or 2 so
> I figure they're in his queue :)

It helps to be explicit in the cover letter. It's in my queue but I put
it on hold because the cover letter didn't clarify what tree it was
intended for nor the priority of what is being fixed.

Is boot broken? Do I need to send these up to Linus next week as part of
fixes for this merge window?
