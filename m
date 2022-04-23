Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0DEF50C621
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Apr 2022 03:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbiDWBoR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Apr 2022 21:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiDWBoQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Apr 2022 21:44:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0711B45C2;
        Fri, 22 Apr 2022 18:41:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA5F160FFC;
        Sat, 23 Apr 2022 01:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272F8C385A4;
        Sat, 23 Apr 2022 01:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650678080;
        bh=amRBwJdjQuLgD+Pi20DhdLXO2pAUbgdtM9M0hZkENgA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lCcwsPaJzn+XsS5jL9t0HCv2GCWG5TWpjP6bhGuRmx9DdjLlXZ6xrg1iKzIaOl9C8
         7DBIDuEsxBpmDZTNtWawbvjvRT+QlfC4RyCvSEreNFCxewWMWtmK3LhA4wyYTXHqGX
         5tFWTocNFYw2o3QT3DRE5BLxF3LgihbeDtTMieTB2m5d3DRuHAIWqo4P+bRxj8hOkP
         ZFTiFWvMn6mqdkGSEVKY8jkhcxEie3WBEE228etXpU4NUzOe5R+55TnhU0duFdRQlJ
         oTQg97DhU13s3x9pZtYnbC2+pZ1DHU6uC3LCD1dRpp0ginQ/8YsL4MDC/+MNEMZwNv
         wMejMWliJN7Bw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220413075835.3354193-4-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com> <20220413075835.3354193-4-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 3/9] riscv: dts: microchip: fix usage of fic clocks on mpfs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>
To:     Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu,
        krzk+dt@kernel.org, mturquette@baylibre.com, palmer@rivosinc.com,
        paul.walmsley@sifive.com, robh+dt@kernel.org
Date:   Fri, 22 Apr 2022 18:41:18 -0700
User-Agent: alot/0.10
Message-Id: <20220423014120.272F8C385A4@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Quoting Conor Dooley (2022-04-13 00:58:30)
> The fic clocks passed to the pcie controller and other peripherals in
> the device tree are not the clocks they actually run on. The fics are
> actually clock domain crossers & the clock config blocks output is the
> mss/cpu side input to the interconnect. The peripherals are actually
> clocked by fixed frequency clocks embedded in the fpga fabric.
>=20
> Fix the device tree so that these peripherals use the correct clocks.
> The fabric side FIC0 & FIC1 inputs both use the same 125 MHz, so only
> one clock is created for them.
>=20
> Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicl=
e kit device tree")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes
