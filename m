Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1C3D50C629
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Apr 2022 03:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbiDWBpI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Apr 2022 21:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbiDWBpH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Apr 2022 21:45:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC6A1F8D99;
        Fri, 22 Apr 2022 18:42:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3D92EB8335A;
        Sat, 23 Apr 2022 01:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C566CC385A4;
        Sat, 23 Apr 2022 01:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650678129;
        bh=tcithC5DzEZer/G1ZlAY81222Ep4Lx6hTBgIm+kR3yg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=m8nGQ2us8izwcK0E9KYE2RDKp3QUQJ8pPw/6f/CKVx+WwIo18sdW4JibVXg+hszcC
         gEYfv1/A1/zygFiQoblrcYsDTwz/8s6HCvxjInhunLk9EJUG9JVdFc3jzGcEN8I2Nt
         KzemqXxNbad+7ty+HfA/7gvDtewkWXvL4jfVUJtjmKfpG/4NKXih/oRKJ5AgjT7mMS
         s8fNWGMznevxfss27DTVmUAwbbro5qCTV3sr2/P/RfLGxgXg2u6I3N5MikoTW6YreY
         bUnS5CtjQkMLZhHN1JH4szEABZjmqm55I4tswYrxXZuAcZchU9Y6y+QNs3PcJR56j/
         56NOaVaZYAvJQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220413075835.3354193-10-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com> <20220413075835.3354193-10-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 9/9] riscv: dts: microchip: reparent mpfs clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>
To:     Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu,
        krzk+dt@kernel.org, mturquette@baylibre.com, palmer@rivosinc.com,
        paul.walmsley@sifive.com, robh+dt@kernel.org
Date:   Fri, 22 Apr 2022 18:42:08 -0700
User-Agent: alot/0.10
Message-Id: <20220423014209.C566CC385A4@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Quoting Conor Dooley (2022-04-13 00:58:36)
> The 600M clock in the fabric is not the real reference, replace it with
> a 125M clock which is the correct value for the icicle kit. Rename the
> msspllclk node to mssrefclk since this is now the input to, not the
> output of, the msspll clock. Control of the msspll clock has been moved
> into the clock configurator, so add the register range for it to the clk
> configurator. Finally, add a new output of the clock config block which
> will provide the 1M reference clock for the MTIMER and the rtc.
>=20
> Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicl=
e kit device tree")
> Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes
