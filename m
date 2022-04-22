Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8195D50C536
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Apr 2022 01:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbiDVXd7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Apr 2022 19:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbiDVXdq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Apr 2022 19:33:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6BC4162268;
        Fri, 22 Apr 2022 16:16:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D6E78B832E0;
        Fri, 22 Apr 2022 23:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EA1C385A4;
        Fri, 22 Apr 2022 23:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650669370;
        bh=/CjtjtNSZGyZ1red00IH8RKEAl2lNuDUSISS7dZCoVg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sFmsdo+0culF8zTTfFSx8AAGcag3IH5KrLGTit8chcZLj+YrtdLBRk1yNPaPeudBV
         g37q5X/iUevuBn4Ex+3LevzdnsbvcKYinyVtaeOr0mYXStgwRp+jxDbtkCAIvt6NF9
         ektlkJQJXSe5UUREWQvEbveBVXbQ/AT1WXqMKpWwS1VFELN3KXYBB7Fw+658uyztPx
         HhbTfdFx7L3d4hJKSF0SDGBp2fK9NmjS9GTSHW+z4qpjgEIxuzbc/s53aGPBntd1VA
         0gJVAJ9/UOQfgwqrav09Us34YSMrF47OtJPA0O9IpoMVFkPFHALNIJpnhVhaSxm/IQ
         S6CfAFXeE+Agg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220421090016.79517-3-miquel.raynal@bootlin.com>
References: <20220421090016.79517-1-miquel.raynal@bootlin.com> <20220421090016.79517-3-miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 2/7] soc: renesas: rzn1-sysc: Fix the RTC hclock description
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 22 Apr 2022 16:16:08 -0700
User-Agent: alot/0.10
Message-Id: <20220422231610.75EA1C385A4@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The subject should start with clk:, not soc:

Quoting Miquel Raynal (2022-04-21 02:00:11)
> It needs to be un-gated, but also a reset must be released and an idle
> flag should also be disabled.
>=20
> The driver already supports all these operations, so update the
> description of the RTC hclock to fit these requirements.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/renesas/r9a06g032-clocks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20

Otherwise

Acked-by: Stephen Boyd <sboyd@kernel.org>
