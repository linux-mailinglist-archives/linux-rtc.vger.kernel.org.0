Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 570B650C622
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Apr 2022 03:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiDWBol (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Apr 2022 21:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiDWBol (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Apr 2022 21:44:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93531DFE4E;
        Fri, 22 Apr 2022 18:41:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 475D861365;
        Sat, 23 Apr 2022 01:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D9CC385A9;
        Sat, 23 Apr 2022 01:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650678105;
        bh=HtIN2BVfzna323NNeNCgrDBsHHLe1CJQr55YPNJbJ1E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fMeJVp3Th6wsfef4vii1FxRP1mSvgTInUIPvoYqBMn9ZL6XoDy9SMAsrKCHhJWXnM
         Z2HnF2WKjerCZxrw1a/ZhxW/hsO7J0BppgNdIHr9cQnH4bidw4lY6x+JWG9SbEEs+g
         m2sC9u1Edy7ojd+r6Vo7xuhStYzsteokkWO1LPfe6yjfaq+QfMk9E5JncmoxYOILFS
         vu3OucaJkRep0juvUJ1T8DhtCRPVrHaGjkioekoNeflO0KOeE1PEzYz7F7obRwn2fa
         0V6YPrijProHku///rpmqiQwcxMfHL+J0TxkZ/xM2LDP+IicbkvpoVYYuYepp8lk9l
         AXzz9T5QaQSAg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220413075835.3354193-7-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com> <20220413075835.3354193-7-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 6/9] dt-bindings: rtc: add refclk to mpfs-rtc
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
Date:   Fri, 22 Apr 2022 18:41:43 -0700
User-Agent: alot/0.10
Message-Id: <20220423014145.A1D9CC385A9@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Quoting Conor Dooley (2022-04-13 00:58:33)
> The rtc on PolarFire SoC does not use the AHB clock as its reference
> frequency, but rather a 1 MHz refclk that it shares with MTIMER. Add
> this second clock to the binding as a required property.
>=20
> Fixes: 4cbcc0d7b397 ("dt-bindings: rtc: add bindings for microchip mpfs r=
tc")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes
