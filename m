Return-Path: <linux-rtc+bounces-2261-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFBA9A5D2C
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2024 09:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DF911F242CA
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2024 07:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5231DF73F;
	Mon, 21 Oct 2024 07:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tm2Alw2h"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259DE1DED50;
	Mon, 21 Oct 2024 07:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729496086; cv=none; b=CREoAcJcMWbJ+bJ0efANLkTl2yVDfx56XSphNY4dTGH6uuAsMffb2CkjIG7lFruQAkeFEQs74z1cziZxmsuxs0KOk3+VghLSFfajS85afg7WIQBwe9LlLS2OtmhRHGg0z5HpnyEhwYxQ4tVjLE98TzdeUlLVRjdbqF8u0V3BtxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729496086; c=relaxed/simple;
	bh=PGRrRgvi2jqRX+mltsSqaXvIpNV6ix71vEvoVNKTNhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msnTpSDjlIZuuUWrQaWY6P8J7zkq7i8ZaTzAUNop7G7nOQf6rXLUeNLsE0OvId23B6lpVOdXfV5pIagRfc+6CTF3LNQD1YJNb1pQpsSO3BWjDEwK6b6pOoeJV1iI5My7g6G1xwBfYkaxHhH4Zy8jZsxTzDF29esmJ1HXx2iqj3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tm2Alw2h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1C8C4CECD;
	Mon, 21 Oct 2024 07:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729496085;
	bh=PGRrRgvi2jqRX+mltsSqaXvIpNV6ix71vEvoVNKTNhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tm2Alw2hOg9v5wXx0gBX81LrWj7kvzaWYLEfOMl3GXJn1S4gAFNgV2TtyMnxNpBBW
	 hRtF5RzyY/0yPfBJThgtW1P64LEh7jgn+/y2ZPy+XxTUybIuL8DLe5fYcUUWljqNHp
	 +UGW8bF+gqkBiOzVX68xdsqANE5fC5A2SViJKYcqFx5cIjxD7Uvk/8BMTdE5Rtb8wv
	 tGoUxCs7H9V+Lse19rn3RvyR7c9TQ9EbYdo6bD8F7Ki0NZwptmj6w/zjGqXCNFJrGT
	 BsSP5xW4ArO8bnnPQsUZb2Tb4NBD0Lka/ocCpAe9+/uC8YVcXXY2hE0e4l5QoBYnw6
	 yWUAR5VFtwSbg==
Date: Mon, 21 Oct 2024 09:34:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 03/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Message-ID: <5fddjnvzu2e74rtmqw6o2w5upxn6dpih3hmdbgiky75qyuvyum@ilch2rahnmih>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
 <20241019084738.3370489-4-claudiu.beznea.uj@bp.renesas.com>
 <m4kxv7cba6qd67ahhh4cal6sgieohgow6f3tdvqoxvheemtp4j@gpxbkxd3tvat>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <m4kxv7cba6qd67ahhh4cal6sgieohgow6f3tdvqoxvheemtp4j@gpxbkxd3tvat>

On Mon, Oct 21, 2024 at 09:32:37AM +0200, Krzysztof Kozlowski wrote:
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r9a08g045-cpg.h>
> > +    #include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    clock-controller@1005c000 {
> > +        compatible = "renesas,r9a08g045-vbattb";
> > +        reg = <0x1005c000 0x1000>;
> > +        interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
> > +        clock-names = "bclk", "rtx";
> > +        assigned-clocks = <&vbattb VBATTB_MUX>;
> > +        assigned-clock-parents = <&vbattb VBATTB_XC>;
> 
> Why are you configuring internal clocks to internal parents? That's part
> internal to this device, not DTS... or at least some explanation would
> be useful.

From DTS I see this belongs to the board, not SoC, so makes sense.

Best regards,
Krzysztof


