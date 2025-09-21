Return-Path: <linux-rtc+bounces-5004-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA7EB8DFA1
	for <lists+linux-rtc@lfdr.de>; Sun, 21 Sep 2025 18:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D5773AA4D9
	for <lists+linux-rtc@lfdr.de>; Sun, 21 Sep 2025 16:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7914F23BD02;
	Sun, 21 Sep 2025 16:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHM8iKFp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F8A239E88;
	Sun, 21 Sep 2025 16:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758472098; cv=none; b=ArNEcO8YWPbcNp6Tys2VpbcsfQcp5oCrCBAvbNi46lDuDsdUSOHtC7IZC5vrkMQZ9eWOJyJq5uEPEdXmQJc3wt5udNQ0hnplFiUVc8+gI+BnhOoc6uB7Ja7qePQlyN+Dl5xlAr+kQ+w+XYLZld/aGmaXG7gHgevd958ZJA+mcQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758472098; c=relaxed/simple;
	bh=t8xX8t1MHQy2BLbPtmxnp2UmkdgJLoVSrV6uG9zZVVY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=iEfqdKvKmMLUZOOeCVozldwAhm3l0uci/tI2eKqGQCFHauBddSqIV3a55hfU9ufExVpxLkgDTfhfgVUPwCTXED9KIxRNt4T3ulUCuMk6fs9O1cNPpbPa2S8sjVhR0c8JW8Z9sKc/GxOqPfWxU8zVCcpuyGwkB51UGBVsyJaXOy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHM8iKFp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83258C4CEE7;
	Sun, 21 Sep 2025 16:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758472096;
	bh=t8xX8t1MHQy2BLbPtmxnp2UmkdgJLoVSrV6uG9zZVVY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OHM8iKFpI7FOXH8vOTEdMBh9A+e9r5BLkdUsHBAXNhtTYIWKyause8jwleWIVdv+2
	 jXEO/6ntPkZ5+WgEYpGKUWEv17IXFSe2clLqrI++5XSm0GGX8KlOLixXiIyj8DfGPx
	 szAjN/Tymz329v27yx/mAvS5ymmkGJE2kYXytLyxu40nOh3snHWDMhnlC11pi3hfwm
	 QKQWfff1BKXqSHdkoQ7kYKCZOadh6piG+cRLEb40spLQPsv79GKWvbQgK85Ljp6lwD
	 CZ0GH+/TCVaouIRM2pyVLbRFyONgslCS57pSaWQ0+K3XUBB6g/lRMVwL6w4xAy+GvA
	 +JFVT39mkaDXQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250914124227.2619925-6-ivo.ivanov.ivanov1@gmail.com>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com> <20250914124227.2619925-6-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1 5/7] clk: s2mps11: add the support for S2MPS16 PMIC clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Sun, 21 Sep 2025 09:28:14 -0700
Message-ID: <175847209498.4354.5959249048237150557@lazor>
User-Agent: alot/0.11

Quoting Ivaylo Ivanov (2025-09-14 05:42:25)
> Add the support for S2MPS16 PMIC clock, which is functionally the same
> as the currently supported ones, with the exception of a different
> register.
>=20
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

