Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85E7650C61E
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Apr 2022 03:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbiDWBoZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Apr 2022 21:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiDWBoY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Apr 2022 21:44:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C021C1DD9;
        Fri, 22 Apr 2022 18:41:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0FFA461207;
        Sat, 23 Apr 2022 01:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A52C385A9;
        Sat, 23 Apr 2022 01:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650678088;
        bh=jsDo2AinF74Ae7fo4jnv164sxB6sHihuJV6AmLjbYXM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jsWHYvVDd8CGn3uuP2PvRfPKk24vxua4Zk+EjelC6rotUHxuZCfxGkpGTd96C2rS/
         TpBFFyBMykmwbXgQgw4rwjgAkvVl+PC9L+fZLr1o6lG63wA9yiVFxnye/OWFZQ8rEY
         LD8770fklOdHlYoyUYltaomOuf494Vo8yH273Uuar8M/SxrvS5HZh4smUnAcZknJDv
         dnBPGK+UA/tbnhtHeIvMirxzwQsUAXDIG/QVA4oh2XOmE3VyrCf/CgztiOrT0klBNW
         AOxG/s3tK3axH4sqXgWQ6gA0NerB/5P5yK647NsZkePBQ7vOFM6DJ6qYxYHpQdxppH
         9rj4iJHlFXWVA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220413075835.3354193-5-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com> <20220413075835.3354193-5-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 4/9] dt-bindings: clk: mpfs document msspll dri registers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu,
        krzk+dt@kernel.org, mturquette@baylibre.com, palmer@rivosinc.com,
        paul.walmsley@sifive.com, robh+dt@kernel.org
Date:   Fri, 22 Apr 2022 18:41:26 -0700
User-Agent: alot/0.10
Message-Id: <20220423014128.66A52C385A9@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Quoting Conor Dooley (2022-04-13 00:58:31)
> As there are two sections of registers that are responsible for clock
> configuration on the PolarFire SoC: add the dynamic reconfiguration
> interface section to the binding & describe what each of the sections
> are used for.
>=20
> Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFir=
e host binding")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes
