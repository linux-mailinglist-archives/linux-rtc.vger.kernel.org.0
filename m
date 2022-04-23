Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95A5350C61B
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Apr 2022 03:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbiDWBod (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Apr 2022 21:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiDWBoc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Apr 2022 21:44:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1E91CA2C4;
        Fri, 22 Apr 2022 18:41:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5EFEC61207;
        Sat, 23 Apr 2022 01:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17ABC385A0;
        Sat, 23 Apr 2022 01:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650678096;
        bh=3+41YMiN4Ki21OPIbhXDBNTykkQdEPBi1dXT1rLdlQ4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kVnQUhShsuz2MBhUl6M76Ri/ZvwJbPP2fmBLqWSWbxl19C1N+yObPoiOUBq9cTGIP
         wZ7seN2bivWIkh3x71Gz/C4/jpkJluJdpwjU8VQ0Xm/kviSb4yQKATJC0t0RLqje8G
         6ARYlU4SxcX3rUtJF+v2b/xkZpF4FDn4O1X4kK8YXqnzB4JKlnSxmL1Jd2g0J3gUJ2
         r5Q6mbHVrrlUPLsEGH5xvtynBBFGpLKU2xruLDyKwv+sNbNdg4t+hoHwlanYNlokBC
         FuDZlu6APhyo9CbPtT7z17vO5nBHuq1EQHQOYGZpws1cKpilvb8b2099SikXuTxoCL
         8eJ2xCttqdRrQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220413075835.3354193-6-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com> <20220413075835.3354193-6-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 5/9] dt-bindings: clk: mpfs: add defines for two new clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>
To:     Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu,
        krzk+dt@kernel.org, mturquette@baylibre.com, palmer@rivosinc.com,
        paul.walmsley@sifive.com, robh+dt@kernel.org
Date:   Fri, 22 Apr 2022 18:41:34 -0700
User-Agent: alot/0.10
Message-Id: <20220423014136.B17ABC385A0@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Quoting Conor Dooley (2022-04-13 00:58:32)
> The RTC reference and MSSPLL were previously not documented or defined,
> as they were unused. Add their defines to the PolarFire SoC header.
>=20
> Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFir=
e host binding")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes
