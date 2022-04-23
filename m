Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76AC350C628
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Apr 2022 03:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiDWBo6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Apr 2022 21:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbiDWBo5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Apr 2022 21:44:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A1C1F3B79;
        Fri, 22 Apr 2022 18:42:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 97F7160FF3;
        Sat, 23 Apr 2022 01:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC10C385A4;
        Sat, 23 Apr 2022 01:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650678122;
        bh=4KnlRJYulWnZ68ZF4bHllHzn8HcaDgDKHWhKudKDFEo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jHQICZetUsT+dXdq0t6+3+YCGgjNL4ktfLVStpnFEHbrEFaQxOApR9v+VTRSSPiat
         zG9kmA+JdErG5eolP+RNXQoPVZHuK2c44LClrq5AwL/Y+46i3qaTxTwLCTxu5D8cb4
         9icFZkd6ZL+ri8wHnpSzPYra0lFkehHcbdgBCwZ9GZU7eZTzdA5L1UTdm0JGEyG6av
         l+5Rl2Pepi/9K6kerYusRB9Ns1L/oJZDvd41Al3J28Zw4WNMeCp7UvAo4pbSKsoVDZ
         ed7vEcnmHL7Lx0Mm2svQvmxUgPETD5VRCMFxlx73ZIkY8c41DwqjOHsn9PHrfWUaSH
         AasWBSIz9/IRA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220413075835.3354193-9-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com> <20220413075835.3354193-9-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 8/9] clk: microchip: mpfs: add RTCREF clock control
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>
To:     Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu,
        krzk+dt@kernel.org, mturquette@baylibre.com, palmer@rivosinc.com,
        paul.walmsley@sifive.com, robh+dt@kernel.org
Date:   Fri, 22 Apr 2022 18:42:00 -0700
User-Agent: alot/0.10
Message-Id: <20220423014201.EEC10C385A4@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Quoting Conor Dooley (2022-04-13 00:58:35)
> The reference clock used by the PolarFire SoC's onboard rtc was missing
> from the clock driver. Add this clock at the "config" clock level, with
> the external reference clock as its parent.
>=20
> Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire =
SoC")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes
