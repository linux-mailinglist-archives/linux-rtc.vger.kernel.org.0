Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE7E50C61F
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Apr 2022 03:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiDWBoC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Apr 2022 21:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiDWBoC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Apr 2022 21:44:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A34F319AD93;
        Fri, 22 Apr 2022 18:41:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3C2FD61207;
        Sat, 23 Apr 2022 01:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8574CC385A0;
        Sat, 23 Apr 2022 01:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650678063;
        bh=tuGqr6gU1mR99kcU7SKJ6rO0n2SxgGEXTouyCk2CgaU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WT6vLbePq92qdTMMPpP1ABP8r+vcFSCAK0o47fmPsc6iX4YKTZYgz9ppRyjrv6d/I
         dUDRG/m/Hz/qwdk3HlIweANQiaA2YBV0yzNYUV0n4ULUbnj7thgkt2c5f5Sfcn+qPC
         7VEtTP62rdp+NsbJIgVuCLf3m/QogP7Fqlq0z0pTTOlh0y9kuoqitqUdamzA4p1Gda
         ddbYVL3JGqGDiC/FP1A2sVf4Dt1GdunnTVfE4X0UpmNgwZNtdKV5+WVyBrCoOQXmnK
         IiPGQlPV1JzV12YMNXjYLdsMNv7VjH9ZKJB69NzJ6v3ziJEgcpakOimc4J/q7oMEJd
         Yz3WYShCgs6mw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220413075835.3354193-2-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com> <20220413075835.3354193-2-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/9] clk: microchip: mpfs: fix parents for FIC clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>
To:     Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu,
        krzk+dt@kernel.org, mturquette@baylibre.com, palmer@rivosinc.com,
        paul.walmsley@sifive.com, robh+dt@kernel.org
Date:   Fri, 22 Apr 2022 18:41:01 -0700
User-Agent: alot/0.10
Message-Id: <20220423014103.8574CC385A0@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Quoting Conor Dooley (2022-04-13 00:58:28)
> The fabric interconnects are on the AXI bus not AHB.
> Update their parent clocks to fix this.
>=20
> Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire =
SoC")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes
