Return-Path: <linux-rtc+bounces-1318-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B47D190983B
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Jun 2024 14:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D1021F213CE
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Jun 2024 12:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12C045957;
	Sat, 15 Jun 2024 12:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jx9nreAe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BFDD53B;
	Sat, 15 Jun 2024 12:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718453946; cv=none; b=tMFLPCEmzAFQNaqMiSw/G08z+HjIL1S4r7o4UZxqXjda1ON0lPbROvwkVw7mrQv2JCFhTec/p6Hwcre0/fQY4FKrsTzgMfel+Z8r3D8Pxj9qYMsRBM43GSTLZbr8QB7C6zBlNm/d21VL2gAjfSMgg/dPP1xL09MKXZaCJMK+7sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718453946; c=relaxed/simple;
	bh=c3LOUimTOgjYgxCe7mgmtZ0TilMkkoAgn0uGF7XPXSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsJ8HxspoT5RzJCO7gHULXs/VItTHQMJ7Z8GG1s3gvfREKDjzEBkXaWAqy9bOyQ7EfVpzeOnS+C8BEpMoIAPMAW3e+tcxkUfbQcO+qbYMLNyyrc9a6MD8O5SQ0xtVNsbhAjZ0CxA7x6/GXVjZLhQHOlULQE6HVBMfZ7/67bGkjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jx9nreAe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23A6C116B1;
	Sat, 15 Jun 2024 12:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718453946;
	bh=c3LOUimTOgjYgxCe7mgmtZ0TilMkkoAgn0uGF7XPXSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jx9nreAephcev3aQc1yDxAopimX/WHaXwd2PY8oz9XC4IuIjpE0U91DkLnd01/4v0
	 r2sfmc9RqqcHZW2Ut/mwDYh+LuL0+0AKMtTEXYhanhvggPSN5OcjSf0tTXHk2VeDa/
	 0xh4KFfKaZQLeMVXLMPZ7imiI2+LCL5BsHpb//9plSG/PY0PflXpspMBcksyQ7z7dW
	 hropCkG4qv1paaTIcaik9M+7yOyLTQFMKNxyK+MGJtvE9F2vRxuzkWGRLXO23unP1e
	 jZj/fowHlBexHxRYv6In09KF7igp3GOt1jPPVhL7G7IGTpZwfVEemcDlk1GKNhtEnW
	 FQj4iKGWciO7Q==
Date: Sat, 15 Jun 2024 13:19:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lee@kernel.org, alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 03/12] dt-bindings: mfd: renesas,rzg3s-vbattb: Document
 VBATTB
Message-ID: <20240615-unhitched-slain-446130658f87@spud>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-4-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KgMpSnhLPuKUTcKs"
Content-Disposition: inline
In-Reply-To: <20240614071932.1014067-4-claudiu.beznea.uj@bp.renesas.com>


--KgMpSnhLPuKUTcKs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 14, 2024 at 10:19:23AM +0300, Claudiu wrote:
> +patternProperties:
> +  "^clock-controller@[0-9a-f]+$":
> +    $ref: /schemas/clock/renesas,rzg3s-vbattb-clk.yaml#
> +    description: VBATTCLK clock

Being a bit of a pedant here, but isn't the address known? You leaving
room for future devices with it at a different offset?

--KgMpSnhLPuKUTcKs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZm2GtAAKCRB4tDGHoIJi
0qh+AQDe2ETEMfJg2zLBMg80bCdHPK3fEfD+/bsONeLjeZ+i3wD/QZopZWa/hfbg
8bbOtE9xflHZXedUeOG2jq2ALO8qTQU=
=CLaW
-----END PGP SIGNATURE-----

--KgMpSnhLPuKUTcKs--

