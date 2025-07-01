Return-Path: <linux-rtc+bounces-4403-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B339AEF61F
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Jul 2025 13:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6715A7AC33A
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Jul 2025 11:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B20271479;
	Tue,  1 Jul 2025 11:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7GZChhX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE874270EDD;
	Tue,  1 Jul 2025 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368040; cv=none; b=R7lEThe3D7fyK6XiuZyt1gLCA7WUVzSj5ljjOcnhig9vMdjNnJ0aAewq6SBef//cAHpgo7SZHSVEyMZ1ETVfX8/TNqgXuf/1puBtts4JDhbqo8sP/f49hqAkie0guU/3eFdg2peFeVJ2o7buik8kjDo7bZR+6Fh9q5YFexpZuqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368040; c=relaxed/simple;
	bh=QvUkAIj85QispQ/Cda6kxqhm5CHP0RxSRAtQsd9DPbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEMyVxmTFYjFBZbQ0jNNX5yxisawFeS0Dxb6dM73rPhNBnjlSKf2LmDcl8ILOrRtxPh8Ah1RSml+ZgCGFfIxdH2vhMUa/0jPEbbZaTs7TaPv7cs+hCkiHibsdedtFh7eslwonCB5p08Ox/fUfkycg4zpxV4QHlOnXX/Bu20K+/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7GZChhX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E43C4CEEB;
	Tue,  1 Jul 2025 11:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751368039;
	bh=QvUkAIj85QispQ/Cda6kxqhm5CHP0RxSRAtQsd9DPbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7GZChhX1jIGglTCB6ytto/fvvg7NWrSPNfZQwWfVXH4VPxJ37v2OCyFpfp8ZMofi
	 yzD6f21+FrwFsN6thLLYUbL89IDVsaJcI3rcY5r3we9p0EcOO0ZkdH9vQYjFeHLOAc
	 vjF8cQqH27UlHDnmQr8w542/Wd3U5bgEigvxAmG/pO+kdfvctNi3tNeD+hkJo8XBvn
	 AGnDrS+QOPOJ2lql/PMSLP4x0+drp3IILj/Ax06aJcixFn8w36sa30oRzZw/lRK7Fl
	 xNk+CqlU9x1is+X07hzCaNGH0XONGITOUgiU31yJtkTUfgZrXe9sLlJz9TLMUG2wlF
	 JafNuKRYR6ZNg==
Date: Tue, 1 Jul 2025 12:07:13 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Message-ID: <20250701110713.GL10134@google.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
 <20250625164119.1068842-3-elder@riscstar.com>
 <20250627125119.GF10134@google.com>
 <0eda5bf4-ce63-43da-9c2f-7d4ec902758c@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0eda5bf4-ce63-43da-9c2f-7d4ec902758c@riscstar.com>

On Fri, 27 Jun 2025, Alex Elder wrote:

> On 6/27/25 7:51 AM, Lee Jones wrote:
> > > @@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
> > >   	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
> > >   };
> > > +static const struct regmap_config spacemit_p1_regmap_config = {
> > > +	.reg_bits = 8,
> > > +	.val_bits = 8,
> > > +	.max_register = 0xaa,
> > > +};
> > Suggest making this more widely useful by adding the 'max_register'
> > attribute to 'struct simple_mfd' and conditionally overriding
> > regmap_config_8r_8v's value during probe.
> 
> So you're suggesting I make a general improvement to
> "simple-mfd-i2c.c", because everybody else just uses
> the generic fallback regmap config?

Yes, exactly that.

> (I'm asking because at first I didn't understand your
> statement, and the "more widely useful" comment).
> 
> I would be happy to do this, and it's not that hard.
> Can I do it as a follow-on patch though?  It's adding
> scope (again), beyond what I anticipated and honestly
> I'm ready to be done with this...

Good job you're not working on a complex addition then.  =;-)

> Anyway, if you say "no" I'll send another version of
> this series today.

A follow-up would be good, thanks.

-- 
Lee Jones [李琼斯]

