Return-Path: <linux-rtc+bounces-1876-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8425E96E19E
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Sep 2024 20:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E7F21F22F0C
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Sep 2024 18:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7052B17A938;
	Thu,  5 Sep 2024 18:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKR11tVw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0021C2E;
	Thu,  5 Sep 2024 18:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725559795; cv=none; b=Xr18FvXjTNR/LfSXmUlkMIEhJzfFUTwWaAli3JLtuZ8H7Z2IbqWCPW1EWYBSRQjeUE8ucY/pL6bufVDUp3oDiDguMlydiFe1l+rsAMkL/SYlqYOahtXKogxIxSYT0R+RROmePbp79UjCvH9/R+H/R2hHYm7rYVzvE4tg2cVaeNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725559795; c=relaxed/simple;
	bh=2Kr5c7ACVjf3HcGMzj4Ae2HcwBKC3Tm5MDry+iTMW38=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ncsa0QWPhGIojKTQTXaTwPsWrSmjatGxWjafnwzmP0bdHgoUlKbmlkwhJoOmk1pTOK3ZuRFbp6blaqrPoRTNblkMxT0bsOwsQ8W3Dr1jehpya6hrhHICj/GN1JJX1E8Nf3CCHltJZDmyUmG3Yskc2Ja/ZuHHc8k8Lkc5e1Y0ud4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKR11tVw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BC0C4CEC3;
	Thu,  5 Sep 2024 18:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725559795;
	bh=2Kr5c7ACVjf3HcGMzj4Ae2HcwBKC3Tm5MDry+iTMW38=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UKR11tVwN3Zct+7Kpwpg3CyRWI5i1xe8rko66a7OD+OeS8dNzNoXqQraqnH7UkXON
	 llTaJnxjE8a7pHBO+qymvjgm8Qf0li/2UOlE9tL8+2SZaKzZzGJFTpP2BJrlN4sydQ
	 t9Dce5y+RNcRXHEXUKxeMMjM34TlxUw6X5DrSo/3OJ6NNJqs8Pfb/woYdq7Rm4KJix
	 3VBGG2KdTl+laUl3dWgKr0nUrJTtMliwTTdMW9ac6HHXqgHe7ZqLdxbORgW/fPtFv/
	 aFdOVk7aM9P0q8d63lNxngpAVozVVjcP72O/9PW+F0qchbCNeuHYu5p828OviQo4HK
	 bbGPFUPpAAHxA==
Message-ID: <c744cf7a70a3f97722146215a7620cfb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d8303146-89e0-4229-a3fe-9f3c42434045@tuxon.dev>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-8-claudiu.beznea.uj@bp.renesas.com> <83fac884d749bda0cf0b346e4e869bc8.sboyd@kernel.org> <d8303146-89e0-4229-a3fe-9f3c42434045@tuxon.dev>
Subject: Re: [PATCH v3 07/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: alexandre.belloni@bootlin.com, claudiu beznea <claudiu.beznea@tuxon.dev>, conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Thu, 05 Sep 2024 11:09:52 -0700
User-Agent: alot/0.10

Quoting claudiu beznea (2024-09-04 05:17:30)
> On 03.09.2024 22:48, Stephen Boyd wrote:
> >=20
> > The node name should be something like clock-<frequency> but if the
> > frequency is different per-board then I don't know what should happen
> > here.
>=20
> The frequency should be always around 32768 Hz but not necessarily exactly
> 32768 Hz. It depends on what is installed on the board, indeed. RTC can do
> time error adjustments based on the variations around 32768 Hz.
>=20
> > Can you leave the vbattb_xtal phandle up above and then require
> > the node to be defined in the board with the proper frequency after the
> > dash?
>=20
> Is it OK for you something like this (applied on top of this series)?

Yes, it's too bad we can't append to a property in DT, or somehow leave
alone certain cells and only modify one of them.

