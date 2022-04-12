Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4C24FE87D
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Apr 2022 21:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348073AbiDLTRL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Apr 2022 15:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244301AbiDLTRJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Apr 2022 15:17:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373DF522E8;
        Tue, 12 Apr 2022 12:14:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C15D1B81FB3;
        Tue, 12 Apr 2022 19:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66335C385A1;
        Tue, 12 Apr 2022 19:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649790887;
        bh=bcAefXnMbjN8CcigBKO+g1I/idDevweEN7l4fJ9EEgU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=i2CBPPGcMCEfc7GP3tVSa1cfoGzVqvE7SZZh9K8M6Qfx09N6T2gvGP29wI3z/2CbP
         Z8pLTIGtQoLUl7Wx9ILSS1PuHI8UCOmFeYgr6Gt7tUqaONznxPD3Wh9L5PG9VRcyUB
         Je9xLtuDhd1Yj5XsHdE/JtLQexAtlASNYuXNIoHe7Y5ohLLQiD6VeYzWb/xenjQNgS
         +oY5rOm+rrxbMU72L8ZYfDMoKlSRlpFYW7zdFXcZ8QZ4BhAq7DtZ1o4dJRsaOyfcAW
         A1eMrBKoAev2PYV6rVBlcJkI9wBjXl4eu7AErOrvEPz7ALx/aPrczwdj4yig/7UU4I
         DuWCep8evarPQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220411085916.941433-8-conor.dooley@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com> <20220411085916.941433-8-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 7/9] clk: microchip: mpfs: re-parent the configurable clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>
To:     Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu,
        krzk+dt@kernel.org, mturquette@baylibre.com, palmer@rivosinc.com,
        paul.walmsley@sifive.com, robh+dt@kernel.org
Date:   Tue, 12 Apr 2022 12:14:45 -0700
User-Agent: alot/0.10
Message-Id: <20220412191447.66335C385A1@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Quoting Conor Dooley (2022-04-11 01:59:15)
> Currently the mpfs clock driver uses a reference clock called the
> "msspll", set in the device tree, as the parent for the cpu/axi/ahb
> (config) clocks. The frequency of the msspll is determined by the FPGA
> bitstream & the bootloader configures the clock to match the bitstream.
> The real reference is provided by a 100 or 125 MHz off chip oscillator.
>=20
> However, the msspll clock is not actually the parent of all clocks on
> the system - the reference clock for the rtc/mtimer actually has the
> off chip oscillator as its parent.
>=20
> In order to fix this, add support for reading the configuration of the
> msspll & reparent the "config" clocks so that they are derived from
> this clock rather than the reference in the device tree.
>=20
> Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire =
SoC")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>=20
> @Stephen/Mike: Is it acceptable to add the recalc rate without a set
> rate? If not lmk and I will add one.

Only recalc_rate is OK. It's like a read-only divider.
