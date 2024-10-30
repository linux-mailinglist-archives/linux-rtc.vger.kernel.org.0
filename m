Return-Path: <linux-rtc+bounces-2384-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6ED9B6D13
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2024 20:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBEF51C21296
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2024 19:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823D81D0400;
	Wed, 30 Oct 2024 19:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnmoJZMR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6631BD9F0;
	Wed, 30 Oct 2024 19:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730317680; cv=none; b=ou34TCOsvOWFYQMrzMzwf5wCJPSUnwFx1WdxK1INHR4n+r/DroH1h+6uYSl7DoNg5t1xpIHebEM8wp/4sej4ur9NPbCeQbVyFmbFi0xufhplFcaYXlHB+8IDfS2+WloHt0pXFRAHqH25pXP4WqSe+PVgONDdEj7ZNkxSRp5qgz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730317680; c=relaxed/simple;
	bh=or2KvqJqW9neTrGs27NJV1Mi505S8IEzYJIDkgKZoEc=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=okuBjsTmx8QFUJyTPcABns0rkIrjsxnQF6SR+wGj1StQ2D3b12CD6HHrPS1gVZxJLO9V1Gu8/nY6vkgfJh59oiTFbtgbChtvrFpGxwgCuoOWTd7X2n/H0BNIHzyjPnX5pY2jTSogmBSi+uGBOQnh5PuPwKOL4i39YCZiTdQwMrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnmoJZMR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC520C4CED1;
	Wed, 30 Oct 2024 19:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730317679;
	bh=or2KvqJqW9neTrGs27NJV1Mi505S8IEzYJIDkgKZoEc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GnmoJZMRD/rtg+jn7BGx08wKVT8M6G63TvnrrDXecde7e1/4BVYddIh9qHTKiKD+d
	 Juy6Iuemeemw0Q6wZS6kRnwYXm2AFn/eNIyiUrTUTDJqukFaX7E/ue1FeYZVp85f9M
	 yV4jet/k5v3Lbo4Bm7cDpi1Fyaa0OK6yawAYkjNyIA1jiDjmfJl43dZqFJyV0QCsr5
	 fGTL98dbU6d/bS/kMrUYBs2jZSrk2TmF3SZcmHak5e9hydEJTkhUNhBWY5Op42El/E
	 69wT7rXGtucgP3jDqHAF1Ry03kQrI3y1NpsuvaG6XRuIBhfiyV6fUhGpM6ftoWvyIr
	 cNAPyHTuNTcKw==
Message-ID: <d9d5ef74df0564cbec46c093bd611ab8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241030110120.332802-3-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com> <20241030110120.332802-3-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 02/10] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, alexandre.belloni@bootlin.com, conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Wed, 30 Oct 2024 12:47:57 -0700
User-Agent: alot/0.10

Subject can just be "clk: Add devm_clk_hw_register_gate_parent_hw()"

Quoting Claudiu (2024-10-30 04:01:12)
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Add devm_clk_hw_register_gate_parent_hw() macro to allow registering
> devres managed gate clocks providing struct clk_hw object as parent.
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

