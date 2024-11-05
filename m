Return-Path: <linux-rtc+bounces-2463-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 380C19BD9B0
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Nov 2024 00:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3D1E283F6B
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Nov 2024 23:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46AE216A1D;
	Tue,  5 Nov 2024 23:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ssu9d7EZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CED1D415B;
	Tue,  5 Nov 2024 23:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730849183; cv=none; b=L2vlF8RARqJcyBlRSPCTDQS3yv3shCEbzfkve5KiVva88rWmraajukYrYcw8ujxnIiy6D2wMVdiLueUPGJG1bbufw83icpcp/lPVZ3qQEhkncVAGLbBgi+ny22nhJgXZbxnPbGDgQz97qnoP0VDZEiIweMCmOScxipYhQ+g3ggE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730849183; c=relaxed/simple;
	bh=meCr4j+EzatS1vCyUkDdGxdMMQLjghCYqVBTaPkg8AM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=riLGQhMF2XadDBUGEwYjokrxpPjY8TeGA93+spSXPb5LgAOgLMLRGKbnbn3nSrMszX33QS5TaFM+ekXkD4fdIx5iA0mYnRnQzoQbVKs+yaKdHCfTT56KrbNtD6fBoLaja4jI8AgnxTOv1Rf6+PA1/5qUWCpsId+Sd0podg91Efk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ssu9d7EZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA7AC4CECF;
	Tue,  5 Nov 2024 23:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730849183;
	bh=meCr4j+EzatS1vCyUkDdGxdMMQLjghCYqVBTaPkg8AM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ssu9d7EZToG1O1srfhcyBcwecClH1aKzUwDOVuWr6Ye03ALTFrmNdoHz7xbosSNMy
	 19XjZ8Al9IlLd+ywnJEnnESGLfegPqZyQMqVOK/E0UgWoBbQ3uPAppULCaw71VMP6C
	 tlHfJeNqKYNAcHuUYqM5ibZKDFGRnR2jkWTwVVKQVsJMAgdL7NCYZkAeLPVXAOr+Fn
	 NNnUbxwKJq8IhxMQLjloNnqkKpBdj9QEZkPwLdXbuKRZ7F7xU96gMISyKAyWljWNPO
	 fmK6Naut0NXtGpRqoXYf/KCPrKGA4FGYEDtZfitESLvC/qYwbuDAHFJdFLsjMxFR8d
	 FrJV/I2WBUFHA==
Message-ID: <8aa04e346f65bc4fcb0efc47a4f0550a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241101095720.2247815-3-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com> <20241101095720.2247815-3-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v6 2/9] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, alexandre.belloni@bootlin.com, conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Tue, 05 Nov 2024 15:26:20 -0800
User-Agent: alot/0.10

Quoting Claudiu (2024-11-01 02:57:13)
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Add devm_clk_hw_register_gate_parent_hw() macro to allow registering
> devres managed gate clocks providing struct clk_hw object as parent.
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Please fix the subject line to not have linux/clk-provider.h because
it's redundant.

